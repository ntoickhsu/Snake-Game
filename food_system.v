module food_system(clk_food,reset,head_x,head_y,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,food_collide,new_food_collision,food_y,food_x);

input [7:0] row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8;

input [2:0] head_x,head_y;

input clk_food,reset;

output wire food_collide,new_food_collision;

output wire [2:0] food_y;

output wire [2:0] food_x;

wire [7:0] food_x_bcd;

wire out_x,out_y;



and output_signal(food_collide,out_x,out_y);

if_equals X_hat(head_x,food_x,out_x);

if_equals Y_hat(head_y,food_y,out_y);

bcd_inverse decimal_to_bcd(food_x_bcd,food_x);

random_list food_coordinates(clk_food,reset,food_y,food_x_bcd);

food_collision_detector new_food(row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,new_food_collision,food_x,food_y);

endmodule