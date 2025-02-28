module angle_to_bam(
    input wire [15:0] angle_deg,  // Угол в градусах
    output reg [7:0] bam_out      // Угол в формате BAM
);
    always @(*) begin
        bam_out = (angle_deg * 256) / 360;  // Преобразование градусы -> BAM
    end
endmodule