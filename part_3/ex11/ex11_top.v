module ex11_top (
	CLOCK_50,
	SW,
	DAC_SDI, DAC_CS, DAC_SCK, DAC_LD, PWM_OUT
);
	input [9:0]SW;
	input CLOCK_50;
	wire TICK;
	output DAC_SDI;		// SPI serial data out
	output DAC_CS;			// chip select - low when sending data to dac
	output DAC_SCK;		// SPI clock, 16 cycles at half sysclk freq
	output DAC_LD;
	output PWM_OUT;
	
	
	clktick CLKTICK0(CLOCK_50, 1, 16'd5000, TICK);
	pwm PWM0(CLOCK_50, SW, TICK, PWM_OUT);
	spi2dac SPI2DAC0(CLOCK_50, SW[9:0], TICK, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
endmodule