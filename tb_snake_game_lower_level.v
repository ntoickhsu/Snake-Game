module tb_snake_game_lower_level();

reg left_test,right_test,up_test,down_test,clk_master_test,reset_master_test;

snake_game_lower_level port_map(

.left(left_test),
.right(right_test),
.up(up_test),
.down(down_test),
.clk_master(clk_master_test),
.reset_master(reset_master_test)
);

initial begin
clk_master_test = 0;
left_test = 0;
right_test = 0;
up_test = 0;
down_test = 0;
reset_master_test = 0;
#5;
reset_master_test = 1;
#5;
reset_master_test = 0;
#5;

left_test = 0;
right_test = 1;
up_test = 0;
down_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
left_test = 0;
right_test = 0;
up_test = 1;
down_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
left_test = 0;
right_test = 1;
up_test = 0;
down_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
left_test = 0;
right_test = 0;
up_test = 0;
down_test = 1;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
left_test = 1;
right_test = 0;
up_test = 0;
down_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;

clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
left_test = 0;
right_test = 0;
up_test = 0;
down_test = 1;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
left_test = 0;
right_test = 1;
up_test = 0;
down_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
left_test = 0;
right_test = 0;
up_test = 1;
down_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
left_test = 0;
right_test = 1;
up_test = 0;
down_test = 0;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
left_test = 0;
right_test = 0;
up_test = 0;
down_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
left_test = 1;
right_test = 0;
up_test = 0;
down_test = 0;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
left_test = 0;
right_test = 0;
up_test = 1;
down_test = 0;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
end
endmodule