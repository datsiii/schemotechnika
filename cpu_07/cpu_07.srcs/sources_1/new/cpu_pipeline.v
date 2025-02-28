`timescale 1ns / 1ps

module cpu_pipeline(
    input clk, reset,
    output pc
);
localparam PROG_ADDR_WIDTH = 6;
localparam PROG_DATA_WIDTH = 40;
localparam PROG_SIZE = 2**PROG_ADDR_WIDTH; 

localparam MEM_ADDR_WIDTH = 5;
localparam MEM_DATA_WIDTH = 32;
localparam MEM_SIZE = 2**MEM_ADDR_WIDTH;

localparam POH_ADDR_WIDTH = 4;
localparam POH_DATA_WIDTH = MEM_DATA_WIDTH;
localparam POH_SIZE = 9;

localparam COP_WIDTH = 4;
localparam LITERAL = MEM_DATA_WIDTH;

reg [PROG_DATA_WIDTH-1:0] prog_mem [0:PROG_SIZE-1];

reg [ MEM_DATA_WIDTH-1:0] data_mem [0:MEM_SIZE-1];
reg [ MEM_ADDR_WIDTH-1:0] mem_addr_write;
reg [ MEM_DATA_WIDTH-1:0] mem_data_write;
reg mem_Wen;

reg [PROG_ADDR_WIDTH-1:0] pc, next_pc;

localparam NOP = 0, INCR = 1, WRITE_REG = 2, MEM_TO_REG = 3, 
           REG_TO_MEM = 4, JMP = 5, JMP_LESS = 6, REG_TO_REG = 7, SUB = 8, WRITE_MEM = 9;

localparam FETCH = 0, DECODE = 1, MEM_ACCESS = 2, EXECUTE = 3, WRITEBACK = 4;
localparam STAGE_COUNT = 5;
localparam SUB_RES = 6;

reg [ MEM_DATA_WIDTH-1:0] alu_op1, next_alu_op1;
reg [ MEM_DATA_WIDTH-1:0] alu_op2, next_alu_op2;
reg [ MEM_DATA_WIDTH-1:0] alu_res, next_alu_res;
reg [ MEM_DATA_WIDTH-1:0] alu_res2, next_alu_res2;

reg POH_Wen;
reg  [POH_ADDR_WIDTH-1:0] POH_AdrA, POH_AdrB, POH_W_addr;
wire [POH_DATA_WIDTH-1:0] POH_out_a, POH_out_b;
reg  [POH_DATA_WIDTH-1:0] POH_W_data;
reg_file POH(
    .clk(clk),
    .wen(POH_Wen),
    .reset(reset),
    .addr_r_a(POH_AdrA), 
    .addr_r_b(POH_AdrB),
    .w_data(POH_W_data),
    .w_addr(POH_W_addr),
    .out_a(POH_out_a),
    .out_b(POH_out_b)
);

reg lz, next_lz; 

initial
    begin
        $readmemb("mem.mem", prog_mem);
    end

reg [PROG_DATA_WIDTH-1:0] cmd_reg [0:STAGE_COUNT-1], next_cmd_reg[0:STAGE_COUNT-1];

wire [      COP_WIDTH-1:0]         cop [0:STAGE_COUNT-1];
wire [ POH_ADDR_WIDTH-1:0]   cmd_addr1 [0:STAGE_COUNT-1];// 
wire [ POH_ADDR_WIDTH-1:0]   cmd_addr2 [0:STAGE_COUNT-1];// = cmd_reg[  PROG_DATA_WIDTH-COP_WIDTH-POH_ADDR_WIDTH-1 -: POH_ADDR_WIDTH  ];
wire [        LITERAL-1:0]     literal [0:STAGE_COUNT-1];// = cmd_reg[                                   LITERAL-1 -: LITERAL         ];
wire [PROG_ADDR_WIDTH-1:0] addr_to_jmp [0:STAGE_COUNT-1];// 

genvar i;
generate
    for (i = 0; i < STAGE_COUNT; i = i + 1)
    begin
        assign         cop[i] = cmd_reg[i][                           PROG_DATA_WIDTH-1 -: COP_WIDTH       ];
        assign   cmd_addr1[i] = cmd_reg[i][                 PROG_DATA_WIDTH-COP_WIDTH-1 -: POH_ADDR_WIDTH  ];
        assign   cmd_addr2[i] = cmd_reg[i][  PROG_DATA_WIDTH-COP_WIDTH-POH_ADDR_WIDTH-1 -: POH_ADDR_WIDTH  ];
        assign     literal[i] = cmd_reg[i][                                   LITERAL-1 -: LITERAL         ];
        assign addr_to_jmp[i] = cmd_reg[i][                 PROG_DATA_WIDTH-COP_WIDTH-1 -: PROG_ADDR_WIDTH ];        
    end 
endgenerate

generate
    for (i = 0; i < STAGE_COUNT; i = i + 1)
    begin
        always@(posedge clk)
            if (reset) 
                cmd_reg[i] <= 0;
            else
                cmd_reg[i] <= next_cmd_reg[i];       
    end 
endgenerate


/* ----- Стадия 0 (FETCH) ----- */

always@(*)
begin
    if ( cop[WRITEBACK] == JMP
    || ( cop[WRITEBACK] == JMP_LESS && lz == 0 )
    )
        next_cmd_reg[FETCH] <= 0;
    else
        next_cmd_reg[FETCH] <= prog_mem[pc];       
end




/* ----- Стадия 1 (DECODE) ----- */

always@(*)
begin
    if ( cop[WRITEBACK] == JMP
    || ( cop[WRITEBACK] == JMP_LESS && lz == 0 )
    )
        next_cmd_reg[DECODE] <= 0;
    else
        next_cmd_reg[DECODE] <= cmd_reg[FETCH];       
end


// РОН Порт A и Порт В
always@(*)
begin
    case (cop[DECODE])
        INCR, MEM_TO_REG, REG_TO_REG, WRITE_MEM:
            begin
                POH_AdrA <= cmd_addr1[DECODE];
                POH_AdrB <= 1;
            end    
        REG_TO_MEM, SUB:
            begin
                POH_AdrA <= cmd_addr1[DECODE];
                POH_AdrB <= cmd_addr2[DECODE]; 
            end 
        default:
            begin
                POH_AdrA <= cmd_addr1[DECODE];
                POH_AdrB <= cmd_addr2[DECODE]; 
            end     
    endcase           
end 




/* ----- Стадия 2 (MEM_ACCESS) ----- */

always@(*)
begin
    if ( cop[WRITEBACK] == JMP
    || ( cop[WRITEBACK] == JMP_LESS && lz == 0 )
    )
        next_cmd_reg[MEM_ACCESS] <= 0;
    else
        next_cmd_reg[MEM_ACCESS] <= cmd_reg[DECODE];       
end

always@(posedge clk)
    if (reset)
        begin
            alu_op1 <= 0;
            alu_op2 <= 0;
        end
    else 
        begin
            alu_op1 <= next_alu_op1;
            alu_op2 <= next_alu_op2;
        end 

function check_MIPS(
    input [      COP_WIDTH-1:0 ] read_cop,
    input [ POH_ADDR_WIDTH-1:0 ] read_addr,
    
    input [      COP_WIDTH-1:0 ] write_cop,
    input [ POH_ADDR_WIDTH-1:0 ] write_addr1,
    input [ POH_ADDR_WIDTH-1:0 ] write_addr2
);
begin
    case(read_cop)
        WRITE_MEM, REG_TO_REG, INCR, SUB, MEM_TO_REG, REG_TO_MEM:
            case(write_cop)
                // Одноадресные
                INCR, WRITE_REG:
                    check_MIPS = read_addr == write_addr1; 
                
                // Двухадресные
                MEM_TO_REG, REG_TO_REG:
                    check_MIPS = read_addr == write_addr2;
                    
                // Вычитание
                SUB: 
                    check_MIPS = read_addr == SUB_RES;
                
                default:    
                    check_MIPS = 0;
            endcase
        default:    
            check_MIPS = 0;    
    endcase
end      
endfunction

// Регистры операндов
always@(*)      
begin
    case(cop[MEM_ACCESS]) 
       MEM_TO_REG:
            if ( check_MIPS ( 
                cop[MEM_ACCESS], cmd_addr1[MEM_ACCESS],
                cop[EXECUTE], cmd_addr1[EXECUTE], cmd_addr2[EXECUTE]
            ))
                next_alu_op1 <= data_mem[next_alu_res];
            
            else if ( check_MIPS ( 
                cop[MEM_ACCESS], cmd_addr1[MEM_ACCESS],
                cop[WRITEBACK], cmd_addr1[WRITEBACK], cmd_addr2[WRITEBACK]
            ))     
                next_alu_op1 <= data_mem[alu_res];   
 
            else
                next_alu_op1 <= data_mem[POH_out_a];   
                 
       default:
            if ( check_MIPS ( 
                cop[MEM_ACCESS], cmd_addr1[MEM_ACCESS],
                cop[EXECUTE], cmd_addr1[EXECUTE], cmd_addr2[EXECUTE]
            ))
                next_alu_op1 <= next_alu_res; 
             
            else if ( check_MIPS ( 
                cop[MEM_ACCESS], cmd_addr1[MEM_ACCESS],
                cop[WRITEBACK], cmd_addr1[WRITEBACK], cmd_addr2[WRITEBACK]
            ))     
                next_alu_op1 <= alu_res;      
                   
            else       
                next_alu_op1 <= POH_out_a;       
    endcase   
end


always@(*)   
    if ( check_MIPS ( 
        cop[MEM_ACCESS], cmd_addr2[MEM_ACCESS],
        cop[EXECUTE], cmd_addr1[EXECUTE], cmd_addr2[EXECUTE]
    ))   
        next_alu_op2 <= next_alu_res;
        
    else if ( check_MIPS ( 
        cop[MEM_ACCESS], cmd_addr2[MEM_ACCESS],
        cop[WRITEBACK], cmd_addr1[WRITEBACK], cmd_addr2[WRITEBACK]
    ))     
        next_alu_op2 <= alu_res;  
        
    else
        next_alu_op2 <= POH_out_b;


/* ----- Стадия 3 (EXECUTE) ----- */

always@(*)
begin
    if ( cop[WRITEBACK] == JMP
    || ( cop[WRITEBACK] == JMP_LESS && lz == 0 )
    )
        next_cmd_reg[EXECUTE] <= 0;
    else
        next_cmd_reg[EXECUTE] <= cmd_reg[MEM_ACCESS];       
end


always@(posedge clk)
    if (reset)
        begin
            alu_res <= 0;
            alu_res2 <= 0;
            lz <= 0;
        end
    else
        begin
            alu_res <= next_alu_res;
            alu_res2 <= next_alu_res2;
            lz <= next_lz;
        end


always@(*)
    case(cop[3])
        INCR:
            next_alu_res <= alu_op1 + alu_op2;
        MEM_TO_REG, REG_TO_REG:
            next_alu_res <= alu_op1; 
        WRITE_REG:
            next_alu_res <= literal[3]; 
        SUB:
            next_alu_res <= alu_op1 - alu_op2;
    default:
            next_alu_res <= alu_op1;                
    endcase

always@(*)
    next_alu_res2 <= alu_op2;

// Флаг lz
always@(*)
begin
    case(cop[3])
            SUB: next_lz <= next_alu_res[POH_DATA_WIDTH-1];          
        default: next_lz <= lz;
    endcase
end


/* ----- Стадия 4 (WRITEBACK) ----- */

always@(*)
begin
    if ( cop[WRITEBACK] == JMP
    || ( cop[WRITEBACK] == JMP_LESS && lz == 0 )
    )
        next_cmd_reg[WRITEBACK] <= 0;
    else
        next_cmd_reg[WRITEBACK] <= cmd_reg[EXECUTE];       
end  
 
always@(*)
    case(cop[4])
        INCR:
            begin
                POH_Wen <= 1;
                POH_W_addr <= cmd_addr1[4];
                POH_W_data <= alu_res;
            end
        WRITE_REG:
            begin
                POH_Wen <= 1;
                POH_W_addr <= cmd_addr1[4];
                POH_W_data <= alu_res;
            end 
        MEM_TO_REG, REG_TO_REG:
            begin
                POH_Wen <= 1;
                POH_W_addr <= cmd_addr2[4];
                POH_W_data <= alu_res;
            end
        SUB:
            begin
                POH_Wen <= 1;
                POH_W_addr <= 6;
                POH_W_data <= alu_res;
            end 
    default:
            begin
                POH_Wen <= 0;
                POH_W_addr <= cmd_addr1[4];
                POH_W_data <= alu_res;
            end                 
    endcase


always@(posedge clk)
    if (mem_Wen)
            data_mem[mem_addr_write] <= mem_data_write;  
 
always@(*)      
    case(cop[4])
        REG_TO_MEM:
            begin
                mem_addr_write <= alu_res2;
                mem_data_write <= alu_res;
                mem_Wen <= 1;
            end
        WRITE_MEM:
            begin
                mem_addr_write <= alu_res;
                mem_data_write <= literal[4];
                mem_Wen <= 1;
            end
        default:
            begin
                mem_addr_write <= alu_res2;
                mem_data_write <= alu_res;
                mem_Wen <= 0;
            end
        endcase    
 
always@(posedge clk)
    if (reset)
        pc <= 0;
    else
        pc <= next_pc;      
 
always@(*)
    case(cop[4])
            JMP: next_pc <= addr_to_jmp[4];
            
       JMP_LESS:
            if (lz)
                next_pc <= pc + 1;
            else
                next_pc <= addr_to_jmp[4];  
                        
        default: next_pc <= pc + 1;
    endcase
  
    
endmodule
