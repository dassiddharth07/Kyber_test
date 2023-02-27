`include "./define.vh"

module add_mod (clk, a, b, sum);

    input clk;
    input [`WIDTH-1:0] a, b;
    output [`WIDTH-1:0] sum;

    logic [`WIDTH:0] sum1, sum2;

    assign sum1 = a + b;
    assign sum2 = sum1 - {1'b0, `PRIME};
    assign sum = (sum2[`WIDTH]==1'b1)? sum1 : sum2;
    
endmodule