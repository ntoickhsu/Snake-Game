module tb_food_system();

reg [7:0] row_1_test,row_2_test,row_3_test,row_4_test,row_5_test,row_6_test,row_7_test,row_8_test;
reg [2:0] head_x_test,head_y_test;
reg clk_food_test,reset_test;

wire food_collide_test,new_food_collision_test;

wire [2:0] food_y_test;
wire [2:0] food_x_test;

food_system port_map(

.row_1(row_1_test),
.row_2(row_2_test),
.row_3(row_3_test),
.row_4(row_4_test),
.row_5(row_5_test),
.row_6(row_6_test),
.row_7(row_7_test),
.row_8(row_8_test),
.head_x(head_x_test),
.head_y(head_y_test),
.clk_food(clk_food_test),
.reset(reset_test),
.food_collide(food_collide_test),
.new_food_collision(new_food_collision_test),
.food_y(food_y_test),
.food_x(food_x_test)
);

initial begin
row_1_test = 8'b0;
row_2_test = 8'b0;
row_3_test = 8'b0;
row_4_test = 8'b0;
row_5_test = 8'b0;
row_6_test = 8'b0;
row_7_test = 8'b0;
row_8_test = 8'b0;
head_x_test = 8'b0;
head_y_test = 8'b0;
clk_food_test = 0;
reset_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
end

always begin
clk_food_test = 1;
#5;
clk_food_test = 0;
#5;
clk_food_test = 1;
#5;
clk_food_test = 0;
#5;

head_x_test = 3'b101;
head_y_test = 3'b011;

#5;
clk_food_test = 1;
#5;
clk_food_test = 0;
#5;

row_1_test = 8'b1;
row_2_test = 8'b0;
row_3_test = 8'b0;
row_4_test = 8'b0;
row_5_test = 8'b0;
row_6_test = 8'b0;
row_7_test = 8'b0;
row_8_test = 8'b0;
head_x_test = 8'b0;
head_y_test = 8'b0;
end
endmodule