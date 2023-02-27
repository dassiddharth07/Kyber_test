`include "../define.vh"

module mult_mod (clk, a, b, mod_prod);

    input clk;
    input [`WIDTH-1:0] a, b;
    output [`WIDTH-1:0] mod_prod;

    logic [`WIDTH+`WIDTH-1:0] prod, prod1, prod2, prod3, x;
    logic [`WIDTH+`WIDTH:0] sum1;
    logic [`WIDTH:0] const_ratio, sub, t;

    assign const_ratio = `CONST;

    mult m1 (clk, a, b, prod);
    mult m2 (clk, prod[`WIDTH-1:0], const_ratio[`WIDTH-1:0], prod1);
    mult m3 (clk, prod[`WIDTH+`WIDTH-1:`WIDTH], const_ratio[`WIDTH-1:0], prod2);

    assign sum1 = prod1[`WIDTH+`WIDTH-1:`WIDTH] + prod2 + prod;

    mult m4 (clk, `PRIME, sum1[`WIDTH+`WIDTH-1:`WIDTH], prod3);

    assign x[`WIDTH-1:0] = prod[`WIDTH-1:0];
    assign x[`WIDTH+`WIDTH-1:`WIDTH] = (sum1[`WIDTH+`WIDTH]==1)? prod[`WIDTH+`WIDTH-1:`WIDTH]-`PRIME : prod[`WIDTH+`WIDTH-1:`WIDTH];

    assign t = x - prod3;
    assign sub = t - `PRIME;
    assign mod_prod = (sub[`WIDTH]==1)? t : sub;


endmodule