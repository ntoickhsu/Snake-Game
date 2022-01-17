module snake_game_lower_level(reset_master,clk_master,left,right,up,down,display,row_1_main,row_2_main,row_3_main,row_4_main,row_5_main,row_6_main,row_7_main,row_8_main);

input wire left,right,up,down,reset_master,clk_master;

output wire display;


//control signal for load direcion

wire [2:0] control;

//wires for output of 8 by eight register
wire [7:0] row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8;

//wires for output of position converter

wire [7:0] row_1_pos,row_2_pos,row_3_pos,row_4_pos,row_5_pos,row_6_pos,row_7_pos,row_8_pos;

//wires  for  output of or circuitry

output wire [7:0] row_1_main, row_2_main,row_3_main,row_4_main,row_5_main,row_6_main,row_7_main,row_8_main;

//wires for output of coordinate select mucx
wire [7:0] x_select,y_select;
wire [2:0] x_select_mux,y_select_mux;
//wires for loading the counters in the event of a collision woth food.
wire edge_collision,edge_collision_tail;//load;
wire[2:0] load_x,load_y;

//wires for holding the head and tail coordinates
wire [2:0]  head_x,head_y,tail_x,tail_y;

//these wires are for connecting the module that decodes moves and sends them to the position recorders
wire r_h,l_h,u_h,d_h;
wire r_t,l_t,u_t,d_t;

wire [2:0] read_move;

//the outputs of the move_holder module, should go to move decoders

wire [2:0] out_head,out_pos;

//signals needed for clock state machine

wire clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,set_collide,load_out,snake_increment,clk_food;

//clk,reset,set,set_coordinate_x,set_coordinate_y,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,control,control_x_coordinate,control_y_coordinate,left_edge,right_edge,upper_edge,lower_edge
wire [7:0] left_edge,right_edge,upper_edge,lower_edge;

//wires for detection of a collision

wire food_collide,new_food_collision;

wire [2:0] food_x,food_y;

//wires for length of snake

wire [5:0] snake_length;

//wires for collision detection

wire collision, collision_reset, collision_flip_flop;

eight_by_eight_shift_register snake_space(clk_eightxeight,reset_master|collision_reset,(set_eightbyeight|set_collide),x_select,y_select,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,control,x_select,y_select,left_edge,right_edge,upper_edge,lower_edge);

bcd_to_decimal xcoordinate(x_select_mux,x_select);
bcd_to_decimal ycoordinate(y_select_mux,y_select);
move_input input_reader(left,right,up,down,read_move,reset_master|collision_reset,clk_load_move);

three_bit_mux direction_select(out_pos,out_head,food_collide,control);

three_bit_mux head_tail_x(load_x,head_x,food_collide,x_select_mux); 
three_bit_mux head_tail_y(load_y,head_y,food_collide,y_select_mux);

three_bit_flip_flop hold_tail_x(tail_x,update_counters,load_x,0,reset_master|collision_reset);
three_bit_flip_flop hold_tail_y(tail_y,update_counters,load_y,0,reset_master|collision_reset);

position_recorder head_pos(update_counters,r_h,l_h,u_h,d_h,reset_master|collision_reset,head_x,head_y,edge_collision,load_x,load_y,0);

position_recorder tail_pos(update_counters,r_t,l_t,u_t,d_t,reset_master|collision_reset,tail_x,tail_y,edge_collision_tail,load_x,load_y,load_out);

move_to_position head(out_head,r_h,l_h,u_h,d_h);

move_to_position tail(out_pos,r_t,l_t,u_t,d_t);

move_register move_holder(clk_load_move_register,read_move,out_head,out_pos,snake_length,reset_master|collision_reset,1);


clk_drivers clock_machine(reset_master|collision_reset,clk_master,clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,food_collide,set_collide,load_out,snake_increment,clk_food,new_food_collision,display);

or_all_rows main_output(row_1_pos,row_2_pos,row_3_pos,row_4_pos,row_5_pos,row_6_pos,row_7_pos,row_8_pos,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,row_1_main,row_2_main,row_3_main,row_4_main,row_5_main,row_6_main,row_7_main,row_8_main);

row_converter food_coordinates(food_x,food_y,row_1_pos,row_2_pos,row_3_pos,row_4_pos,row_5_pos,row_6_pos,row_7_pos,row_8_pos);

food_system  food_supply(clk_food,reset_master|collision_reset,head_x,head_y,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,food_collide,new_food_collision,food_y,food_x);

snake_length_counter snake_length_score(snake_increment,reset_master|collision_reset,snake_length);

collision_detector detect_collision(row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,collision,head_x,head_y);

D_Flip_Flop colission_unrest(collision,collision_flip_flop,reset_master|collision_reset,~update_counters,0);

or or1 (collision_reset,collision_flip_flop,edge_collision);



endmodule


