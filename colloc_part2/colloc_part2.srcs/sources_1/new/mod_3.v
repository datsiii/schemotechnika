module fsm_32bit_data (
    input clk,
    input reset,
    input [31:0] data_in1,
    input [31:0] data_in2,
    output reg [31:0] data_out
);

    reg [1:0] state, next_state;

    localparam IDLE = 2'b00, SHIFT_LEFT = 2'b01, ADD_DATA = 2'b10;

    always @(posedge clk) begin
        if (reset) state <= IDLE;
        else state <= next_state;
    end

    always @(state or data_in1 or data_in2) begin
        case (state)
            IDLE: next_state = SHIFT_LEFT;
            SHIFT_LEFT: next_state = ADD_DATA;
            ADD_DATA: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    always @(state or data_in1 or data_in2) begin
        case (state)
            IDLE: data_out = 32'b0;
            SHIFT_LEFT: data_out = data_in1 << 2;
            ADD_DATA: data_out = data_in1 + data_in2;
            default: data_out = 32'b0;
        endcase
    end

endmodule
