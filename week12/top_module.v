module TopModule (
    output [2:0] led
);

    wire clk48MHz;
    SB_HFOSC osc(
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk48MHz)
    );

    wire clk1Hz;
    ClkDivider clkDiv(
        .clk48MHz(clk48MHz),
        .clk1Hz(clk1Hz)
    );

    reg reset = 1'b0;
    Counter c1(
        .clk(clk1Hz),
        //.en(en),
        .reset(reset), 
        .count(led)
    );

endmodule