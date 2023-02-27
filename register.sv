`include "../define.vh"

/**
 * Latches and stores values of WIDTH bits and initializes to RESET_VAL.
 *
 * This register uses an asynchronous active-low reset and a synchronous
 * active-high clear. Upon clear or reset, the value of the register becomes
 * RESET_VAL.
 *
 * Parameters:
 *  - WIDTH         The number of bits that the register holds.
 *  - RESET_VAL     The value that the register holds after a reset.
 *
 * Inputs:
 *  - clk           The clock to use for the register.
 *  - rst           Active-high asynchronous reset.
 *  - clear         Active-high synchronous reset.
 *  - en            Active-high indication whether or not to load the register.
 *  - D             The input to the register.
 *
 * Outputs:
 *  - Q             The latched output from the register.
 **/
module register

   #(parameter                      WIDTH=1,
     parameter [WIDTH-1:0]    RESET_VAL='h0)

    (input  logic               clk, en, rst, clear,
     input  logic [WIDTH-1:0]   D,
     output reg [WIDTH-1:0]   Q);

     always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            Q <= RESET_VAL;
        end else begin
            if (clear) Q <= RESET_VAL;
            else if(en) Q <= D;
            else Q <= Q;
        end
     end
     
endmodule:register