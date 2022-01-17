module tb_move_input();

reg left_test,right_test,up_test,down_test,reset_test,clk_test;

wire [2:0] out_test;

move_input port_map(

.left(left_test),
.right(right_test),
.up(up_test),
.down(down_test),
.reset(reset_test),
.out(out_test),
.clk(clk_test)

);


initial begin
clk_test = 0;
left_test = 0;
right_test = 0;
up_test = 0;
down_test = 0;
reset_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
end

always begin

left_test = 1;
#5;
clk_test = 1;
#5;
clk_test = 0;
#5;
left_test = 0;
#5;
right_test = 1;
#5;
clk_test = 1;
#5;
clk_test = 0;
#5;
right_test = 0;
#5;
up_test = 1;
#5;
clk_test = 1;
#5;
clk_test = 0;
#5;
up_test = 0;
#5;
down_test = 1;
#5;
down_test = 0;
#5;
end



endmodule