`timescale 1ns/100ps // unit time is 1ns, resolutoin 100ps
//Design Name: Counter_8
//Function : an 8 bit counter synchronous counterwith enable input


module counter_8(
	clock, //clock input
	enable, //high enable counting
	count //count value
);

// Declare ports

parameter BIT_SZ = 8;
input clock;
input enable;
output [BIT_SZ-1 : 0] count;

//count need to be declared as reg

reg [BIT_SZ-1:0] count;

// always initialise storage elements such as D-FF
initial count = 0;

//Main body of the module
always @ (posedge clock)
	if(enable == 1'b1)
	count <= count +1'b1;
	
endmodule 