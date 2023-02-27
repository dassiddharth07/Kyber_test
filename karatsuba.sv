`include "../define.vh"

module karatsuba (clk, a, b, prod);

    input clk;
    input [`WIDTH-1:0] a, b;
    output [`WIDTH+`WIDTH-1:0] prod;

	logic [`WIDTH:0] phi, plo;
	logic [`WIDTH+2:0] pim, pim2;

	logic [`WIDTH/2:0] prod1;
	logic [`WIDTH+2:0] prod2;
	logic [`WIDTH:0] prod3;

	assign phi = a[`WIDTH-1:`WIDTH/2+1]*b[`WIDTH-1:`WIDTH/2+1];
	assign plo = a[`WIDTH/2:0]*b[`WIDTH/2:0];
	assign pim = (a[`WIDTH-1:`WIDTH/2+1]+a[`WIDTH/2:0])*(b[`WIDTH-1:`WIDTH/2+1]+b[`WIDTH/2:0]);
	assign pim2 = pim-phi-plo;
		
	assign prod1 = plo[`WIDTH/2:0];
	assign prod2 = plo[`WIDTH:`WIDTH/2+1]+pim2;
	assign prod3 = prod2[`WIDTH+2:`WIDTH/2+1]+phi;

	assign prod = {prod3[`WIDTH-1:0], prod2[`WIDTH/2:0], prod1};

endmodule
