`timescale 1ns / 1ps

module fsm #(MAX = 16)(
    input [15:0] dataIn, // ������� ������ �������
    input R_I, // �������� �� ���������� ������
    input reset, // ������� ������ ������
    input clk, // ������� �������� ������
    output reg [15:0] dataOut, // �������� ������ �������
    output reg R_O // �������� �� ���������� ������
    );

localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5; // ���������

reg [2:0] state = S0;

reg [15:0] array_size = 0;
reg [15:0] temp;
reg [15:0] array[0:MAX-1];
reg [3:0] already_input = 0; // ���������� ��� ��������� ���������

integer s = 0, i = 0, j = 0, position = 0;

always @(posedge clk) begin
    if (reset) begin // �����
        s <= 0;
        i <= 0;
        j <= 0;
        R_O <= 0;
        position <= 0;
        state <= S0; // ��������� ���������� ��������� �� ���� ���-�� ���������
        array_size <= 0;
        for (i = 0; i < MAX; i = i + 1) // �������� ������
            array[i] = 0;
    end else begin
        case (state)
            S0: begin // ���������� �������� ��������� �������
                if (R_I) begin // ���� ���� ������� ������
                    state <= S1; // ������� � ��������� ��� ���������� �������
                    array_size <= dataIn; // �������� ������ �������
                end
                R_O <= 0;
                for (i = 0; i < MAX; i = i + 1) // �������������� ������
                    array[i] = 0;
            end

            S1: begin // ���� ��������� �������
                if (position < array_size) begin
                    if (R_I) begin // ���� ���� ������� ������
                        array[position] <= dataIn; // �������� � ������ ��������� �����
                        position = position + 1;
                    end
                end else begin // ���� ��� �������� ������� �������
                    state <= S2; // ������� � ��������� ����������
                    s <= array_size / 2; // ������������� ���������� s ��� ���������� (��������)
                end
            end

            // ���������� � �����
            S2: begin // ��������� ��������� ����������
                if (s > 0) begin
                    i = s; // �������������� ��������
                    state = S3; // ��������� � ��������� ����������
                end else begin // ����� ��� �������������
                    i = 0;
                    R_O <= 1;
                    state <= S5; // ������� � ��������� ������
                end
            end

            S3: begin // ��������� ����������
                if (i < array_size) begin
                    j = i - s; // ���������� ����� �� �������� ��������
                    state = S4; // ��������� � ���������� ���������
                end else begin // ����� ��������� ��� ����������
                    s = s / 2;
                    state = S2; // � ��������� � s2 ��� ���������� ������� ���������
                end
            end

            S4: begin // ���������� ���������
                if (j >= 0 && array[j] > array[j+s]) begin
                    temp = array[j]; // �������� ������� �������� �������
                    array[j] = array[j+s];
                    array[j+s] = temp;
                    j = j - s;
                end else begin
                    i = i + 1;
                    state = S3;
                end
            end

            S5: begin // ����� �������
                if (i < array_size) begin
                    dataOut <= array[i];
                    R_O <= 1;
                    if (R_I) begin
                        i <= i + 1;
                        R_O <= 0;
                    end
                end else begin
                    state = S0; // ������� � ���������� ���������
                end
            end
        endcase
    end
end

endmodule
