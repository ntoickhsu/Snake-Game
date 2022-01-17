module LED_Driver_test(clk_in,reset,out_cathode,out_anode,in1,in2,in3,in4,in5,in6,in7,in8);

input clk_in,reset;

input [7:0] in1,in2,in3,in4,in5,in6,in7,in8;

output wire [7:0] out_cathode,out_anode;

wire clk1hz;

LED_driver_test_lower_level main(clk1hz,reset,out_cathode,out_anode,in1,in2,in3,in4,in5,in6,in7,in8);

clk_divider_display main_clock(clk_in,reset,clk1hz);





endmodule