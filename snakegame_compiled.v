module snake_game(clk_master,reset_master,left,right,up,down,out_cathode,out_anode);


wire [7:0] row1,row2,row3,row4,row5,row6,row7,row8;
//wire row1_display,row2_display,row3_display,row4_display,row5_display,row6_display,row7_display,row8_display;
wire display,clk_game;
input wire reset_master,left,right,up,down,clk_master;
output wire [7:0] out_cathode,out_anode;

snake_game_lower_level core(reset_master,clk_game,~left,~right,~up,~down,display,row1,row2,row3,row4,row5,row6,row7,row8);

//D_Flip_Flop_eight_bit row_1(row1,row1_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_2(row2,row2_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_3(row3,row3_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_4(row4,row4_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_5(row5,row5_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_6(row6,row6_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_7(row7,row7_display,reset_master,display,0);

//D_Flip_Flop_eight_bit row_8(row8,row8_display,reset_master,display,0);

LED_Driver_test display_control(clk_master,reset_master,out_cathode,out_anode,row8,row7,row6,row5,row4,row3,row2,row1);

clk_divider_game game_clock(clk_master,reset_master,clk_game);

endmodule

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

three_bit_flip_flop hold_tail_x(tail_x,update_counters,load_x,3'b0,reset_master|collision_reset);
three_bit_flip_flop hold_tail_y(tail_y,update_counters,load_y,3'b0,reset_master|collision_reset);

position_recorder head_pos(update_counters,r_h,l_h,u_h,d_h,reset_master|collision_reset,head_x,head_y,edge_collision,load_x,load_y,1'b0);

position_recorder tail_pos(update_counters,r_t,l_t,u_t,d_t,reset_master|collision_reset,tail_x,tail_y,edge_collision_tail,load_x,load_y,load_out);

move_to_position head(out_head,r_h,l_h,u_h,d_h);

move_to_position tail(out_pos,r_t,l_t,u_t,d_t);

move_register move_holder(clk_load_move_register,read_move,out_head,out_pos,snake_length,reset_master|collision_reset,1'b1);


clk_drivers clock_machine(reset_master|collision_reset,clk_master,clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,food_collide,set_collide,load_out,snake_increment,clk_food,new_food_collision,display);

or_all_rows main_output(row_1_pos,row_2_pos,row_3_pos,row_4_pos,row_5_pos,row_6_pos,row_7_pos,row_8_pos,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,row_1_main,row_2_main,row_3_main,row_4_main,row_5_main,row_6_main,row_7_main,row_8_main);

row_converter food_coordinates(food_x,food_y,row_1_pos,row_2_pos,row_3_pos,row_4_pos,row_5_pos,row_6_pos,row_7_pos,row_8_pos);

food_system  food_supply(clk_food,reset_master|collision_reset,head_x,head_y,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,food_collide,new_food_collision,food_y,food_x);

snake_length_counter snake_length_score(snake_increment,reset_master|collision_reset,snake_length);

collision_detector detect_collision(row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,collision,head_x,head_y);

D_Flip_Flop colission_unrest(collision,collision_flip_flop,reset_master|collision_reset,~update_counters,1'b0);

or or1 (collision_reset,collision_flip_flop,edge_collision);



endmodule

module eight_by_eight_shift_register(clk,reset,set,set_coordinate_x,set_coordinate_y,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,control,control_x_coordinate,control_y_coordinate,left_edge,right_edge,upper_edge,lower_edge);
input clk,reset,set;
input [2:0] control;
input [7:0] set_coordinate_x,set_coordinate_y,control_x_coordinate,control_y_coordinate;
output wire[7:0] row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8;
wire [2:0] wonebyeight,wonebyseven,wonebysix,wonebyfive,wonebyfour,wonebythree,wonebytwo,wonebyone;
wire [2:0] wtwobyeight,wtwobyseven,wtwobysix,wtwobyfive,wtwobyfour,wtwobythree,wtwobytwo,wtwobyone;
wire [2:0] wthreebyeight,wthreebyseven,wthreebysix,wthreebyfive,wthreebyfour,wthreebythree,wthreebytwo,wthreebyone;
wire [2:0] wfourbyeight,wfourbyseven,wfourbysix,wfourbyfive,wfourbyfour,wfourbythree,wfourbytwo,wfourbyone;
wire [2:0] wfivebyeight,wfivebyseven,wfivebysix,wfivebyfive,wfivebyfour,wfivebythree,wfivebytwo,wfivebyone;
wire [2:0] wsixbyeight,wsixbyseven,wsixbysix,wsixbyfive,wsixbyfour,wsixbythree,wsixbytwo,wsixbyone;
wire [2:0] wsevenbyeight,wsevenbyseven,wsevenbysix,wsevenbyfive,wsevenbyfour,wsevenbythree,wsevenbytwo,wsevenbyone;
wire [2:0] weightbyeight,weightbyseven,weightbysix,weightbyfive,weightbyfour,weightbythree,weightbytwo,weightbyone;
wire one_by_one_to_one_by_two,one_by_two_to_one_by_one,one_by_two_to_one_by_three,one_by_three_to_one_by_two,one_by_three_to_one_by_four,one_by_four_to_one_by_three,one_by_four_to_one_by_five,one_by_five_to_one_by_four,one_by_five_to_one_by_six,one_by_six_to_one_by_five,one_by_six_to_one_by_seven,one_by_seven_to_one_by_six,one_by_seven_to_one_by_eight,one_by_eight_to_one_by_seven;
wire two_by_one_to_two_by_two,two_by_two_to_two_by_one,two_by_two_to_two_by_three,two_by_three_to_two_by_two,two_by_three_to_two_by_four,two_by_four_to_two_by_three,two_by_four_to_two_by_five,two_by_five_to_two_by_four,two_by_five_to_by_six,two_by_six_to_two_by_five,two_by_six_to_two_by_seven,two_by_seven_to_two_by_six,two_by_seven_to_two_by_eight,two_by_eight_to_two_by_seven;
wire three_by_one_to_three_by_two,three_by_two_to_three_by_one,three_by_two_to_three_by_three,three_by_three_to_three_by_two,three_by_three_to_three_by_four,three_by_four_to_three_by_three,three_by_four_to_three_by_five,three_by_five_to_three_by_four,three_by_five_to_three_by_six,three_by_six_to_three_by_five,three_by_six_to_three_by_seven,three_by_seven_to_three_by_six,three_by_seven_to_three_by_eight,three_by_eight_to_three_by_seven;
wire four_by_one_to_four_by_two,four_by_two_to_four_by_one,four_by_two_to_four_by_three,four_by_three_to_four_by_two,four_by_three_to_four_by_four,four_by_four_to_four_by_three,four_by_four_to_four_by_five,four_by_five_to_four_by_four,four_by_five_to_four_by_six,four_by_six_to_four_by_five,four_by_six_to_four_by_seven,four_by_seven_to_four_by_six,four_by_seven_to_four_by_eight,four_by_eight_to_four_by_seven;
wire five_by_one_to_five_by_two,five_by_two_to_five_by_one,five_by_two_to_five_by_three,five_by_three_to_five_by_two,five_by_three_to_five_by_four,five_by_four_to_five_by_three,five_by_four_to_five_by_five,five_by_five_to_five_by_four,five_by_five_to_five_by_six,five_by_six_to_five_by_five,five_by_six_to_five_by_seven,five_by_seven_to_five_by_six,five_by_seven_to_five_by_eight,five_by_eight_to_five_by_seven;
wire six_by_one_to_six_by_two,six_by_two_to_six_by_one,six_by_two_to_six_by_three,six_by_three_to_six_by_two,six_by_three_to_six_by_four,six_by_four_to_six_by_three,six_by_four_to_six_by_five,six_by_five_to_six_by_four,six_by_five_to_six_by_six,six_by_six_to_six_by_five,six_by_six_to_six_by_seven,six_by_seven_to_six_by_six,six_by_seven_to_six_to_eight,six_by_eight_to_six_by_seven;
wire seven_by_one_to_seven_by_two,seven_by_two_to_seven_by_one,seven_by_two_to_seven_by_three,seven_by_three_to_seven_by_two,seven_by_three_to_seven_by_four,seven_by_four_to_seven_by_three,seven_by_four_to_seven_by_five,seven_by_five_to_seven_by_four,seven_by_five_to_seven_by_six,seven_by_six_to_seven_by_five,seven_by_six_to_seven_by_seven,seven_by_seven_to_seven_by_six,seven_by_seven_to_seven_by_eight,seven_by_eight_to_seven_by_seven;
wire eight_by_one_to_eight_by_two,eight_by_two_to_eight_by_one,eight_by_two_to_eight_by_three,eight_by_three_to_eight_by_two,eight_by_three_to_eight_by_four,eight_by_four_to_eight_by_three,eight_by_four_to_eight_by_five,eight_by_five_to_eight_by_four,eight_by_five_to_eight_by_six,eight_by_six_to_eight_by_five,eight_by_six_to_eight_by_seven,eight_by_seven_to_eight_by_six,eight_by_seven_to_eight_by_eight,eight_by_eight_to_eight_by_seven;

wire one_by_one_to_two_by_one,two_by_one_to_one_by_one,two_by_one_to_three_by_one,three_by_one_to_two_by_one,three_by_one_to_four_by_one,four_by_one_to_three_by_one,four_by_one_to_five_by_one,five_by_one_to_four_by_one,five_by_one_to_six_by_one,six_by_one_to_five_by_one,six_by_one_to_seven_by_one,seven_by_one_to_six_by_one,seven_by_one_to_eight_by_one,eight_by_one_to_seven_by_one;
wire one_by_two_to_two_by_two,two_by_two_to_one_by_two,two_by_two_to_three_by_two,three_by_two_to_two_by_two,three_by_two_to_four_by_two,four_by_two_to_three_by_two,four_by_two_to_five_by_two,five_by_two_to_four_by_two,five_by_two_to_six_by_two,six_by_two_to_five_by_two,six_by_two_to_seven_by_two,seven_by_two_to_six_by_two,seven_by_two_to_eight_by_two,eight_by_two_to_seven_by_two;
wire one_by_three_to_two_by_three,two_by_three_to_one_by_three,two_by_three_to_three_by_three,three_by_three_to_two_by_three,three_by_three_to_four_by_three,four_by_three_to_three_by_three,four_by_three_to_five_by_three,five_by_three_to_four_by_three,five_by_three_to_six_by_three,six_by_three_to_five_by_three,six_by_three_to_seven_by_three,seven_by_three_to_six_by_three,seven_by_three_to_eight_by_three,eight_by_three_to_seven_by_three;
wire one_by_four_to_two_by_four,two_by_four_to_one_by_four,two_by_four_to_three_by_four,three_by_four_to_two_by_four,three_by_four_to_four_by_four,four_by_four_to_three_by_four,four_by_four_to_five_by_four,five_by_four_to_four_by_four,five_by_four_to_six_by_four,six_by_four_to_five_by_four,six_by_four_to_seven_by_four,seven_by_four_to_six_by_four,seven_by_four_to_eight_by_four,eight_by_four_to_seven_by_four;
wire one_by_five_to_two_by_five,two_by_five_to_one_by_five,two_by_five_to_three_by_five,three_by_five_to_two_by_five,three_by_five_to_four_by_five,four_by_five_to_three_by_five,four_by_five_to_five_by_five,five_by_five_to_four_by_five,five_by_five_to_six_by_five,six_by_five_to_five_by_five,six_by_five_to_seven_by_five,seven_by_five_to_six_by_five,seven_by_five_to_eight_by_five,eight_by_five_to_seven_by_five;
wire one_by_six_to_two_by_six,two_by_six_to_one_by_six,two_by_six_to_three_by_six,three_by_six_to_two_by_six,three_by_six_to_four_by_six,four_by_six_to_three_by_six,four_by_six_to_five_by_six,five_by_six_to_four_by_six,five_by_six_to_six_by_six,six_by_six_to_five_by_six,six_by_six_to_seven_by_six,seven_by_six_to_six_by_six,seven_by_six_to_eight_by_six,eight_by_six_to_seven_by_six;
wire one_by_seven_to_two_by_seven,two_by_seven_to_one_by_seven,two_by_seven_to_three_by_seven,three_by_seven_to_two_by_seven,three_by_seven_to_four_by_seven,four_by_seven_to_three_by_seven,four_by_seven_to_five_by_seven,five_by_seven_to_four_by_seven,five_by_seven_to_six_by_seven,six_by_seven_to_five_by_seven,six_by_seven_to_seven_by_seven,seven_by_seven_to_six_by_seven,seven_by_seven_to_eight_by_seven,eight_by_seven_to_seven_by_seven;
wire one_by_eight_to_two_by_eight,two_by_eight_to_one_by_eight,two_by_eight_to_three_by_eight,three_by_eight_to_two_by_eight,three_by_eight_to_four_by_eight,four_by_eight_to_three_by_eight,four_by_eight_to_five_by_eight,five_by_eight_to_four_by_eight,five_by_eight_to_six_by_eight,six_by_eight_to_five_by_eight,six_by_eight_to_seven_by_eight,seven_by_eight_to_six_by_eight,seven_by_eight_to_eight_by_eight,eight_by_eight_to_seven_by_eight;



//the positions i nthe x coordinate values are backwards than conventional. For example, the far right bit [0:0] corresponds to the left most position. 
//module digit_store(clk,set,reset,out_up,out_down,out_left,out_right,left_shift,right_shift,up_shift,down_shift,user_input,data_out); remember that all inputs are always connected to outputs

//all signals coming from an edge should be set to 0.

output wire [7:0] left_edge;
output wire [7:0]right_edge;
output wire [7:0]upper_edge;
output wire [7:0]lower_edge;

control_signal_mux muxonebyeight(control_x_coordinate[0:0] & control_y_coordinate[7:7],control,wonebyeight);

control_signal_mux muxonebyseven(control_x_coordinate[0:0] & control_y_coordinate[6:6],control,wonebyseven);

control_signal_mux muxonebysix(control_x_coordinate[0:0] & control_y_coordinate[5:5],control,wonebysix);

control_signal_mux muxonebyfive(control_x_coordinate[0:0] & control_y_coordinate[4:4],control,wonebyfive);

control_signal_mux muxonebyfour(control_x_coordinate[0:0] & control_y_coordinate[3:3],control,wonebyfour);

control_signal_mux muxonebythree(control_x_coordinate[0:0] & control_y_coordinate[2:2],control,wonebythree);

control_signal_mux muxonebytwo(control_x_coordinate[0:0] & control_y_coordinate[1:1],control,wonebytwo);

control_signal_mux muxonebyone(control_x_coordinate[0:0] & control_y_coordinate[0:0],control,wonebyone);


digit_store onebyeight(clk,set & set_coordinate_x[0:0] & set_coordinate_y[7:7],reset,upper_edge[0:0],one_by_eight_to_one_by_seven,left_edge[7:7],one_by_eight_to_two_by_eight,two_by_eight_to_one_by_eight,1'b0,one_by_seven_to_one_by_eight,1'b0,wonebyeight,row_8[7:7]);

digit_store onebyseven(clk,set & set_coordinate_x[0:0] & set_coordinate_y[6:6],reset,one_by_seven_to_one_by_eight,one_by_seven_to_one_by_six,left_edge[6:6],one_by_seven_to_two_by_seven,two_by_seven_to_one_by_seven,1'b0,one_by_six_to_one_by_seven,one_by_eight_to_one_by_seven,wonebyseven,row_7[7:7]);

digit_store onebysix(clk,set & set_coordinate_x[0:0] & set_coordinate_y[5:5],reset,one_by_six_to_one_by_seven,one_by_six_to_one_by_five,left_edge[5:5],one_by_six_to_two_by_six,two_by_six_to_one_by_six,1'b0,one_by_five_to_one_by_six,one_by_seven_to_one_by_six,wonebysix,row_6[7:7]);

digit_store onebyfive(clk,set & set_coordinate_x[0:0] & set_coordinate_y[4:4],reset,one_by_five_to_one_by_six,one_by_five_to_one_by_four,left_edge[4:4],one_by_five_to_two_by_five,two_by_five_to_one_by_five,1'b0,one_by_four_to_one_by_five,one_by_six_to_one_by_five,wonebyfive,row_5[7:7]);

digit_store onebyfour(clk,set & set_coordinate_x[0:0] & set_coordinate_y[3:3],reset,one_by_four_to_one_by_five,one_by_four_to_one_by_three,left_edge[3:3],one_by_four_to_two_by_four,two_by_four_to_one_by_four,1'b0,one_by_three_to_one_by_four,one_by_five_to_one_by_four,wonebyfour,row_4[7:7]);

digit_store onebythree(clk,set & set_coordinate_x[0:0] & set_coordinate_y[2:2],reset,one_by_three_to_one_by_four,one_by_three_to_one_by_two,left_edge[2:2],one_by_three_to_two_by_three,two_by_three_to_one_by_three,1'b0,one_by_two_to_one_by_three,one_by_four_to_one_by_three,wonebythree,row_3[7:7]);

digit_store onebytwo(clk,set & set_coordinate_x[0:0] & set_coordinate_y[1:1],reset,one_by_two_to_one_by_three,one_by_two_to_one_by_one,left_edge[1:1],one_by_two_to_two_by_two,two_by_two_to_one_by_two,1'b0,one_by_one_to_one_by_two,one_by_three_to_one_by_two,wonebytwo,row_2[7:7]);

digit_store onebyone(clk,set & set_coordinate_x[0:0] & set_coordinate_y[0:0],reset,one_by_one_to_one_by_two,lower_edge[0:0],left_edge[0:0],one_by_one_to_two_by_one,two_by_one_to_one_by_one,1'b0,1'b0,one_by_two_to_one_by_one,wonebyone,row_1[7:7]);


control_signal_mux muxtwobyeight(control_x_coordinate[1:1] & control_y_coordinate[7:7],control,wtwobyeight);

control_signal_mux muxtwobyseven(control_x_coordinate[1:1] & control_y_coordinate[6:6],control,wtwobyseven);

control_signal_mux muxtwobysix(control_x_coordinate[1:1] & control_y_coordinate[5:5],control,wtwobysix);

control_signal_mux muxtwobyfive(control_x_coordinate[1:1] & control_y_coordinate[4:4],control,wtwobyfive);

control_signal_mux muxtwobyfour(control_x_coordinate[1:1] & control_y_coordinate[3:3],control,wtwobyfour);

control_signal_mux muxtwobythree(control_x_coordinate[1:1] & control_y_coordinate[2:2],control,wtwobythree);

control_signal_mux muxtwobytwo(control_x_coordinate[1:1] & control_y_coordinate[1:1],control,wtwobytwo);

control_signal_mux muxtwobyone(control_x_coordinate[1:1] & control_y_coordinate[0:0],control,wtwobyone);


digit_store twobyeight(clk,set & set_coordinate_x[1:1] & set_coordinate_y[7:7],reset,upper_edge[1:1],two_by_eight_to_two_by_seven,two_by_eight_to_one_by_eight,two_by_eight_to_three_by_eight,three_by_eight_to_two_by_eight,one_by_eight_to_two_by_eight,two_by_seven_to_two_by_eight,1'b0,wtwobyeight,row_8[6:6]);

digit_store twobyseven(clk,set & set_coordinate_x[1:1] & set_coordinate_y[6:6],reset,two_by_seven_to_two_by_eight,two_by_seven_to_two_by_six,two_by_seven_to_one_by_seven,two_by_seven_to_three_by_seven,three_by_seven_to_two_by_seven,one_by_seven_to_two_by_seven,two_by_six_to_two_by_seven,two_by_eight_to_two_by_seven,wtwobyseven,row_7[6:6]);

digit_store twobysix(clk,set & set_coordinate_x[1:1] & set_coordinate_y[5:5],reset,two_by_six_to_two_by_seven,two_by_six_to_two_by_five,two_by_six_to_one_by_six,two_by_six_to_three_by_six,three_by_six_to_two_by_six,one_by_six_to_two_by_six,two_by_five_to_by_six,two_by_seven_to_two_by_six,wtwobysix,row_6[6:6]);

digit_store twobyfive(clk,set & set_coordinate_x[1:1] & set_coordinate_y[4:4],reset,two_by_five_to_by_six,two_by_five_to_two_by_four,two_by_five_to_one_by_five,two_by_five_to_three_by_five,three_by_five_to_two_by_five,one_by_five_to_two_by_five,two_by_four_to_two_by_five,two_by_six_to_two_by_five,wtwobyfive,row_5[6:6]);

digit_store twobyfour(clk,set & set_coordinate_x[1:1] & set_coordinate_y[3:3],reset,two_by_four_to_two_by_five,two_by_four_to_two_by_three,two_by_four_to_one_by_four,two_by_four_to_three_by_four,three_by_four_to_two_by_four,one_by_four_to_two_by_four,two_by_three_to_two_by_four,two_by_five_to_two_by_four,wtwobyfour,row_4[6:6]);

digit_store twobythree(clk,set & set_coordinate_x[1:1] & set_coordinate_y[2:2],reset,two_by_three_to_two_by_four,two_by_three_to_two_by_two,two_by_three_to_one_by_three,two_by_three_to_three_by_three,three_by_three_to_two_by_three,one_by_three_to_two_by_three,two_by_two_to_two_by_three,two_by_four_to_two_by_three,wtwobythree,row_3[6:6]);

digit_store twobytwo(clk,set & set_coordinate_x[1:1] & set_coordinate_y[1:1],reset,two_by_two_to_two_by_three,two_by_two_to_two_by_one,two_by_two_to_one_by_two,two_by_two_to_three_by_two,three_by_two_to_two_by_two,one_by_two_to_two_by_two,two_by_one_to_two_by_two,two_by_three_to_two_by_two,wtwobytwo,row_2[6:6]);

digit_store twobyone(clk,set & set_coordinate_x[1:1] & set_coordinate_y[0:0],reset,two_by_one_to_two_by_two,lower_edge[1:1],two_by_one_to_one_by_one,two_by_one_to_three_by_one,three_by_one_to_two_by_one,one_by_one_to_two_by_one,1'b0,two_by_two_to_two_by_one,wtwobyone,row_1[6:6]);


control_signal_mux muxthreebyeight(control_x_coordinate[2:2] & control_y_coordinate[7:7],control,wthreebyeight);

control_signal_mux muxthreebyseven(control_x_coordinate[2:2] & control_y_coordinate[6:6],control,wthreebyseven);

control_signal_mux muxthreebysix(control_x_coordinate[2:2] & control_y_coordinate[5:5],control,wthreebysix);

control_signal_mux muxthreebyfive(control_x_coordinate[2:2] & control_y_coordinate[4:4],control,wthreebyfive);

control_signal_mux muxthreebyfour(control_x_coordinate[2:2] & control_y_coordinate[3:3],control,wthreebyfour);

control_signal_mux muxthreebythree(control_x_coordinate[2:2] & control_y_coordinate[2:2],control,wthreebythree);

control_signal_mux muxthreebytwo(control_x_coordinate[2:2] & control_y_coordinate[1:1],control,wthreebytwo);

control_signal_mux muxthreebyone(control_x_coordinate[2:2] & control_y_coordinate[0:0],control,wthreebyone);


digit_store threebyeight(clk,set & set_coordinate_x[2:2] & set_coordinate_y[7:7],reset,upper_edge[2:2],three_by_eight_to_three_by_seven,three_by_eight_to_two_by_eight,three_by_eight_to_four_by_eight,four_by_eight_to_three_by_eight,two_by_eight_to_three_by_eight,three_by_seven_to_three_by_eight,1'b0,wthreebyeight,row_8[5:5]);

digit_store threebyseven(clk,set & set_coordinate_x[2:2] & set_coordinate_y[6:6],reset,three_by_seven_to_three_by_eight,three_by_seven_to_three_by_six,three_by_seven_to_two_by_seven,three_by_seven_to_four_by_seven,four_by_seven_to_three_by_seven,two_by_seven_to_three_by_seven,three_by_six_to_three_by_seven,three_by_eight_to_three_by_seven,wthreebyseven,row_7[5:5]);

digit_store threebysix(clk,set & set_coordinate_x[2:2] & set_coordinate_y[5:5],reset,three_by_six_to_three_by_seven,three_by_six_to_three_by_five,three_by_six_to_two_by_six,three_by_six_to_four_by_six,four_by_six_to_three_by_six,two_by_six_to_three_by_six,three_by_five_to_three_by_six,three_by_seven_to_three_by_six,wthreebysix,row_6[5:5]);

digit_store threebyfive(clk,set & set_coordinate_x[2:2] & set_coordinate_y[4:4],reset,three_by_five_to_three_by_six,three_by_five_to_three_by_four,three_by_five_to_two_by_five,three_by_five_to_four_by_five,four_by_five_to_three_by_five,two_by_five_to_three_by_five,three_by_four_to_three_by_five,three_by_six_to_three_by_five,wthreebyfive,row_5[5:5]);

digit_store threebyfour(clk,set & set_coordinate_x[2:2] & set_coordinate_y[3:3],reset,three_by_four_to_three_by_five,three_by_four_to_three_by_three,three_by_four_to_two_by_four,three_by_four_to_four_by_four,four_by_four_to_three_by_four,two_by_four_to_three_by_four,three_by_three_to_three_by_four,three_by_five_to_three_by_four,wthreebyfour,row_4[5:5]);

digit_store threebythree(clk,set & set_coordinate_x[2:2] & set_coordinate_y[2:2],reset,three_by_three_to_three_by_four,three_by_three_to_three_by_two,three_by_three_to_two_by_three,three_by_three_to_four_by_three,four_by_three_to_three_by_three,two_by_three_to_three_by_three,three_by_two_to_three_by_three,three_by_four_to_three_by_three,wthreebythree,row_3[5:5]);

digit_store threebytwo(clk,set & set_coordinate_x[2:2] & set_coordinate_y[1:1],reset,three_by_two_to_three_by_three,three_by_two_to_three_by_one,three_by_two_to_two_by_two,three_by_two_to_four_by_two,four_by_two_to_three_by_two,two_by_two_to_three_by_two,three_by_one_to_three_by_two,three_by_three_to_three_by_two,wthreebytwo,row_2[5:5]);

digit_store threebyone(clk,set & set_coordinate_x[2:2] & set_coordinate_y[0:0],reset,three_by_one_to_three_by_two,lower_edge[2:2],three_by_one_to_two_by_one,three_by_one_to_four_by_one,four_by_one_to_three_by_one,two_by_one_to_three_by_one,1'b0,three_by_two_to_three_by_one,wthreebyone,row_1[5:5]);


control_signal_mux muxfourbyeight(control_x_coordinate[3:3] & control_y_coordinate[7:7],control,wfourbyeight);

control_signal_mux muxfourbyseven(control_x_coordinate[3:3] & control_y_coordinate[6:6],control,wfourbyseven);

control_signal_mux muxfourbysix(control_x_coordinate[3:3] & control_y_coordinate[5:5],control,wfourbysix);

control_signal_mux muxfourbyfive(control_x_coordinate[3:3] & control_y_coordinate[4:4],control,wfourbyfive);

control_signal_mux muxfourbyfour(control_x_coordinate[3:3] & control_y_coordinate[3:3],control,wfourbyfour);

control_signal_mux muxfourbythree(control_x_coordinate[3:3] & control_y_coordinate[2:2],control,wfourbythree);

control_signal_mux muxfourbytwo(control_x_coordinate[3:3] & control_y_coordinate[1:1],control,wfourbytwo);

control_signal_mux muxfourbyone(control_x_coordinate[3:3] & control_y_coordinate[0:0],control,wfourbyone);


digit_store fourbyeight(clk,set & set_coordinate_x[3:3] & set_coordinate_y[7:7],reset,upper_edge[3:3],four_by_eight_to_four_by_seven,four_by_eight_to_three_by_eight,four_by_eight_to_five_by_eight,five_by_eight_to_four_by_eight,three_by_eight_to_four_by_eight,four_by_seven_to_four_by_eight,1'b0,wfourbyeight,row_8[4:4]);

digit_store fourbyseven(clk,set & set_coordinate_x[3:3] & set_coordinate_y[6:6],reset,four_by_seven_to_four_by_eight,four_by_seven_to_four_by_six,four_by_seven_to_three_by_seven,four_by_seven_to_five_by_seven,five_by_seven_to_four_by_seven,three_by_seven_to_four_by_seven,four_by_six_to_four_by_seven,four_by_eight_to_four_by_seven,wfourbyseven,row_7[4:4]);

digit_store fourbysix(clk,set & set_coordinate_x[3:3] & set_coordinate_y[5:5],reset,four_by_six_to_four_by_seven,four_by_six_to_four_by_five,four_by_six_to_three_by_six,four_by_six_to_five_by_six,five_by_six_to_four_by_six,three_by_six_to_four_by_six,four_by_five_to_four_by_six,four_by_seven_to_four_by_six,wfourbysix,row_6[4:4]);

digit_store fourbyfive(clk,set & set_coordinate_x[3:3] & set_coordinate_y[4:4],reset,four_by_five_to_four_by_six,four_by_five_to_four_by_four,four_by_five_to_three_by_five,four_by_five_to_five_by_five,five_by_five_to_four_by_five,three_by_five_to_four_by_five,four_by_four_to_four_by_five,four_by_six_to_four_by_five,wfourbyfive,row_5[4:4]);

digit_store fourbyfour(clk,set & set_coordinate_x[3:3] & set_coordinate_y[3:3],reset,four_by_four_to_four_by_five,four_by_four_to_four_by_three,four_by_four_to_three_by_four,four_by_four_to_five_by_four,five_by_four_to_four_by_four,three_by_four_to_four_by_four,four_by_three_to_four_by_four,four_by_five_to_four_by_four,wfourbyfour,row_4[4:4]);

digit_store fourbythree(clk,set & set_coordinate_x[3:3] & set_coordinate_y[2:2],reset,four_by_three_to_four_by_four,four_by_three_to_four_by_two,four_by_three_to_three_by_three,four_by_three_to_five_by_three,five_by_three_to_four_by_three,three_by_three_to_four_by_three,four_by_two_to_four_by_three,four_by_four_to_four_by_three,wfourbythree,row_3[4:4]);

digit_store fourbytwo(clk,set & set_coordinate_x[3:3] & set_coordinate_y[1:1],reset,four_by_two_to_four_by_three,four_by_two_to_four_by_one,four_by_two_to_three_by_two,four_by_two_to_five_by_two,five_by_two_to_four_by_two,three_by_two_to_four_by_two,four_by_one_to_four_by_two,four_by_three_to_four_by_two,wfourbytwo,row_2[4:4]);

digit_store fourbyone(clk,set & set_coordinate_x[3:3] & set_coordinate_y[0:0],reset,four_by_one_to_four_by_two,lower_edge[3:3],four_by_one_to_three_by_one,four_by_one_to_five_by_one,five_by_one_to_four_by_one,three_by_one_to_four_by_one,1'b0,four_by_two_to_four_by_one,wfourbyone,row_1[4:4]);


control_signal_mux muxfivebyeight(control_x_coordinate[4:4] & control_y_coordinate[7:7],control,wfivebyeight);

control_signal_mux muxfivebyseven(control_x_coordinate[4:4] & control_y_coordinate[6:6],control,wfivebyseven);

control_signal_mux muxfivebysix(control_x_coordinate[4:4] & control_y_coordinate[5:5],control,wfivebysix);

control_signal_mux muxfivebyfive(control_x_coordinate[4:4] & control_y_coordinate[4:4],control,wfivebyfive);

control_signal_mux muxfivebyfour(control_x_coordinate[4:4] & control_y_coordinate[3:3],control,wfivebyfour);

control_signal_mux muxfivebythree(control_x_coordinate[4:4] & control_y_coordinate[2:2],control,wfivebythree);

control_signal_mux muxfivebytwo(control_x_coordinate[4:4] & control_y_coordinate[1:1],control,wfivebytwo);

control_signal_mux muxfivebyone(control_x_coordinate[4:4] & control_y_coordinate[0:0],control,wfivebyone);


digit_store fivebyeight(clk,set & set_coordinate_x[4:4] & set_coordinate_y[7:7],reset,upper_edge[4:4],five_by_eight_to_five_by_seven,five_by_eight_to_four_by_eight,five_by_eight_to_six_by_eight,six_by_eight_to_five_by_eight,four_by_eight_to_five_by_eight,five_by_seven_to_five_by_eight,1'b0,wfivebyeight,row_8[3:3]);

digit_store fivebyseven(clk,set & set_coordinate_x[4:4] & set_coordinate_y[6:6],reset,five_by_seven_to_five_by_eight,five_by_seven_to_five_by_six,five_by_seven_to_four_by_seven,five_by_seven_to_six_by_seven,six_by_seven_to_five_by_seven,four_by_seven_to_five_by_seven,five_by_six_to_five_by_seven,five_by_eight_to_five_by_seven,wfivebyseven,row_7[3:3]);

digit_store fivebysix(clk,set & set_coordinate_x[4:4] & set_coordinate_y[5:5],reset,five_by_six_to_five_by_seven,five_by_six_to_five_by_five,five_by_six_to_four_by_six,five_by_six_to_six_by_six,six_by_six_to_five_by_six,four_by_six_to_five_by_six,five_by_five_to_five_by_six,five_by_seven_to_five_by_six,wfivebysix,row_6[3:3]);

digit_store fivebyfive(clk,set & set_coordinate_x[4:4] & set_coordinate_y[4:4],reset,five_by_five_to_five_by_six,five_by_five_to_five_by_four,five_by_five_to_four_by_five,five_by_five_to_six_by_five,six_by_five_to_five_by_five,four_by_five_to_five_by_five,five_by_four_to_five_by_five,five_by_six_to_five_by_five,wfivebyfive,row_5[3:3]);

digit_store fivebyfour(clk,set & set_coordinate_x[4:4] & set_coordinate_y[3:3],reset,five_by_four_to_five_by_five,five_by_four_to_five_by_three,five_by_four_to_four_by_four,five_by_four_to_six_by_four,six_by_four_to_five_by_four,four_by_four_to_five_by_four,five_by_three_to_five_by_four,five_by_five_to_five_by_four,wfivebyfour,row_4[3:3]);

digit_store fivebythree(clk,set & set_coordinate_x[4:4] & set_coordinate_y[2:2],reset,five_by_three_to_five_by_four,five_by_three_to_five_by_two,five_by_three_to_four_by_three,five_by_three_to_six_by_three,six_by_three_to_five_by_three,four_by_three_to_five_by_three,five_by_two_to_five_by_three,five_by_four_to_five_by_three,wfivebythree,row_3[3:3]);

digit_store fivebytwo(clk,set & set_coordinate_x[4:4] & set_coordinate_y[1:1],reset,five_by_two_to_five_by_three,five_by_two_to_five_by_one,five_by_two_to_four_by_two,five_by_two_to_six_by_two,six_by_two_to_five_by_two,four_by_two_to_five_by_two,five_by_one_to_five_by_two,five_by_three_to_five_by_two,wfivebytwo,row_2[3:3]);

digit_store fivebyone(clk,set & set_coordinate_x[4:4] & set_coordinate_y[0:0],reset,five_by_one_to_five_by_two,lower_edge[4:4],five_by_one_to_four_by_one,five_by_one_to_six_by_one,six_by_one_to_five_by_one,four_by_one_to_five_by_one,1'b0,five_by_two_to_five_by_one,wfivebyone,row_1[3:3]);


control_signal_mux muxsixbyeight(control_x_coordinate[5:5] & control_y_coordinate[7:7],control,wsixbyeight);

control_signal_mux muxsixbyseven(control_x_coordinate[5:5] & control_y_coordinate[6:6],control,wsixbyseven);

control_signal_mux muxsixbysix(control_x_coordinate[5:5] & control_y_coordinate[5:5],control,wsixbysix);

control_signal_mux muxsixbyfive(control_x_coordinate[5:5] & control_y_coordinate[4:4],control,wsixbyfive);

control_signal_mux muxsixbyfour(control_x_coordinate[5:5] & control_y_coordinate[3:3],control,wsixbyfour);

control_signal_mux muxsixbythree(control_x_coordinate[5:5] & control_y_coordinate[2:2],control,wsixbythree);

control_signal_mux muxsixbytwo(control_x_coordinate[5:5] & control_y_coordinate[1:1],control,wsixbytwo);

control_signal_mux muxsixbyone(control_x_coordinate[5:5] & control_y_coordinate[0:0],control,wsixbyone);


digit_store sixbyeight(clk,set & set_coordinate_x[5:5] & set_coordinate_y[7:7],reset,upper_edge[5:5],six_by_eight_to_six_by_seven,six_by_eight_to_five_by_eight,six_by_eight_to_seven_by_eight,seven_by_eight_to_six_by_eight,five_by_eight_to_six_by_eight,six_by_seven_to_six_to_eight,1'b0,wsixbyeight,row_8[2:2]);

digit_store sixbyseven(clk,set & set_coordinate_x[5:5] & set_coordinate_y[6:6],reset,six_by_seven_to_six_to_eight,six_by_seven_to_six_by_six,six_by_seven_to_five_by_seven,six_by_seven_to_seven_by_seven,seven_by_seven_to_six_by_seven,five_by_seven_to_six_by_seven,six_by_six_to_six_by_seven,six_by_eight_to_six_by_seven,wsixbyseven,row_7[2:2]);

digit_store sixbysix(clk,set & set_coordinate_x[5:5] & set_coordinate_y[5:5],reset,six_by_six_to_six_by_seven,six_by_six_to_six_by_five,six_by_six_to_five_by_six,six_by_six_to_seven_by_six,seven_by_six_to_six_by_six,five_by_six_to_six_by_six,six_by_five_to_six_by_six,six_by_seven_to_six_by_six,wsixbysix,row_6[2:2]);

digit_store sixbyfive(clk,set & set_coordinate_x[5:5] & set_coordinate_y[4:4],reset,six_by_five_to_six_by_six,six_by_five_to_six_by_four,six_by_five_to_five_by_five,six_by_five_to_seven_by_five,seven_by_five_to_six_by_five,five_by_five_to_six_by_five,six_by_four_to_six_by_five,six_by_six_to_six_by_five,wsixbyfive,row_5[2:2]);

digit_store sixbyfour(clk,set & set_coordinate_x[5:5] & set_coordinate_y[3:3],reset,six_by_four_to_six_by_five,six_by_four_to_six_by_three,six_by_four_to_five_by_four,six_by_four_to_seven_by_four,seven_by_four_to_six_by_four,five_by_four_to_six_by_four,six_by_three_to_six_by_four,six_by_five_to_six_by_four,wsixbyfour,row_4[2:2]);

digit_store sixbythree(clk,set & set_coordinate_x[5:5] & set_coordinate_y[2:2],reset,six_by_three_to_six_by_four,six_by_three_to_six_by_two,six_by_three_to_five_by_three,six_by_three_to_seven_by_three,seven_by_three_to_six_by_three,five_by_three_to_six_by_three,six_by_two_to_six_by_three,six_by_four_to_six_by_three,wsixbythree,row_3[2:2]);

digit_store sixbytwo(clk,set & set_coordinate_x[5:5] & set_coordinate_y[1:1],reset,six_by_two_to_six_by_three,six_by_two_to_six_by_one,six_by_two_to_five_by_two,six_by_two_to_seven_by_two,seven_by_two_to_six_by_two,five_by_two_to_six_by_two,six_by_one_to_six_by_two,six_by_three_to_six_by_two,wsixbytwo,row_2[2:2]);

digit_store sixbyone(clk,set & set_coordinate_x[5:5] & set_coordinate_y[0:0],reset,six_by_one_to_six_by_two,lower_edge[5:5],six_by_one_to_five_by_one,six_by_one_to_seven_by_one,seven_by_one_to_six_by_one,five_by_one_to_six_by_one,1'b0,six_by_two_to_six_by_one,wsixbyone,row_1[2:2]);


control_signal_mux muxsevenbyeight(control_x_coordinate[6:6] & control_y_coordinate[7:7],control,wsevenbyeight);

control_signal_mux muxsevenbyseven(control_x_coordinate[6:6] & control_y_coordinate[6:6],control,wsevenbyseven);

control_signal_mux muxsevenbysix(control_x_coordinate[6:6] & control_y_coordinate[5:5],control,wsevenbysix);

control_signal_mux muxsevenbyfive(control_x_coordinate[6:6] & control_y_coordinate[4:4],control,wsevenbyfive);

control_signal_mux muxsevenbyfour(control_x_coordinate[6:6] & control_y_coordinate[3:3],control,wsevenbyfour);

control_signal_mux muxsevenbythree(control_x_coordinate[6:6] & control_y_coordinate[2:2],control,wsevenbythree);

control_signal_mux muxsevenbytwo(control_x_coordinate[6:6] & control_y_coordinate[1:1],control,wsevenbytwo);

control_signal_mux muxsevenbyone(control_x_coordinate[6:6] & control_y_coordinate[0:0],control,wsevenbyone);


digit_store sevenbyeight(clk,set & set_coordinate_x[6:6] & set_coordinate_y[7:7],reset,upper_edge[6:6],seven_by_eight_to_seven_by_seven,seven_by_eight_to_six_by_eight,seven_by_eight_to_eight_by_eight,eight_by_eight_to_seven_by_eight,six_by_eight_to_seven_by_eight,seven_by_seven_to_seven_by_eight,1'b0,wsevenbyeight,row_8[1:1]);

digit_store sevenbyseven(clk,set & set_coordinate_x[6:6] & set_coordinate_y[6:6],reset,seven_by_seven_to_seven_by_eight,seven_by_seven_to_seven_by_six,seven_by_seven_to_six_by_seven,seven_by_seven_to_eight_by_seven,eight_by_seven_to_seven_by_seven,six_by_seven_to_seven_by_seven,seven_by_six_to_seven_by_seven,seven_by_eight_to_seven_by_seven,wsevenbyseven,row_7[1:1]);

digit_store sevenbysix(clk,set & set_coordinate_x[6:6] & set_coordinate_y[5:5],reset,seven_by_six_to_seven_by_seven,seven_by_six_to_seven_by_five,seven_by_six_to_six_by_six,seven_by_six_to_eight_by_six,eight_by_six_to_seven_by_six,six_by_six_to_seven_by_six,seven_by_five_to_seven_by_six,seven_by_seven_to_seven_by_six,wsevenbysix,row_6[1:1]);

digit_store sevenbyfive(clk,set & set_coordinate_x[6:6] & set_coordinate_y[4:4],reset,seven_by_five_to_seven_by_six,seven_by_five_to_seven_by_four,seven_by_five_to_six_by_five,seven_by_five_to_eight_by_five,eight_by_five_to_seven_by_five,six_by_five_to_seven_by_five,seven_by_four_to_seven_by_five,seven_by_six_to_seven_by_five,wsevenbyfive,row_5[1:1]);

digit_store sevenbyfour(clk,set & set_coordinate_x[6:6] & set_coordinate_y[3:3],reset,seven_by_four_to_seven_by_five,seven_by_four_to_seven_by_three,seven_by_four_to_six_by_four,seven_by_four_to_eight_by_four,eight_by_four_to_seven_by_four,six_by_four_to_seven_by_four,seven_by_three_to_seven_by_four,seven_by_five_to_seven_by_four,wsevenbyfour,row_4[1:1]);

digit_store sevenbythree(clk,set & set_coordinate_x[6:6] & set_coordinate_y[2:2],reset,seven_by_three_to_seven_by_four,seven_by_three_to_seven_by_two,seven_by_three_to_six_by_three,seven_by_three_to_eight_by_three,eight_by_three_to_seven_by_three,six_by_three_to_seven_by_three,seven_by_two_to_seven_by_three,seven_by_four_to_seven_by_three,wsevenbythree,row_3[1:1]);

digit_store sevenbytwo(clk,set & set_coordinate_x[6:6] & set_coordinate_y[1:1],reset,seven_by_two_to_seven_by_three,seven_by_two_to_seven_by_one,seven_by_two_to_six_by_two,seven_by_two_to_eight_by_two,eight_by_two_to_seven_by_two,six_by_two_to_seven_by_two,seven_by_one_to_seven_by_two,seven_by_three_to_seven_by_two,wsevenbytwo,row_2[1:1]);

digit_store sevenbyone(clk,set & set_coordinate_x[6:6] & set_coordinate_y[0:0],reset,seven_by_one_to_seven_by_two,lower_edge[6:6],seven_by_one_to_six_by_one,seven_by_one_to_eight_by_one,eight_by_one_to_seven_by_one,six_by_one_to_seven_by_one,1'b0,seven_by_two_to_seven_by_one,wsevenbyone,row_1[1:1]);


control_signal_mux muxeightbyeight(control_x_coordinate[7:7] & control_y_coordinate[7:7],control,weightbyeight);

control_signal_mux muxeightbyseven(control_x_coordinate[7:7] & control_y_coordinate[6:6],control,weightbyseven);

control_signal_mux muxeightbysix(control_x_coordinate[7:7] & control_y_coordinate[5:5],control,weightbysix);

control_signal_mux muxeightbyfive(control_x_coordinate[7:7] & control_y_coordinate[4:4],control,weightbyfive);

control_signal_mux muxeightbyfour(control_x_coordinate[7:7] & control_y_coordinate[3:3],control,weightbyfour);

control_signal_mux muxeightbythree(control_x_coordinate[7:7] & control_y_coordinate[2:2],control,weightbythree);

control_signal_mux muxeightbytwo(control_x_coordinate[7:7] & control_y_coordinate[1:1],control,weightbytwo);

control_signal_mux muxeightbyone(control_x_coordinate[7:7] & control_y_coordinate[0:0],control,weightbyone);


digit_store eightbyeight(clk,set & set_coordinate_x[7:7] & set_coordinate_y[7:7],reset,upper_edge[7:7],eight_by_eight_to_eight_by_seven,eight_by_eight_to_seven_by_eight,right_edge[7:7],1'b0,seven_by_eight_to_eight_by_eight,eight_by_seven_to_eight_by_eight,1'b0,weightbyeight,row_8[0:0]);

digit_store eightbyseven(clk,set & set_coordinate_x[7:7] & set_coordinate_y[6:6],reset,eight_by_seven_to_eight_by_eight,eight_by_seven_to_eight_by_six,eight_by_seven_to_seven_by_seven,right_edge[6:6],1'b0,seven_by_seven_to_eight_by_seven,eight_by_six_to_eight_by_seven,eight_by_eight_to_eight_by_seven,weightbyseven,row_7[0:0]);

digit_store eightbysix(clk,set & set_coordinate_x[7:7] & set_coordinate_y[5:5],reset,eight_by_six_to_eight_by_seven,eight_by_six_to_eight_by_five,eight_by_six_to_seven_by_six,right_edge[5:5],1'b0,seven_by_six_to_eight_by_six,eight_by_five_to_eight_by_six,eight_by_seven_to_eight_by_six,weightbysix,row_6[0:0]);

digit_store eightbyfive(clk,set & set_coordinate_x[7:7] & set_coordinate_y[4:4],reset,eight_by_five_to_eight_by_six,eight_by_five_to_eight_by_four,eight_by_five_to_seven_by_five,right_edge[4:4],1'b0,seven_by_five_to_eight_by_five,eight_by_four_to_eight_by_five,eight_by_six_to_eight_by_five,weightbyfive,row_5[0:0]);

digit_store eightbyfour(clk,set & set_coordinate_x[7:7] & set_coordinate_y[3:3],reset,eight_by_four_to_eight_by_five,eight_by_four_to_eight_by_three,eight_by_four_to_seven_by_four,right_edge[3:3],1'b0,seven_by_four_to_eight_by_four,eight_by_three_to_eight_by_four,eight_by_five_to_eight_by_four,weightbyfour,row_4[0:0]);

digit_store eightbythree(clk,set & set_coordinate_x[7:7] & set_coordinate_y[2:2],reset,eight_by_three_to_eight_by_four,eight_by_three_to_eight_by_two,eight_by_three_to_seven_by_three,right_edge[2:2],1'b0,seven_by_three_to_eight_by_three,eight_by_two_to_eight_by_three,eight_by_four_to_eight_by_three,weightbythree,row_3[0:0]);

digit_store eightbytwo(clk,set & set_coordinate_x[7:7] & set_coordinate_y[1:1],reset,eight_by_two_to_eight_by_three,eight_by_two_to_eight_by_one,eight_by_two_to_seven_by_two,right_edge[1:1],1'b0,seven_by_two_to_eight_by_two,eight_by_one_to_eight_by_two,eight_by_three_to_eight_by_two,weightbytwo,row_2[0:0]);

digit_store eightbyone(clk,set & set_coordinate_x[7:7] & set_coordinate_y[0:0],reset,eight_by_one_to_eight_by_two,lower_edge[7:7],eight_by_one_to_seven_by_one,right_edge[0:0],1'b0,seven_by_one_to_eight_by_one,1'b0,eight_by_two_to_eight_by_one,weightbyone,row_1[0:0]);



endmodule

//bi_shift_register row_one(clk,right_shift[7:7],left_shift[7:7],up_shift,down_shift,row_2,8'b0,row_1,reset,set_coordinate_x,(set_coordinate_y[7:7] & set));

//bi_shift_register row_two(clk,right_shift[6:6],left_shift[6:6],up_shift,down_shift,row_3,row_1,row_2,reset,set_coordinate_x,(set_coordinate_y[6:6] & set));

//bi_shift_register row_three(clk,right_shift[5:5],left_shift[5:5],up_shift,down_shift,row_4,row_2,row_3,reset,set_coordinate_x,(set_coordinate_y[5:5] & set));

//bi_shift_register row_four(clk,right_shift[4:4],left_shift[4:4],up_shift,down_shift,row_5,row_3,row_4,reset,set_coordinate_x,(set_coordinate_y[4:4] & set));

//bi_shift_register row_five(clk,right_shift[3:3],left_shift[3:3],up_shift,down_shift,row_6,row_4,row_5,reset,set_coordinate_x,(set_coordinate_y[3:3] & set));

//bi_shift_register row_six(clk,right_shift[2:2],left_shift[2:2],up_shift,down_shift,row_7,row_5,row_6,reset,set_coordinate_x,(set_coordinate_y[2:2] & set));

//bi_shift_register row_seven(clk,right_shift[1:1],left_shift[1:1],up_shift,down_shift,row_8,row_6,row_7,reset,set_coordinate_x,(set_coordinate_y[1:1] & set));

//bi_shift_register row_eight(clk,right_shift[0:0],left_shift[0:0],up_shift,down_shift,8'b0,row_7,row_8,reset,set_coordinate_x,(set_coordinate_y[0:0] & set));
module control_signal_mux(select,in,out);
input select;
input [2:0] in;
output reg [2:0] out;

always@* begin
if(select == 1) begin 
out = in;
end else begin
out = 3'b111;
end



end
endmodule

//always@(select) begin
//if(select == 1) begin 
//out = in;
//end else begin
//out = 3'b111;
//end
//
//
//
//end
//endmodule



module digit_store(clk,set,reset,out_up,out_down,out_left,out_right,left_shift,right_shift,up_shift,down_shift,user_input,data_out);
input clk,set,reset,left_shift,right_shift,up_shift,down_shift;
input [2:0] user_input;
reg [1:0] direction;
output reg out_up,out_down,out_left,out_right,data_out;

always@(posedge clk,posedge reset,posedge set) begin

				if(reset == 1) begin
				
				data_out = 0;
				direction = 2'b00;
				out_right = data_out; 
				out_left= data_out; 
				out_up = data_out; 
	         out_down = data_out; 

				end else begin 
								if(set == 1) begin
								   
								   data_out = 1;
				                   
									case (user_input) 
                           3'b000: begin direction = 2'b00; end
                           3'b001: begin direction = 2'b01; end
                           3'b010: begin direction = 2'b10; end
                           3'b011: begin direction = 2'b11; end
                           default: begin direction = 2'b00; end
									endcase
								
								case (direction) 
										2'b00: begin out_right = 1; 
										out_left = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b01: begin out_left = 1; 
										out_right = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b10: begin out_up = 1; 
										out_down = 0;
										out_right = 0;
										out_left = 0;
										end
										2'b11: begin out_down = 1; 
										out_right = 0;
										out_left = 0;
										out_up = 0; 
										end
										default: begin out_right = 1; 
										out_left = 0;
										out_up = 0; 
										out_down = 0;
										end
										endcase
								
									

							      end else begin 
									if(data_out == 0) begin
										if(right_shift == 1)begin
										direction = 2'b00;
										end else begin
												if(left_shift == 1) begin
												direction = 2'b01;
													end else begin
															if(up_shift == 1) begin
															direction = 2'b10;
																end else begin
																		if(down_shift == 1) begin
																		direction = 2'b11;
																		end else begin
																		direction = direction;
																		end
																	end
														end 
											end
									end else begin
											direction = direction;
										end
										
										data_out = left_shift|right_shift|up_shift|down_shift;
										
									case (direction) 
										2'b00: begin out_right = data_out; 
										out_left = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b01: begin out_left = data_out; 
										out_right = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b10: begin out_up = data_out; 
										out_down = 0;
										out_right = 0;
										out_left = 0;
										end
										2'b11: begin out_down = data_out;
										out_left = 0;
										out_up = 0;
									//error was here	
										out_right = 0;
									end
										default: begin out_right = data_out;
										out_left = 0;
										out_up = 0; 
										out_down = 0;
									   end
										endcase
                               end   
				     end
                                      

end
endmodule

module bcd_to_decimal(bcd,out);

input [2:0] bcd;
output reg [7:0] out;

always @*
 begin
									case (bcd) 
                           3'b000: begin 
						out = 8'b00000001;
								
								end
                           3'b001: begin
						out = 8'b00000010;
								
								end
                           3'b010: begin 
						out = 8'b00000100;
								end
                           3'b011: begin 
						out = 8'b00001000;
								end
								   3'b100: begin
						out = 8'b00010000;			
								end
									3'b101: begin
						out = 8'b00100000;	
								end
									3'b110: begin
						out = 8'b01000000;		
								end
									3'b111: begin
						out = 8'b10000000;			
								end
									
                           default: begin 
						out = 8'b00000001;
								end
									endcase
 end
endmodule


module move_input(left,right,up,down,out,reset,clk);

input left,right,up,down,reset,clk;

output reg [2:0] out;

always@(posedge clk,posedge reset) begin
if(reset == 1) begin
out = 3'b000;
end else begin

if ( left == 1) begin
	if ( out == 3'b000) begin
	out = out;
	end else begin
	out = 3'b001;
	end
end else begin
	if(right == 1) begin
		if( out == 3'b001)begin
		out = out;
		end else begin
		out = 3'b000;
		end 
	end else begin
		if(up == 1) begin
			if (out == 3'b011) begin 
			out = out;
			end else begin
			out = 3'b010;
			end
		end else begin
			if(down == 1) begin
				if(out == 3'b010)begin
				out = out;
				end else begin
				out = 3'b011;
				end
			end else begin
				out = out;
			end
		end
	end

end
end
end
endmodule
																		
module three_bit_mux(in1,in2,cntrl,out1);
input [2:0] in1;
input [2:0] in2;

input cntrl;

output reg [2:0] out1;

always@(in1,in2,cntrl) begin
if( cntrl == 0) begin
out1 = in2;
end else begin
out1 = in1;
end
end

endmodule
																	
module three_bit_flip_flop(D,clk,Q,set,rst);

input clk,rst;

input [2:0]D,set;

output[2:0] Q;

D_Flip_Flop D1 (D[0],Q[0],rst,clk,set[0]);

D_Flip_Flop D2 (D[1],Q[1],rst,clk,set[1]);

D_Flip_Flop D3 (D[2],Q[2],rst,clk,set[2]);

endmodule

module D_Flip_Flop(D,Q,Rst,Clk,set);
input D,Rst,Clk,set;
output reg Q;

always@(posedge Clk,posedge Rst, posedge set) begin
if(set == 1) begin
Q <= 1;
end
else if(Rst == 1) begin
Q <= 0;
end
else begin
Q <= D;
end
end

endmodule

module position_recorder(clk,r,l,u,d,reset,motion_x,motion_y,edge_collision,load_x,load_y,load);

  input clk,reset;
  input l,r,u,d;
  output reg[2:0] motion_x;
  output reg[2:0] motion_y;
  reg[3:0] reg_x;
  reg[3:0] reg_y;
  output reg edge_collision;
  input [2:0] load_x;
  input [2:0] load_y;
  input load;
  
  
  

  always@(posedge clk,posedge reset,posedge load) begin
		if(reset == 1)begin
		reg_y = 4'b0011;
		reg_x = 4'b0011;
		motion_x = reg_x[2:0];
		motion_y = reg_y[2:0];
		edge_collision = 0;
		end else begin
			if(load == 1) begin
			reg_x[2:0] = load_x;
			reg_x[3:3] = 0;
			reg_y[2:0] = load_y;
			reg_y[3:3] = 0;
			edge_collision = 0;
			motion_x = load_x;
			motion_y = load_y;
			end else begin

			if(l==1) begin
				reg_x = reg_x - 4'b0001;
			end else begin
				if(r==1) begin
					reg_x = reg_x + 4'b0001;
				end else begin
							if(u==1) begin
							reg_y = reg_y + 4'b0001;
							end else begin
									if(d==1) begin
										reg_y = reg_y - 4'b0001;
										end else begin
											reg_y = reg_y;
											reg_x = reg_x;
										end
							end
				end
				end
				
			motion_x = reg_x[2:0];
			motion_y = reg_y[2:0];
			
			edge_collision = reg_x[3:3]|reg_y[3:3];
			end
			
		

		end  

  end
endmodule
											  
module move_to_position(bcd,r,l,u,d);

input [2:0] bcd;
output reg l,r,u,d;

always @*
 begin
									case (bcd) 
                           3'b000: begin 
									r = 1;
									u = 0;
									d = 0;
									l = 0;
								
								end
                           3'b001: begin
									r = 0;
									u = 0;
									d = 0;
									l = 1;
								
								end
                           3'b010: begin 
									r = 0;
									u = 1;
									d = 0;
									l = 0;
								
								end
                           3'b011: begin 
									r = 0;
									u = 0;
									d = 1;
									l = 0;
								
								end
                           default: begin 
									r = 0;
									u = 0;
									d = 0;
									l = 0;
								
								end
									endcase
 end
endmodule

	
     
module move_register(clk,load,out_head,out_pos,pos,reset,shift);

input clk,reset,shift;

input [2:0] load;

input [5:0] pos;

output reg [2:0] out_head,out_pos;

reg [191:0] hold_all;



always@(posedge clk,posedge reset)begin
	if(reset == 1) begin
	hold_all = 192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
	out_head = hold_all[191:189];
	out_pos = hold_all[191:189];
	end else begin
	
		if(shift == 1) begin
		hold_all = hold_all >> 1;
		hold_all = hold_all >> 1;
		hold_all = hold_all >> 1;

		hold_all[191:189] = load;
		end else begin
		hold_all = hold_all;
		end
		
	out_head = hold_all[191:189];
	
	case(pos)
	6'b000000:begin out_pos = hold_all[191:189]; end
	6'b000001:begin out_pos = hold_all[188:186]; end
	6'b000010:begin out_pos = hold_all[185:183]; end
	6'b000011:begin out_pos = hold_all[182:180];	end
	6'b000100:begin out_pos = hold_all[179:177]; end
	6'b000101:begin out_pos = hold_all[176:174]; end
	6'b000110:begin out_pos = hold_all[173:171]; end
	6'b000111:begin out_pos = hold_all[170:168]; end
	6'b001000:begin out_pos = hold_all[167:165]; end
	6'b001001:begin out_pos = hold_all[164:162]; end
	6'b001010:begin out_pos = hold_all[161:159]; end
	6'b001011:begin out_pos = hold_all[158:156]; end
	6'b001100:begin out_pos = hold_all[155:153]; end
	6'b001101:begin out_pos = hold_all[152:150]; end
	6'b001110:begin out_pos = hold_all[149:147]; end
	6'b001111:begin out_pos = hold_all[146:144]; end
	6'b010000:begin out_pos = hold_all[143:141]; end
	6'b010001:begin out_pos = hold_all[140:138]; end
	6'b010010:begin out_pos = hold_all[137:135]; end
	6'b010011:begin out_pos = hold_all[134:132]; end
	6'b010100:begin out_pos = hold_all[131:129]; end
	6'b010101:begin out_pos = hold_all[128:126]; end
	6'b010110:begin out_pos = hold_all[125:123]; end
	6'b010111:begin out_pos = hold_all[122:120]; end
	6'b011000:begin out_pos = hold_all[119:117]; end
	6'b011001:begin out_pos = hold_all[116:114]; end
	6'b011010: begin out_pos = hold_all[113:111]; end
	6'b011011: begin out_pos = hold_all[110:108]; end
	6'b011100: begin out_pos = hold_all[107:105]; end
	6'b011101: begin out_pos = hold_all[104:102]; end
	6'b011110: begin out_pos = hold_all[101:99]; end
	6'b011111: begin out_pos = hold_all[98:96]; end
	6'b100000: begin out_pos = hold_all[95:93]; end
	6'b100001: begin out_pos = hold_all[92:90]; end
	6'b100010: begin out_pos = hold_all[89:87]; end
	6'b100011: begin out_pos = hold_all[86:84]; end
	6'b100100: begin out_pos = hold_all[83:81]; end
	6'b100101: begin out_pos = hold_all[80:78]; end
	6'b100110: begin out_pos = hold_all[77:75]; end
	6'b100111: begin out_pos = hold_all[74:72]; end
	6'b101000: begin out_pos = hold_all[71:69]; end
	6'b101001: begin out_pos = hold_all[68:66]; end
	6'b101010: begin out_pos = hold_all[65:63]; end
	6'b101011: begin out_pos = hold_all[62:60]; end
	6'b101100: begin out_pos = hold_all[59:57]; end
	6'b101101: begin out_pos = hold_all[56:54]; end
	6'b101110: begin out_pos = hold_all[53:51]; end
	6'b101111: begin out_pos = hold_all[50:48]; end
	6'b110000: begin out_pos = hold_all[47:45]; end
	6'b110001: begin out_pos = hold_all[44:42]; end
	6'b110010: begin out_pos = hold_all[41:39]; end
	6'b110011: begin out_pos = hold_all[38:36]; end
	6'b110100: begin out_pos = hold_all[35:33]; end
	6'b110101: begin out_pos = hold_all[32:30]; end
	6'b110110: begin out_pos = hold_all[29:27]; end
	6'b110111: begin out_pos = hold_all[26:24]; end
	6'b111000: begin out_pos = hold_all[23:21]; end
	6'b111001: begin out_pos = hold_all[20:18]; end
	6'b111010: begin out_pos = hold_all[17:15]; end
	6'b111011: begin out_pos = hold_all[14:12]; end
	6'b111100: begin out_pos = hold_all[11:9]; end
	6'b111101: begin out_pos = hold_all[8:6]; end
	6'b111110: begin out_pos = hold_all[5:3]; end
	6'b111111: begin out_pos = hold_all[2:0]; end
	default: begin out_pos = hold_all[2:0]; end
	endcase
	
	end
end
endmodule
		
module clk_drivers(reset,clk_master,clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,food_collision,set_collide,load,snake_increment,clk_food,food_collision_replace,display);

input reset,food_collision,clk_master,food_collision_replace;

output reg clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,set_collide,load,snake_increment,clk_food,display;

reg [3:0] count;

always@(posedge clk_master,posedge reset) begin
if(reset == 1) begin
count = 4'b0000;
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;

end else begin
	case(count)
	4'b0000: begin
	clk_load_move = 1;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b0001;
	
	end
	4'b0001: begin
	clk_load_move = 0;
	clk_load_move_register = 1;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 1;
	
	count = count + 4'b0001;
	
	end
	4'b0010: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 1;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b0001;
	
	end
	4'b0011: begin
	
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = count + 4'b0001;
	end
	4'b0100: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 1;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b0001;
	
	end
	4'b0101: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 1;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b0001;
	
	end
	4'b0110: begin
		if(food_collision == 1) begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 1;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = count + 4'b0001;
		end else begin
		count = 4'b0000;
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
		end
	end
	4'b0111: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 1;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = count + 4'b0001;
	end
	4'b1000: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 1;
	clk_food = 0;
	display = 0;
	count = count + 4'b0001;
	end
	4'b1001: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 1;
	display = 0;
	count = count + 4'b0001;
	end
	4'b1010: begin
		if(food_collision_replace == 1)begin
		if(clk_food == 1) begin
		clk_food = 0;
		end else begin
		clk_food = 1;
		end
		clk_load_move = 0;
	 clk_load_move_register = 0;
	 set_eightbyeight = 0;
	 update_counters = 0;
	 clk_eightxeight = 0;
	 set_collide = 0;
	 load = 0;
	 snake_increment = 0;
	 display = 0;
		count = 4'b1010;
		end else begin
		count = 4'b0000;
		clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = 4'b0000;
		end
	end
	default: begin
	count = 4'b0000;
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	end
	endcase
end
end

endmodule
		
module or_all_rows(row_1_1,row_2_1,row_3_1,row_4_1,row_5_1,row_6_1,row_7_1,row_8_1,row_1_2,row_2_2,row_3_2,row_4_2,row_5_2,row_6_2,row_7_2,row_8_2,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8);
input [7:0] row_1_1,row_2_1,row_3_1,row_4_1,row_5_1,row_6_1,row_7_1,row_8_1,row_1_2,row_2_2,row_3_2,row_4_2,row_5_2,row_6_2,row_7_2,row_8_2;

output reg [7:0] row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8;

always @* begin

row_1 =  row_1_1|row_1_2;
row_2 =  row_2_1|row_2_2;
row_3 =  row_3_1|row_3_2;
row_4 =  row_4_1|row_4_2;
row_5 =  row_5_1|row_5_2;
row_6 =  row_6_1|row_6_2;
row_7 =  row_7_1|row_7_2;
row_8 =  row_8_1|row_8_2;

end

endmodule                
               
    
module row_converter(coordinate_x,coordinate_y,row1,row2,row3,row4,row5,row6,row7,row8);

input [2:0] coordinate_y;

input [2:0] coordinate_x;

output reg [7:0] row1,row2,row3,row4,row5,row6,row7,row8;

reg [7:0] hold;



always @* begin
						case(coordinate_x)
						3'b000: begin
						hold = 8'b10000000;
						end
						3'b001: begin
						hold = 8'b01000000;
						end
						3'b010: begin
						hold = 8'b00100000;
						end
						3'b011: begin
						hold = 8'b00010000;
						end
						3'b100: begin
						hold = 8'b00001000;
						end
						3'b101: begin
						hold = 8'b00000100;
						end
						3'b110: begin
						hold = 8'b00000010;
						end
						8'b111: begin
						hold = 8'b00000001;
						end
						default: begin
						hold = 8'b00000001;
						end
						endcase
					

									case (coordinate_y) 
                           3'b0: begin 
								row1 = hold;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = 8'b00000000;
								row8 = 8'b00000000;
								end
                           3'b1: begin
								row1 = 8'b00000000;
								row2 = hold;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = 8'b00000000;
								row8 = 8'b00000000;
								end
                           3'b10: begin 
								row1 = 8'b00000000;
								row2 = 8'b00000000;
								row3 = hold;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = 8'b00000000;
								row8 = 8'b00000000;
								end
                           3'b11: begin 
								row1 = 8'b00000000;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = hold;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = 8'b00000000;
								row8 = 8'b00000000;
								end
								   3'b100: begin
								row1 = 8'b00000000;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = hold;
								row6 = 8'b00000000;
								row7 = 8'b00000000;
								row8 = 8'b00000000;
								end
									3'b101: begin
							   	row1 = 8'b00000000;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = hold;
								row7 = 8'b00000000;
								row8 = 8'b00000000;
								end
									3'b110:begin
							   	row1 = 8'b00000000;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = hold;
								row8 = 8'b00000000;
								end
									3'b111: begin
							   row1 = 8'b0;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = 8'b00000000;
								row8 = hold;
								end
                        default: begin 
							   row1 = 8'b0;
								row2 = 8'b00000000;
								row3 = 8'b00000000;
								row4 = 8'b00000000;
								row5 = 8'b00000000;
								row6 = 8'b00000000;
								row7 = hold;
								row8 = 8'b00000000;
								end
									endcase



end
endmodule

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

module snake_length_counter(clk,reset,length);
input clk;
input reset;
output reg [5:0] length;

always@(posedge clk, posedge reset) begin
	if(reset == 1) begin
	length = 6'b000000;
	end else begin
	length = length + 6'b000001;
	end
end
endmodule


module LED_Driver_test(clk_in,reset,out_cathode,out_anode,in1,in2,in3,in4,in5,in6,in7,in8);

input clk_in,reset;

input [7:0] in1,in2,in3,in4,in5,in6,in7,in8;

output wire [7:0] out_cathode,out_anode;

wire clk1hz;

LED_driver_test_lower_level main(clk1hz,reset,out_cathode,out_anode,in1,in2,in3,in4,in5,in6,in7,in8);

clk_divider_display main_clock(clk_in,reset,clk1hz);


endmodule

module collision_detector(row1,row2,row3,row4,row5,row6,row7,row8,collide,coordinate_x,coordinate_y);

input[7:0] row1,row2,row3,row4,row5,row6,row7,row8;

output reg collide;

input[2:0] coordinate_y;

input[2:0] coordinate_x;

reg[7:0] hold;


always @* begin
						case(coordinate_x)
						3'b000: begin
						hold = 8'b10000000;
						end
						3'b001: begin
						hold = 8'b01000000;
						end
						3'b010: begin
						hold = 8'b00100000;
						end
						3'b011: begin
						hold = 8'b00010000;
						end
						3'b100: begin
						hold = 8'b00001000;
						end
						3'b101: begin
						hold = 8'b00000100;
						end
						3'b110: begin
						hold = 8'b00000010;
						end
						8'b111: begin
						hold = 8'b00000001;
						end
						default: begin
						hold = 8'b00000001;
						end
						endcase

									case (coordinate_y) 
                           3'b000: begin 
						if((row1|hold) == row1)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
                           3'b001: begin
						if((row2|hold) == row2)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
                           3'b010: begin 
						if((row3|hold) == row3)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
                           3'b011: begin 
						if((row4|hold) == row4)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
								   3'b100: begin
						if((row5|hold) == row5)begin
						collide = 1;
						end else begin
						collide = 0;
						end			
								end
									3'b101: begin
						if((row6|hold) == row6)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
									3'b110: begin
						if((row7|hold) == row7)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
									3'b111: begin
						if((row8|hold) == row8)begin
						collide = 1;
						end else begin
						collide = 0;
						end			
								end
									
                           default: begin 
						if((row8|hold) == row8)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
									endcase



end
endmodule

module LED_driver_test_lower_level(clk,reset,out_cathode,out_anode,row1,row2,row3,row4,row5,row6,row7,row8);
input clk, reset;

input [7:0] row1,row2,row3,row4,row5,row6,row7,row8;

output reg [7:0] out_cathode,out_anode;

reg [2:0] count;

reg[7:0] count2;

always@(posedge clk,posedge reset) begin
if(reset == 1) begin
count = 3'b000;
count2 = 8'b10000000;
out_anode = 8'b00000000;
out_cathode = 8'b00000000;
end else begin
	case(count)
	3'b000: begin
		if(count2 == 8'b00000000) begin
		count = 3'b001;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row1;
		out_cathode = 8'b01111111;
		count2 = count2 >> 1;
		end
	end
	3'b001: begin
		if(count2 == 8'b00000000) begin
		count = 3'b010;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row2;
		out_cathode = 8'b10111111;
		count2 = count2 >> 1;
		end
	end
	3'b010: begin
		if(count2 == 8'b00000000) begin
		count = 3'b011;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row3;
		out_cathode = 8'b11011111;
		count2 = count2 >> 1;
		end
	end
	3'b011: begin
		if(count2 == 8'b00000000) begin
		count = 3'b100;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row4;
		out_cathode = 8'b11101111;
		count2 = count2 >> 1;
		end
	end
	3'b100: begin
		if(count2 == 8'b00000000) begin
		count = 3'b101;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row5;
		out_cathode = 8'b11110111;
		count2 = count2 >> 1;
		end
	end
	3'b101: begin
		if(count2 == 8'b00000000) begin
		count = 3'b110;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row6;
		out_cathode = 8'b11111011;
		count2 = count2 >> 1;
		end
	end
	3'b110: begin
		if(count2 == 8'b00000000) begin
		count = 3'b111;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row7;
		out_cathode = 8'b11111101;
		count2 = count2 >> 1;
		end
	end
	3'b111: begin
		if(count2 == 8'b00000000) begin
		count = 3'b000;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row8;
		out_cathode = 8'b11111110;
		count2 = count2 >> 1;
		end
	end
	default: begin
	out_anode = 8'b10000000;
	out_cathode = 8'b11111110;
	count = 3'b000;
	end
	endcase

end
end

endmodule

//8'b00100100
//8'b01011010
//8'b10000001
//8'b01000010
//8'b00100100
//8'b00011000
//8'b01111110
//8'b10000001

module clk_divider_game(clk_50Mhz, rst, clk1hz);

input clk_50Mhz,rst;

output reg clk1hz;

reg [21:0] count;

always@(posedge clk_50Mhz,  posedge rst) begin

if(rst == 1)begin
count <= 22'b0000000000000000000000;
clk1hz <= 0;
end
else if(count == 2499999) begin //24999
count <= 22'b0000000000000000000000;
clk1hz <= ~clk1hz;
end

else begin
count <= count + 22'b0000000000000000000001;
clk1hz <= clk1hz;
end


end

endmodule

module if_equals(in1,in2,out);

output reg out;

input [2:0] in1;

input [2:0] in2;

always@(in1,in2) begin
if(in1 == in2) begin
out = 1'b1;
end else begin
out = 1'b0;
end
end

endmodule

module bcd_inverse(in,out);

input [7:0] in;

output reg [2:0] out;

always@* begin
	case (in) 
		8'b00000001: begin
			out = 3'b000;
		end
		8'b00000010: begin
			out = 3'b001;
		end	
		8'b00000100: begin
			out = 3'b010;
		end
		8'b00001000: begin
			out = 3'b011;
		end
		8'b00010000: begin
			out = 3'b100;
		end
		8'b00100000: begin
			out = 3'b101;
		end
		8'b01000000: begin
			out = 3'b110;
		end
		8'b10000000: begin
			out = 3'b111;
		end
		default: begin
			out = 3'b111;
		end
	endcase

end

endmodule

module random_list(clk,reset,y,x);

input clk,reset;

output reg [2:0] y;

output reg [7:0] x;

reg [5:0] count;

always@(posedge clk,posedge reset) begin
if(reset == 1) begin
count = 6'b000000;
y = 3'b011;
x = 8'b01000000;
end else begin
	case(count) 
	6'b000000: begin 
	y = 3'b011;
	x = 8'b01000000;
	end
	6'b000001: begin
	y = 3'b001;
	x = 8'b1;
	end
	6'b000010: begin
	y = 3'b110;
	x = 8'b00100000;
	end
	6'b000011: begin
	y = 3'b110;
	x = 8'b01000000;
	end
	6'b000100: begin
	y = 3'b010;
	x = 8'b01000000;
	end
	6'b000101: begin
	y = 3'b100;
	x = 8'b00000100;
	end
	6'b000110: begin
	y = 3'b111;
	x = 8'b10;
	end
	6'b000111: begin
	y = 3'b11;
	x = 8'b100;
	end
	6'b001000: begin
	y = 3'b101;
	x = 8'b10;
	end
	6'b001001: begin
	y = 3'b100;
	x = 8'b1000000;
	end
	6'b001010: begin
	y = 3'b110;
	x = 8'b100;
	end
	6'b001011: begin
	y = 3'b101;
	x = 8'b1000;
	end
	6'b001100: begin
	y = 3'b1;
	x = 8'b10;
	end
	6'b001101: begin
	y = 3'b111;
	x = 8'b1000000;
	end
	6'b001110: begin
	y = 3'b1;
	x = 8'b1000000;
	end
	6'b001111: begin
	y = 3'b11;
	x = 8'b100000;
	end
	6'b010000: begin
	y = 3'b0;
	x = 8'b10000000;
	end
	6'b010001: begin
	y = 3'b0;
	x = 8'b100;
	end
	6'b010010: begin
	y = 3'b111;
	x = 8'b10000;
	end
	6'b010011: begin
	y = 3'b111;
	x = 8'b10000000;
	end
	6'b010100: begin
	y = 3'b101;
	x = 8'b1;
	end
	6'b010101: begin
	y = 3'b101;
	x = 8'b1000000;
	end
	6'b010110: begin
	y = 3'b100;
	x = 8'b100000;
	end
	6'b010111: begin
	y = 3'b111;
	x = 8'b100000;
	end
	6'b011000: begin
	y = 3'b110;
	x = 8'b10;
	end
	6'b011001: begin
	y = 3'b111;
	x = 8'b1;
	end
	6'b011010: begin
	y = 3'b0;
	x = 8'b1000;
	end
	6'b011011: begin
	y = 3'b100;
	x = 8'b10000;
	end
	6'b011100: begin
	y = 3'b11;
	x = 8'b1000;
	end
	6'b011101: begin
	y = 3'b10;
	x = 8'b1;
	end
	6'b011110: begin
	y = 3'b101;
	x = 8'b10000;
	end
	6'b011111: begin
	y = 3'b1;
	x = 8'b10000000;
	end
	6'b100000: begin 
	y = 3'b11;
	x = 8'b10;
	end
	6'b100001: begin
	y = 3'b1;
	x = 8'b1000;
	end
	6'b100010: begin
	y = 3'b0;
	x = 8'b10;
	end
	6'b100011: begin
	y = 3'b0;
	x = 8'b100000;
	end
	6'b100100: begin
	y = 3'b100;
	x = 8'b10000000;
	end
	6'b100101: begin
	y = 3'b0;
	x = 8'b10000;
	end
	6'b100110: begin
	y = 3'b101;
	x = 8'b100;
	end
	6'b100111: begin
	y = 3'b111;
	x = 8'b100;
	end
	6'b101000: begin
	y = 3'b11;
	x = 8'b10000;
	end
	6'b101001: begin
	y = 3'b100;
	x = 8'b10;
	end
	6'b101010: begin
	y = 3'b111;
	x = 8'b1000;
	end
	6'b101011: begin
	y = 3'b10;
	x = 8'b10;
	end
	6'b101100: begin
	y = 3'b110;
	x = 8'b10000000;
	end
	6'b101101: begin
	y = 3'b10;
	x = 8'b100;
	end
	6'b101110: begin
	y = 3'b1;
	x = 8'b100;
	end
	6'b101111: begin
	y = 3'b110;
	x = 8'b1;
	end
	6'b110000: begin	
	y = 3'b101;
	x = 8'b100000;
	end
	6'b110001: begin
	y = 3'b100;
	x = 8'b1;
	end
	6'b110010: begin
	y = 3'b10;
	x = 8'b10000000;
	end
	6'b110011: begin
	y = 3'b101;
	x = 8'b10000000;
	end
	6'b110100: begin
	y = 3'b1;
	x = 8'b10000;
	end
	6'b110101: begin
	y = 3'b110;
	x = 8'b1000;
	end
	6'b110110: begin
	y = 3'b1;
	x = 8'b100000;
	end
	6'b110111: begin
	y = 3'b100;
	x = 8'b1000;
	end
	6'b111000: begin
	y = 3'b10;
	x = 8'b10000;
	end
	6'b111001: begin
	y = 3'b11;
	x = 8'b10000000;
	end
	6'b111010: begin
	y = 3'b0;
	x = 8'b1000000;
	end
	6'b111011: begin
	y = 3'b10;
	x = 8'b1000;
	end
	6'b111100: begin
	y = 3'b11;
	x = 8'b1;
	end
	6'b111101: begin
	y = 3'b110;
	x = 8'b10000;
	end
	6'b111110: begin
	y = 3'b0;
	x = 8'b1;
	end
	6'b111111: begin
	y = 3'b10;
	x = 8'b100000;
	count = 0;
	end
	default: begin
	y = 3'b10;
	x = 8'b100000;
	count = 0;
	end
	endcase
	count = count + 6'b000001;
	end
end

endmodule

module food_collision_detector(row1,row2,row3,row4,row5,row6,row7,row8,collide,coordinate_x,coordinate_y);

input[7:0] row1,row2,row3,row4,row5,row6,row7,row8;

output reg collide;

input[2:0] coordinate_y;

input[2:0] coordinate_x;

reg[7:0] hold;


always @* begin
						case(coordinate_x)
						3'b000: begin
						hold = 8'b10000000;
						end
						3'b001: begin
						hold = 8'b01000000;
						end
						3'b010: begin
						hold = 8'b00100000;
						end
						3'b011: begin
						hold = 8'b00010000;
						end
						3'b100: begin
						hold = 8'b00001000;
						end
						3'b101: begin
						hold = 8'b00000100;
						end
						3'b110: begin
						hold = 8'b00000010;
						end
						8'b111: begin
						hold = 8'b00000001;
						end
						default: begin
						hold = 8'b00000001;
						end
						endcase

									case (coordinate_y) 
                           3'b000: begin 
						if((row1|hold) == row1)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
                           3'b001: begin
						if((row2|hold) == row2)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
                           3'b010: begin 
						if((row3|hold) == row3)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
                           3'b011: begin 
						if((row4|hold) == row4)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
								   3'b100: begin
						if((row5|hold) == row5)begin
						collide = 1;
						end else begin
						collide = 0;
						end			
								end
									3'b101: begin
						if((row6|hold) == row6)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
									3'b110: begin
						if((row7|hold) == row7)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
									3'b111: begin
						if((row8|hold) == row8)begin
						collide = 1;
						end else begin
						collide = 0;
						end			
								end
									
                           default: begin 
						if((row8|hold) == row8)begin
						collide = 1;
						end else begin
						collide = 0;
						end
								end
									endcase



end
endmodule

module clk_divider_display(clk_50Mhz, rst, clk1hz);

input clk_50Mhz,rst;

output reg clk1hz;

reg [12:0] count;

always@(posedge clk_50Mhz,  posedge rst) begin

if(rst == 1)begin
count <= 13'b0000000000000;
clk1hz <= 0;
end
else if(count == 4999) begin //24999
count <= 13'b0000000000000;
clk1hz <= ~clk1hz;
end

else begin
count <= count + 13'b0000000000001;
clk1hz <= clk1hz;
end


end

endmodule
