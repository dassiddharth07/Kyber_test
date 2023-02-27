`include "../define.vh"

module mult (clk, a, b, prod);

    input clk;
    input [`WIDTH-1:0] a, b;
    output [`WIDTH+`WIDTH-1:0] prod;

    //assign prod = a*b;
    CW_mult #(`WIDTH, `WIDTH) u1(.A(a), .B(b), .TC(1'b0), .Z(prod));
    //karatsuba k1(clk, a ,b, prod);

endmodule
