module ex7_top(
	data_out,
	KEY,
	HEX0, HEX1
);

	output [6:0] data_out;
	input [3:0] KEY;
	output[6:0] HEX0;
	output[6:0] HEX1;
	wire [6:0] WIRE1;
	
	prbs7 PRBS0 (WIRE1, KEY[3]);
	
	hex_to_7seg SEG0 (HEX0, WIRE1[3:0]);
	hex_to_7seg SEG1 (HEX1, WIRE1[6:4]);
	
	
endmodule