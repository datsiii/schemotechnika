module angle_converter (
    input wire clk,         // Вход тактового сигнала
    input wire rst_n,       // Сигнал асинхронного сброса (активный LOW)
    input wire [31:0] angle_deg,  // Угол в градусах
    input wire [31:0] angle_rad,  // Угол в радианах
    output reg [31:0] bam_out   // Выход в BAM (битовый угловой масштаб)
);

    reg [31:0] bam_deg;  // Регистр для хранения угла в BAM из градусов
    reg [31:0] bam_rad;  // Регистр для хранения угла в BAM из радианов

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bam_deg <= 32'b0;
        else
            bam_deg <= angle_deg * (32'h20000000 / 360);  // Примерное преобразование в BAM из градусов
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bam_rad <= 32'b0;
        else
            bam_rad <= angle_rad * (32'h6487ED51 / 2 / 3.14159);  // Примерное преобразование в BAM из радианов
    end

    always @(*) begin
        if (bam_rad > 32'h1FFFFFFF)
            bam_out = bam_deg;
        else
            bam_out = bam_rad;
    end

endmodule
