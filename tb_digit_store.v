module tb_digit_store();
reg clk_test,set_test,reset_test,left_shift_test,right_shift_test,up_shift_test,down_shift_test;
reg [2:0] user_input_test;
wire out_up_test,out_down_test,out_left_test,out_right_test,data_out_test;

integer input_test;

digit_store port_map(
.clk(clk_test),
.set(set_test),
.reset(reset_test),
.left_shift(left_shift_test),
.right_shift(right_shift_test),
.up_shift(up_shift_test),
.down_shift(down_shift_test),
.user_input(user_input_test),
.out_up(out_up_test),
.out_down(out_down_test),
.out_left(out_left_test),
.out_right(out_right_test),
.data_out(data_out_test)
);

initial begin 
clk_test = 0;
set_test = 0;
reset_test = 0;
left_shift_test= 0;
right_shift_test = 0;
up_shift_test= 0;
down_shift_test = 0;
user_input_test = 3'b111;

reset_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
#5;

set_test = 1;
#5;
set_test = 0;

end

always begin
//user_input_test = 3'b111;
//set_test = 1;
//set_direction_test = 2'b01;
//#5;
//set_test = 0


for (input_test = 0; input_test < 4; input_test = input_test + 1) begin 
up_shift_test = 1;
#5;
clk_test =1;
#5;
clk_test = 0;

end

up_shift_test = 0;
#5;
clk_test = 1;
#5;
clk_test = 0;
#5;


for (input_test = 0; input_test < 4; input_test = input_test + 1) begin 
down_shift_test = 1;
#5;
clk_test =1;
#5;
clk_test = 0;
end

user_input_test = 3'b010;
#5;
set_test = 1;
#5;
set_test = 0;

for (input_test = 0; input_test < 4; input_test = input_test + 1) begin 
right_shift_test = 1;
#5;
clk_test =1;
#5;
clk_test = 0;
end




end
endmodule