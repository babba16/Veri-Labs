module prbs7(
	data_out,
	KEY
);

	output [6:0] data_out;
	input KEY;

	reg[6:0] sreg;

	initial sreg = 7'b1;

	always @ (posedge KEY)
		sreg <= {sreg[5:0], sreg[6] ^ sreg[2]};
		
	assign data_out = sreg;

endmodule