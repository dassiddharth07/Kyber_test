`include "../define.vh"

module top_m_tb;

    logic clk, rst;
    logic [`WIDTH-1:0] a, b;
    logic [`WIDTH-1:0] mod_prod;

    top uut(.clk(clk), .rst(rst), .a(a), .b(b), .mod_prod(mod_prod));

    initial begin
        clk = 0;
        forever begin
            #2;
            clk = ~clk;
        end
    end

    initial begin
        $dumpfile("../verif/top_syn_sim.vcd");
        $dumpvars(3);
    end

    initial begin
        a = 13'd4592;
        b = 13'd6651;
        rst = 1'b1;
        #23;

        rst = 1'b0;
        #100;

        a = 13'd5623;
        b = 13'd7265;
        #100;

        #300 $finish;
    end
endmodule

