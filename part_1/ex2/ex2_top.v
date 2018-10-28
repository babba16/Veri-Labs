module ex2_top (
	SW,	//input switches
	HEX0, HEX1, HEX2	// Hex output on 7 segment display
	);
	input [9:0] SW; 	// declare input/output ports
	output[6:0] HEX0;
	output[6:0] HEX1;
	output[6:0] HEX2;
	
	hex_to_7seg SEG0 (HEX0, SW[3:0]);
	hex_to_7seg SEG1 (HEX1, SW[7:4]);
	hex_to_7seg SEG2 (HEX2, SW[9:8]);
	
endmodule