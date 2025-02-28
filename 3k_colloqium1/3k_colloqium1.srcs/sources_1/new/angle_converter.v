module angle_to_bam(
    input wire [15:0] angle_deg,  // ���� � ��������
    output reg [7:0] bam_out      // ���� � ������� BAM
);
    always @(*) begin
        bam_out = (angle_deg * 256) / 360;  // �������������� ������� -> BAM
    end
endmodule