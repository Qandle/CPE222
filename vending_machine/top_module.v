/* module that use for call program (like main) */

module TopModule (
    input five,
    input ten,
    output done,
    output change
);

    wire clk;
    SB_HFOSC u_SB_HFOSC (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    wire five_debounce;
    PushButton_Debouncer debouncer1(
        .clk(clk),
        .PB(~five),
        .PB_down(five_debounce)
    );

    wire ten_debounce;
    PushButton_Debouncer debouncer2(
        .clk(clk),
        .PB(~ten),
        .PB_down(ten_debounce)
    );
    
    Vending vend(
        .clk(clk),
        .five(five_debounce),
        .ten(ten_debounce),
        .done(done),
        .change(change)
    );

endmodule