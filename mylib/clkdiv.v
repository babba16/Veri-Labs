module clkdiv(
	clkin, //clock input to be divided
	enable, //enable clk divider when high
	K, //clock frequency divider is 2*(K+1)
	clkout //symmetric clock output Fout= Fin / 2*(K+1)
);

parameter K_BIT =16;
//input ports
input clkin;
input enable;
input [K_BIT-1:0] K;

//output ports
output clkout;

//output ports data type
reg[K_BIT-1:0] count;
reg clkout;

initial clkout = 1'b0;

	always @ (posedge clkin)
		if (enable == 1'b1)
			if (count == 10'b0) begin
				clkout <= ~clkout;
				count <= K;
				end
			else
				count <= count - 1'b1;
endmodule