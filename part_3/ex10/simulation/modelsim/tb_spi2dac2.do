add wave sysclk load
add wave -hexadecimal dac_sdi
force sysclk 0 0, 1 10ns -repeat 20ns
force data_in 16#23b
force load 1
run 1000ns