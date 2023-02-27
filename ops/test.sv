`include "../define.vh"

module mult_mod_tb;

    logic clk;
    logic [`WIDTH-1:0] a, b;
    logic [`WIDTH-1:0] mod_prod;

    mult_mod uut(.clk(clk), .a(a), .b(b), .mod_prod(mod_prod));

    initial begin
        clk = 0;
        forever begin
            #5;
            clk = ~clk;
        end
    end

    initial begin
        $dumpfile("../verif/mult_mod_sim.vcd");
        $dumpvars(3);
    end

    initial begin
        a = 13'd4592;
        b = 13'd6651;
        #100;

        a = 13'd5623;
        b = 13'd7265;
        #100;

        #300 $finish;
    end
endmodule

