module tb_clk_drivers();

reg reset_test,food_collision_test,clk_master_test,food_collision_replace_test;

wire clk_load_move_test,clk_load_move_register_test,set_eightbyeight_test,update_counters_test,clk_eightxeight_test,set_collide_test,load_test,snake_increment_test,clk_food_test,display_test;

integer count;

clk_drivers port_map(

.reset(reset_test),
.food_collision(food_collision_test),
.clk_master(clk_master_test),
.clk_load_move(clk_load_move_test),
.clk_load_move_register(clk_load_move_register_test),
.set_eightbyeight(set_eightbyeight_test),
.update_counters(update_counters_test),
.clk_eightxeight(clk_eightxeight_test),
.set_collide(set_collide_test),
.load(load_test),
.snake_increment(snake_increment_test),
.clk_food(clk_food_test),
.display(display_test),
.food_collision_replace(food_collision_replace_test)

);

initial begin
reset_test = 0;
food_collision_test = 0;
clk_master_test = 0;
food_collision_replace_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
end

always begin
for(count = 0; count < 16; count = count + 1) begin
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
end

food_collision_test = 1;
food_collision_replace_test = 0;
for(count = 0; count < 16; count = count + 1) begin
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
end

food_collision_test = 1;
food_collision_replace_test = 1;
for(count = 0; count < 16; count = count + 1) begin
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
end



food_collision_test = 0;
food_collision_replace_test = 1;
for(count = 0; count < 16; count = count + 1) begin
clk_master_test = 0;
#5;
clk_master_test = 1;
#5;
end
end


endmodule