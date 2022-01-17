module tb_bi_shift_register();
reg clk_test,shift_right_test,shift_left_test,reset_test,set_test;
reg [7:0] load_ups_test,load_downs_test,load_in_test,load_ups_values_test,load_downs_values_test;
wire [7:0] parallel_out_test;

integer num_test;
integer count_right = 0;
integer count_left = 0;
integer count_up = 0;
integer count_down = 0;

bi_shift_register port_map(

.clk(clk_test),
.shift_right(shift_right_test),
.shift_left(shift_left_test),
.reset(reset_test),
.set(set_test),
.load_ups(load_ups_test),
.load_downs(load_downs_test),
.load_in(load_in_test),
.load_ups_values(load_ups_values_test),
.load_downs_values(load_downs_values_test),
.parallel_out(parallel_out_test)

);

initial begin
clk_test = 0;
shift_right_test = 0;
shift_left_test = 0;
reset_test = 0;
set_test = 0;
load_ups_test = 0;
load_downs_test = 0;
load_in_test = 0;
load_ups_values_test = 8'b0;
load_downs_values_test = 8'b0;
end

always begin 
for(num_test = 1; num_test < 256; num_test = num_test + 1) begin
load_in_test=num_test;
set_test = 0;
#5;
set_test = 1;
#5;
set_test = 0;
#5;

shift_right_test = 1;
#5;
for(count_right = 0; count_right < 8; count_right = count_right + 1) begin
clk_test = 0;
#5;
clk_test = 1;
#5;
end
shift_right_test =  0;
#5;

load_in_test=num_test;
set_test = 0;
#5;
set_test = 1;
#5;
set_test = 0;
#5;

shift_left_test = 1;
#5;
for(count_left = 0; count_left < 8; count_left = count_left + 1) begin
clk_test = 0;
#5;
clk_test = 1;
#5;
end
shift_left_test = 0;
#5; 

load_in_test=num_test;
set_test = 1;
#5;
set_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
#5;


load_ups_values_test = 8'b11111111;
load_ups_test = 8'b10000000;
for(count_up = 0; count_up < 8; count_up = count_up + 1) begin
clk_test = 0;
#5;
clk_test = 1;
#5;
load_ups_test = load_ups_test >> 1;
end

reset_test = 1;
#5;
reset_test = 0;
#5;

load_downs_values_test = 8'b11111111;
load_downs_test = 8'b10000000;
for(count_down = 0; count_down < 8; count_down = count_down + 1) begin
clk_test = 0;
#5;
clk_test = 1;
#5;
load_downs_test = load_downs_test >> 1;
end

end

end


endmodule