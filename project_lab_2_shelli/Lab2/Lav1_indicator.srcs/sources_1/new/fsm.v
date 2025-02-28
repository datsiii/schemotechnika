`timescale 1ns / 1ps

module fsm #(MAX = 16)(
    input [15:0] dataIn, // Входные данные массива
    input R_I, // проверка на готовность чтения
    input reset, // Входной сигнал сброса
    input clk, // Входной тактовый сигнал
    output reg [15:0] dataOut, // Выходные данные массива
    output reg R_O // проверка на готовность вывода
    );

localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5; // состояния

reg [2:0] state = S0;

reg [15:0] array_size = 0;
reg [15:0] temp;
reg [15:0] array[0:MAX-1];
reg [3:0] already_input = 0; // Количество уже введенных элементов

integer s = 0, i = 0, j = 0, position = 0;

always @(posedge clk) begin
    if (reset) begin // сброс
        s <= 0;
        i <= 0;
        j <= 0;
        R_O <= 0;
        position <= 0;
        state <= S0; // Установка начального состояния на ввод кол-ва элементов
        array_size <= 0;
        for (i = 0; i < MAX; i = i + 1) // обнуляем массив
            array[i] = 0;
    end else begin
        case (state)
            S0: begin // Количество вводимых элементов массива
                if (R_I) begin // Если есть входные данные
                    state <= S1; // переход в состояние для считывания массива
                    array_size <= dataIn; // Записать размер массива
                end
                R_O <= 0;
                for (i = 0; i < MAX; i = i + 1) // инициализируем массив
                    array[i] = 0;
            end

            S1: begin // Ввод элементов массива
                if (position < array_size) begin
                    if (R_I) begin // Если есть входные данные
                        array[position] <= dataIn; // Записать в массив введенное число
                        position = position + 1;
                    end
                end else begin // Если все элементы массива введены
                    state <= S2; // Перейти к состоянию сортировки
                    s <= array_size / 2; // Инициализация переменной s для сортировки (интервал)
                end
            end

            // Сортировка и вывод
            S2: begin // начальное состояние сортировки
                if (s > 0) begin
                    i = s; // инициализируем интервал
                    state = S3; // переходим в состояние сортировки
                end else begin // иначе все отсортировали
                    i = 0;
                    R_O <= 1;
                    state <= S5; // Перейти к состоянию вывода
                end
            end

            S3: begin // состояние сортировки
                if (i < array_size) begin
                    j = i - s; // расстояние влево от текущего элемента
                    state = S4; // переходим в сортировку вставками
                end else begin // иначе уменьшаем шаг сортировки
                    s = s / 2;
                    state = S2; // и переходим в s2 для сортировки другого интервала
                end
            end

            S4: begin // сортировка вставками
                if (j >= 0 && array[j] > array[j+s]) begin
                    temp = array[j]; // Поменять местами элементы массива
                    array[j] = array[j+s];
                    array[j+s] = temp;
                    j = j - s;
                end else begin
                    i = i + 1;
                    state = S3;
                end
            end

            S5: begin // вывод массива
                if (i < array_size) begin
                    dataOut <= array[i];
                    R_O <= 1;
                    if (R_I) begin
                        i <= i + 1;
                        R_O <= 0;
                    end
                end else begin
                    state = S0; // Возврат к начальному состоянию
                end
            end
        endcase
    end
end

endmodule
