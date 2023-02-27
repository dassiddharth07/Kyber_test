`include "./define.vh"

module sub_mod (clk, a, b, diff);

    input clk;
    input [`WIDTH-1:0] a, b;
    output [`WIDTH-1:0] diff;

    logic [`WIDTH:0] diff1, diff2;

    assign diff1 = a - b;
    assign diff2 = diff1 + {1'b0, `PRIME};
    assign sum = (diff1[`WIDTH]==1'b1)? diff2 : diff1;
    
endmodule