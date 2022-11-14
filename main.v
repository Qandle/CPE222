module Mux (
    input a,
    input b, 
    input s,
    output f
);
    // f = ~sa = sb

    // method 1
    assign f = (~s & a) | (s & b);

    // method 2
    wire t1;
    assign t1 = ~s & a;
    wire t2;
    assign t2 = s & b;
    assign f = t1 | t2;
    
endmodule

module Mux2 (
    input a, 
    input b, 
    input c, 
    input d,
    input s1,
    input s0,
    output reg f // f maybe register [**always have to use with reg]
);
    // method 3
    always @(*) begin
        if ({s1, s0} == 2'b00) begin
            f = a;
        end
        else if ({s1, s0} == 2'b01) begin
            f = b;
        end
        else if ({s1, s0} == 2'b10) begin
            f = c;
        end
        else /* if ({s1, s0} == 2'b01) begin
            f = b;
        end */ // lash when no the comment -> this is why using 'reg'
    end
endmodule

module Mux3 (
    input a, 
    input b, 
    input c, 
    input d,
    input s1,
    input s0,
    output f // f maybe register [**always have to use with reg]
);
    // method 4
    reg out;
    always @(*) begin
        if ({s1, s0} == 2'b00) begin
            out = a;
        end
        else if ({s1, s0} == 2'b01) begin
            out = b;
        end
        else if ({s1, s0} == 2'b10) begin
            out = c;
        end
        else /* if ({s1, s0} == 2'b01) begin
            out = b;
        end */ // lash when no the comment -> this is why using 'reg'
    end
    assign f = out;
endmodule