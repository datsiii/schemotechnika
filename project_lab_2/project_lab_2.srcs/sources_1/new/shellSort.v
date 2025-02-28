module shellSort(
    input clk,
    input rst,
    input start,
    input [15:0] data_in,
    output reg [15:0] sorted_array,
    output reg done
);

// Состояния конечного автомата
parameter IDLE = 2'd0;
parameter INIT = 2'd1;
parameter SORT = 2'd2;
parameter FINISH = 2'd3;

// Регистры состояния и счетчики
reg [15:0] array [7:0]; // Массив для сортировки
reg [31:0] temp;
reg [3:0] i, j;
reg [31:0] interval;
reg [1:0] state;
reg [31:0] interval_next;

// Асинхронный сброс
always @(posedge rst) begin
    if (rst)
        state <= IDLE;
end

// Комбинаторная логика
always @(posedge clk) begin
    case(state)
        IDLE: begin
            if (start) begin
                state <= INIT;
                interval <= 8'd4; // Инициализация интервала
                interval_next <= interval >> 1;
                for (i = 0; i < 8; i = i + 1)
                    array[i] <= sorted_array[i * 32 +: 32]; // Инициализация массива
            end
        end

        INIT: begin
            interval <= interval_next; // Обновление интервала
            if (interval > 0) begin
                i <= interval;
                state <= SORT;
            end else begin
                done <= 1; // Сортировка завершена
                state <= FINISH;
            end
        end

        SORT: begin
            temp <= array[i]; // Запоминаем текущий элемент
            j <= i;
            while (j >= interval && array[j - interval] > temp) begin
                array[j] <= array[j - interval];
                j <= j - interval;
            end
            array[j] <= temp;
            i <= i + 1;
            if (i == 8) begin
                interval_next <= interval_next >> 1;
                state <= INIT;
            end
        end

        default: begin
            // Ничего не делаем
        end
    endcase
end

endmodule