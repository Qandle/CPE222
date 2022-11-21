module Counter (
    input clk,
    input reset, // active high
    output reg [2:0] count
);

    always @(posedge clk) begin
        if (reset == 1'b1)
            count <= 0;
        else
            count <= count + 1; // non-blocking assignment ทำทุกบรรทัดพร้อมกัน
    end

endmodule