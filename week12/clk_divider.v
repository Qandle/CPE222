module ClkDivider (
    input clk48MHz,
    output reg clk1Hz = 1'b0
);

    reg [24:0] counter = 25'd0;

    always @(posedge clk48MHz) begin
        counter <= counter + 1;
        if (counter == 25'd24_000_000) begin
            counter <= 0;
            clk1Hz <= ~clk1Hz;
        end
    end

endmodule