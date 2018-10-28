module ex12_top(
	SW, CLOCK_50,
	HEX0, HEX1, HEX2
);

	input [9:0]SW;
	input CLOCK_50;
	wire [9:0]data;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	
	ROM rom0 (SW[9:0], CLOCK_50, data);

	hex_to_7seg SEG0 (HEX0, data[3:0]);
	hex_to_7seg SEG1 (HEX1, data[7:4]);
	hex_to_7seg SEG2 (HEX2, data[9:8]);
	
endmodule