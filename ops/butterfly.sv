`include "../define.vh"

module butterfly (clk, op, a, b, w, a_next, b_next);

    input clk, op;
    input [`WIDTH-1:0] a, b, w;
    output [`WIDTH-1:0] a_next, b_next;

    wire [`WIDTH-1:0] bw_prod, b_add, b_diff, b_mul, ab_add, ab_diff;

    // op = 0 is NTT, op = 1 is INTT

    assign b_mul = (op)? ab_diff : b;
    assign b_add = (op)? b : bw_prod;
    assign b_diff = (op)? b : bw_prod;
    
    
    mult_mod mm1 (clk, b_mul, w, bw_prod);
    add_mod am1 (clk, a, b_add, ab_add);
    sub_mod sm1 (clk, a, b_diff, ab_diff);

    assign a_next = ab_add;
    assign b_next = (op)? bw_prod: ab_diff;

endmodule