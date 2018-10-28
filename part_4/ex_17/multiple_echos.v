//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------

module processor (sysclk, data_in, data_out, data_valid);

	input				sysclk;		// system clock
	input				data_valid;	// data_valid
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data

	reg q;
	
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire 				full, pulse, rdreq;
	wire [9:0]		x,y, echo;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
	pulse_gen	PULSE(pulse,data_valid,sysclk);
	fifo	FIFO0 (sysclk, y, rdreq, pulse,full, echo);
	
	always @(posedge sysclk)
		q <= full;
		
	assign rdreq = q & pulse;
	
	assign y = x - {echo[9], echo[9:1]};
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	