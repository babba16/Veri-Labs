module ex4_top (
	SW,	//input switches
	HEX0, HEX1, HEX2	// Hex output on 7 segment display
	);
	input [9:0] SW; 	// declare input/output ports
	wire [3:0] BCD0;
	wire [3:0] BCD1;
	wire [3:0] BCD2; 	
	wire [3:0] BCD3;
	output[6:0] HEX0;
	output[6:0] HEX1;
	output[6:0] HEX2;
	
	bin2bcd_10 (SW, BCD0, BCD1, BCD2, BCD3);
	hex_to_7seg SEG0 (HEX0, BCD0);
	hex_to_7seg SEG1 (HEX1, BCD1);
	hex_to_7seg SEG2 (HEX2, BCD2);
	hex_to_7seg SEG3 (HEX3, BCD3);
	
endmodule