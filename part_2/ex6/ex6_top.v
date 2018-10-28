module ex6_top (
	CLOCK_50,
	KEY,
	HEX0, HEX1, HEX2, HEX3, HEX4
);
	input [1:0]KEY;
	input CLOCK_50;
	output [6:0]HEX0;
	output [6:0]HEX1;
	output [6:0]HEX2;
	output [6:0]HEX3;
	output [6:0]HEX4;
	wire [15:0] WIRE1;
	wire [3:0] WIRE2;
	wire [3:0] WIRE3;
	wire [3:0] WIRE4;
	wire [3:0] WIRE5;
	wire [3:0] WIRE6;
	wire TICK;
	
	reg delay;
	reg clocker;
	reg enable;
	
	
	clktick CLKTICK0(CLOCK_50, 1, 16'd50000, TICK);
	counter_16 COUNT0(CLOCK_50, TICK & ~KEY[0], WIRE1, ~KEY[1]);
	bin2bcd_16 BIN(WIRE1, WIRE2, WIRE3, WIRE4, WIRE5, WIRE6);
	hex_to_7seg SEG0(HEX0, WIRE2);
	hex_to_7seg SEG1(HEX1, WIRE3);
	hex_to_7seg SEG2(HEX2, WIRE4);
	hex_to_7seg SEG3(HEX3, WIRE5);
	hex_to_7seg SEG4(HEX4, WIRE6);
endmodule