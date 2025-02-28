module angle_converter (
    input wire clk,         // ���� ��������� �������
    input wire rst_n,       // ������ ������������ ������ (�������� LOW)
    input wire [31:0] angle_deg,  // ���� � ��������
    input wire [31:0] angle_rad,  // ���� � ��������
    output reg [31:0] bam_out   // ����� � BAM (������� ������� �������)
);

    reg [31:0] bam_deg;  // ������� ��� �������� ���� � BAM �� ��������
    reg [31:0] bam_rad;  // ������� ��� �������� ���� � BAM �� ��������

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bam_deg <= 32'b0;
        else
            bam_deg <= angle_deg * (32'h20000000 / 360);  // ��������� �������������� � BAM �� ��������
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bam_rad <= 32'b0;
        else
            bam_rad <= angle_rad * (32'h6487ED51 / 2 / 3.14159);  // ��������� �������������� � BAM �� ��������
    end

    always @(*) begin
        if (bam_rad > 32'h1FFFFFFF)
            bam_out = bam_deg;
        else
            bam_out = bam_rad;
    end

endmodule
