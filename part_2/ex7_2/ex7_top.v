module ex7_top(
	data_out,
	KEY,
	HEX0, HEX1
);

	output [6:0] data_out;
	input [3:0] KEY;
	output[6:0] HEX0;
	output[6:0] HEX1;
	
	reg[6:0] sreg;
	
	initial sreg = 7'b1;
	
	always @ (posedge KEY[3])
		sreg <= {sreg[5:0], sreg[6] ^ sreg[0]};
		
	assign data_out = sreg;
	
	hex_to_7seg SEG0 (HEX0, sreg[3:0]);
	hex_to_7seg SEG1 (HEX1, sreg[6:4]);
	
	
endmodule