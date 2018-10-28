module ex13_top(
	CLOCK_50,
	DAC_SDI, DAC_CS, DAC_SCK, DAC_LD, PWM_OUT
);

	input CLOCK_50;
	wire TICK;
	wire [9:0]data;
	wire [9:0] count;
	output DAC_SDI;		// SPI serial data out
	output DAC_CS;			// chip select - low when sending data to dac
	output DAC_SCK;		// SPI clock, 16 cycles at half sysclk freq
	output DAC_LD;
	output PWM_OUT;
	
	clktick CLKTICK0(CLOCK_50, 1, 16'd5000, TICK);
	counter_10 counter0 (CLOCK_50, TICK, count, 0);
	ROM rom0 (count, TICK, data);
	pwm PWM0(CLOCK_50, data, TICK, PWM_OUT);
	spi2dac SPI2DAC0(CLOCK_50, data, TICK, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	
endmodule