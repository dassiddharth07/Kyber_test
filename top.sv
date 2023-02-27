`include "../define.vh"

module top (clk, rst, a, b, mod_prod);

    input clk, rst;
    input [`WIDTH-1:0] a, b;
    output reg [`WIDTH-1:0] mod_prod;

    logic [`WIDTH-1:0] a_reg, b_reg, mod_prod_reg;

    register #(.WIDTH(`WIDTH)) reg_A (.clk(clk), .en(1'b1), .rst(rst), .clear(1'b0), .D(a), .Q(a_reg));
    register #(.WIDTH(`WIDTH)) reg_B (.clk(clk), .en(1'b1), .rst(rst), .clear(1'b0), .D(b), .Q(b_reg));
    register #(.WIDTH(`WIDTH)) reg_prod (.clk(clk), .en(1'b1), .rst(rst), .clear(1'b0), .D(mod_prod_reg), .Q(mod_prod));

    mult_mod mm1 (.clk(clk), .a(a_reg), .b(b_reg), .mod_prod(mod_prod_reg));

endmodule

