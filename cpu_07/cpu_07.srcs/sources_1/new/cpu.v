`timescale 1ns / 1ps

module cpu(
    input clk, reset,
    output [1:0] stage
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
    reg [PROG_DATA_WIDTH-1:0] cmd_reg, next_cmd_reg;
    localparam NOP = 0, INCR = 1, WRITE_REG = 2, MEM_TO_REG = 3, 
               REG_TO_MEM = 4, JMP = 5, JMP_LESS = 6, REG_TO_REG = 7, SUB = 8, WRITE_MEM = 9;
    
    reg [1:0] stage;
    localparam FETCH = 0, DECODE = 1, MEM_ACCESS = 2, EXECUTE = 3;
    
    reg [ MEM_DATA_WIDTH-1:0] alu_op1, next_alu_op1;
    reg [ MEM_DATA_WIDTH-1:0] alu_op2, next_alu_op2;
    
    wire [      COP_WIDTH-1:0]         cop = cmd_reg[                           PROG_DATA_WIDTH-1 -: COP_WIDTH       ];
    wire [ POH_ADDR_WIDTH-1:0]   cmd_addr1 = cmd_reg[                 PROG_DATA_WIDTH-COP_WIDTH-1 -: POH_ADDR_WIDTH  ];
    wire [ POH_ADDR_WIDTH-1:0]   cmd_addr2 = cmd_reg[  PROG_DATA_WIDTH-COP_WIDTH-POH_ADDR_WIDTH-1 -: POH_ADDR_WIDTH  ];
    wire [        LITERAL-1:0]     literal = cmd_reg[                                   LITERAL-1 -: LITERAL         ];
    wire [PROG_ADDR_WIDTH-1:0] addr_to_jmp = cmd_reg[                 PROG_DATA_WIDTH-COP_WIDTH-1 -: PROG_ADDR_WIDTH ];
    
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
    
    always@(posedge clk)
        if (reset)
            stage <= 0;
        else    
            stage = stage + 1;
    
    always@(posedge clk)
    begin
        if (reset)
            begin
                pc <= 0;
                alu_op1 <= 0;
                alu_op2 <= 0;
                cmd_reg <= 0;
                lz <= 0;
            end
        else 
            begin
                pc <= next_pc;
                alu_op1 <= next_alu_op1;
                alu_op2 <= next_alu_op2;
                cmd_reg <= next_cmd_reg;
                lz <= next_lz;
            end 
        
        if (mem_Wen)
            data_mem[mem_addr_write] <= mem_data_write;       
    end    
    
    // Счётчик команд
    always@(*)
    begin
        case(stage)
            EXECUTE:
                case(cop)
                        JMP: next_pc <= addr_to_jmp;
                   JMP_LESS:
                        if (lz)
                            next_pc <= pc + 1;
                        else
                            next_pc <= addr_to_jmp;          
                    default: next_pc <= pc + 1;
                endcase
            default:
                next_pc <= pc;                
        endcase
    end
    
    // Флаг lz
    always@(*)
    begin
        case(stage)
            EXECUTE:
                case(cop)
                        SUB: next_lz <= POH_W_data[POH_DATA_WIDTH-1];          
                    default: next_lz <= lz;
                endcase
            default:
                next_lz <= lz;                
        endcase
    end
    
    // Регистр команд
    always@(*)
    begin
        case(stage)
            FETCH:  
                next_cmd_reg <= prog_mem[pc];
          default:   
                next_cmd_reg <= cmd_reg; 
          endcase
    end
    
    // РОН Порт A и Порт В
    always@(*)
    begin
        case(stage)
            DECODE:
                case (cop)
                    INCR, MEM_TO_REG, REG_TO_REG, WRITE_MEM:
                        begin
                            POH_AdrA <= cmd_addr1;
                            POH_AdrB <= 1;
                        end    
                    REG_TO_MEM, SUB:
                        begin
                            POH_AdrA <= cmd_addr1;
                            POH_AdrB <= cmd_addr2; 
                        end 
                    default:
                        begin
                            POH_AdrA <= cmd_addr1;
                            POH_AdrB <= cmd_addr2; 
                        end     
                endcase
            default:
                begin
                    POH_AdrA <= cmd_addr1;
                    POH_AdrB <= cmd_addr2; 
                end       
        endcase        
    end 
    
    // РОН Порт для записи          
    always@(*)
    begin
        case(stage)
            EXECUTE:
                case(cop)
                    INCR:
                        begin
                            POH_Wen <= 1;
                            POH_W_addr <= cmd_addr1;
                            POH_W_data <= alu_op1 + alu_op2;
                        end
                    WRITE_REG:
                        begin
                            POH_Wen <= 1;
                            POH_W_addr <= cmd_addr1;
                            POH_W_data <= alu_op1;
                        end 
                    MEM_TO_REG, REG_TO_REG:
                        begin
                            POH_Wen <= 1;
                            POH_W_addr <= cmd_addr2;
                            POH_W_data <= alu_op1;
                        end
                    SUB:
                        begin
                            POH_Wen <= 1;
                            POH_W_addr <= 6;
                            POH_W_data <= alu_op1 - alu_op2;
                        end 
                default:
                        begin
                            POH_Wen <= 0;
                            POH_W_addr <= cmd_addr1;
                            POH_W_data <= alu_op1;
                        end                 
                endcase
            default:
                begin
                    POH_Wen <= 0;
                    POH_W_addr <= cmd_addr1;
                    POH_W_data <= alu_op1;
                end     
        endcase
    end  
    
    // Регистры операндов
    always@(*)      
    begin
        case(stage)
            MEM_ACCESS:
                case(cop)
                    INCR, SUB, REG_TO_MEM, WRITE_MEM, REG_TO_REG: 
                        begin
                            next_alu_op1 <= POH_out_a;
                            next_alu_op2 <= POH_out_b;
                        end
                    WRITE_REG:
                        begin
                            next_alu_op1 <= literal;
                            next_alu_op2 <= alu_op2;
                        end   
                   MEM_TO_REG:
                        begin
                            next_alu_op1 <= data_mem[POH_out_a];
                            next_alu_op2 <= alu_op2;
                        end
                   default:
                        begin
                            next_alu_op1 <= alu_op1;
                            next_alu_op2 <= alu_op2; 
                        end          
                endcase
            default:
                begin
                    next_alu_op1 <= alu_op1;
                    next_alu_op2 <= alu_op2; 
                end        
        endcase        
    end
    
    
    // Память данных для записи
    always@(*)      
    begin
        case(stage)
            EXECUTE:
                case(cop)
                    REG_TO_MEM:
                        begin
                            mem_addr_write <= alu_op2;
                            mem_data_write <= alu_op1;
                            mem_Wen <= 1;
                        end
                    WRITE_MEM:
                        begin
                            mem_addr_write <= alu_op1;
                            mem_data_write <= literal;
                            mem_Wen <= 1;
                        end
                    default:
                        begin
                            mem_addr_write <= alu_op2;
                            mem_data_write <= alu_op1;
                            mem_Wen <= 0;
                        end
                    endcase    
             default:
                begin
                    mem_addr_write <= alu_op2;
                    mem_data_write <= alu_op1;
                    mem_Wen <= 0;
                end 
         endcase
     end     
                    
                    
                    
                    
                    
    
    
    
    

endmodule
