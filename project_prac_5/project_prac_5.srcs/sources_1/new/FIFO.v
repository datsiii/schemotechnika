`timescale 1ns / 1ps

module FIFO #(

    MEM_SIZE = 6,
    WORD_SIZE = 4,
    localparam ADDR_SIZE = $clog2(MEM_SIZE)

)
(
    input clk, enable, reset, write_mode, read_mode,
    input [WORD_SIZE-1:0] data_in,
    output reg [WORD_SIZE-1:0] data_out,
    output reg full, empty, valid

    );
    
reg [WORD_SIZE-1:0] mem [0:MEM_SIZE-1];  
reg [ADDR_SIZE-1:0] write_pointer, read_pointer;
reg [ADDR_SIZE-1:0] write_pointer_next, read_pointer_next;
reg full_next, empty_next;

integer i; 

initial
begin
    write_pointer <= {ADDR_SIZE{1'b0}};
    read_pointer <= {ADDR_SIZE{1'b0}};
    write_pointer_next <= {ADDR_SIZE{1'b0}};
    read_pointer_next <= {ADDR_SIZE{1'b0}};
    full <= 0;
    full_next <= 0;
    empty <= 1;
    empty_next <= 1;
    valid <= 0;
    data_out <= {WORD_SIZE{1'b0}};
    
    for (i = 0; i < MEM_SIZE; i = i + 1)
        mem[i] <= {WORD_SIZE{1'b0}};
end

//ÇÀÏÈÑÜ
always@(posedge clk)
    if (enable && write_mode && !full)
        mem[write_pointer] <= data_in;
       
//×ÒÅÍÈÅ
always@(posedge clk)
    if (reset)
        begin
            data_out <= {WORD_SIZE{1'b0}};
            valid <= 1'b0;
        end
    else
        if (enable && read_mode && !empty)
            begin
                data_out <= mem[read_pointer];
                valid <= 1'b1;
            end
        else
            valid <= 1'b0;
     
 
// ÈÇÌÅÍÅÍÈÅ ÐÅÃÈÑÒÐÎÂ ÓÊÀÇÀÒÅËÅÉ È ÔËÀÃÎÂ
always@(posedge clk)
    begin
        if (reset)
            begin
                 write_pointer_next <= {ADDR_SIZE{1'b0}};
                 read_pointer_next <= {ADDR_SIZE{1'b0}};
                 full <= 0;
                 empty <= 1;
            end
        else if (enable)
            begin
                write_pointer <= write_pointer_next;
                read_pointer <= read_pointer_next;
                full = full_next;
                empty = empty_next;
            end
    end


function [ADDR_SIZE-1:0] next(input [ADDR_SIZE-1:0] pointer);
    if (pointer == MEM_SIZE-1)
        next = {ADDR_SIZE{1'b0}};
    else
        next = pointer + 1;
endfunction
    
//ÎÏÐÅÄÅËÅÍÈÅ ÑËÅÄÓÞÙÈÕ ÇÍÀ×ÅÍÈÉ ÐÅÃÈÑÒÐÎÂ
reg [1:0] operation;
localparam NONE = 0, READ = 1, WRITE = 2, READ_AND_WRITE = 3;
always@*
    begin
        case ({write_mode, read_mode})
            2'b01: operation <= !empty ? READ : NONE;
            2'b10: operation <= !full ? WRITE : NONE;
            2'b11: case ({full, empty})
                        2'b10:operation <= READ;
                        2'b01:operation <= WRITE;
                        default:operation <= READ_AND_WRITE;
                   endcase
            default: operation <= NONE;
        endcase
        
    case (operation)
        NONE:
            begin 
                write_pointer_next <=write_pointer;
                read_pointer_next <= read_pointer;
                full_next <=  full;
                empty_next <= empty;
            end
        READ:
            begin 
                write_pointer_next <=write_pointer;
                read_pointer_next <= next(read_pointer);
                full_next <=  1'b0;
                empty_next <= read_pointer_next == write_pointer;
            end
        WRITE:
            begin 
                write_pointer_next <= next(write_pointer);
                read_pointer_next <= read_pointer;
                full_next <=  write_pointer_next == read_pointer;
                empty_next <= 1'b0;
            end
        READ_AND_WRITE:
            begin 
                write_pointer_next <= next(write_pointer);
                read_pointer_next <= next(read_pointer);
                full_next <=  full;
                empty_next <= empty;
            end       
    endcase    
 end



    
endmodule
