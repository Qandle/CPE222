module Vending (
    input clk,
    input five,
    input ten, 
    output done,
    output change,
);
    parameter [2:0] A = 3'b000,
                    B = 3'b001,
                    C = 3'b010,
                    D = 3'b011,
                    E = 3'b100;
    reg [2:0] state, next;
    always @(posedge clk) begin
        state <= next;
    end

    wire full;
    reg reset;

    Counter count (
        .reset(reset),
        .clk(clk),
        .full(full)
    );

    always @ (*) begin
        next = state;
        reset = 1'b0;
        case (state)
            A: if (five)        next = B;
                else if(ten)    next = C;
            B: if(five)         next = C;
                else if(ten)    next = D;
            C: if(five)         next = D;
                else if(ten)    next = E;
            D: begin
                reset = 1'b1;
                if(full) begin
                    next = A;
                end
            end
            E: begin
                reset = 1'b1;
                if(full) begin
                    next = A;
                end
            end
            default:            next = A;
        endcase
    end
       

    assign done = (state == D) || (state == E);
    assign change = (state == E);
endmodule