module Counter (
    input reset,
    input clk,
    output reg full,
);
    reg [25:0] bitwises = 0;
    always @ (posedge clk) begin
        full <= 1'b0;
        if (!reset) begin
            bitwises <= 0;      // non-blocking assignment ทำทุกบรรทัดพร้อมกัน
        end
        else begin    
            bitwises <= bitwises + 1;
            if (bitwises == 26'd48_000_000) begin
                full <= 1'b1;
                bitwises <= 26'd0;
            end
        end
    end
    // assign full = (bitwises == 26'd48_000_000);

endmodule