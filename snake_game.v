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