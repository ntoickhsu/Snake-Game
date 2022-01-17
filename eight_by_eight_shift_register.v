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


digit_store onebyeight(clk,set & set_coordinate_x[0:0] & set_coordinate_y[7:7],reset,upper_edge[0:0],one_by_eight_to_one_by_seven,left_edge[7:7],one_by_eight_to_two_by_eight,two_by_eight_to_one_by_eight,0,one_by_seven_to_one_by_eight,0,wonebyeight,row_8[7:7]);

digit_store onebyseven(clk,set & set_coordinate_x[0:0] & set_coordinate_y[6:6],reset,one_by_seven_to_one_by_eight,one_by_seven_to_one_by_six,left_edge[6:6],one_by_seven_to_two_by_seven,two_by_seven_to_one_by_seven,0,one_by_six_to_one_by_seven,one_by_eight_to_one_by_seven,wonebyseven,row_7[7:7]);

digit_store onebysix(clk,set & set_coordinate_x[0:0] & set_coordinate_y[5:5],reset,one_by_six_to_one_by_seven,one_by_six_to_one_by_five,left_edge[5:5],one_by_six_to_two_by_six,two_by_six_to_one_by_six,0,one_by_five_to_one_by_six,one_by_seven_to_one_by_six,wonebysix,row_6[7:7]);

digit_store onebyfive(clk,set & set_coordinate_x[0:0] & set_coordinate_y[4:4],reset,one_by_five_to_one_by_six,one_by_five_to_one_by_four,left_edge[4:4],one_by_five_to_two_by_five,two_by_five_to_one_by_five,0,one_by_four_to_one_by_five,one_by_six_to_one_by_five,wonebyfive,row_5[7:7]);

digit_store onebyfour(clk,set & set_coordinate_x[0:0] & set_coordinate_y[3:3],reset,one_by_four_to_one_by_five,one_by_four_to_one_by_three,left_edge[3:3],one_by_four_to_two_by_four,two_by_four_to_one_by_four,0,one_by_three_to_one_by_four,one_by_five_to_one_by_four,wonebyfour,row_4[7:7]);

digit_store onebythree(clk,set & set_coordinate_x[0:0] & set_coordinate_y[2:2],reset,one_by_three_to_one_by_four,one_by_three_to_one_by_two,left_edge[2:2],one_by_three_to_two_by_three,two_by_three_to_one_by_three,0,one_by_two_to_one_by_three,one_by_four_to_one_by_three,wonebythree,row_3[7:7]);

digit_store onebytwo(clk,set & set_coordinate_x[0:0] & set_coordinate_y[1:1],reset,one_by_two_to_one_by_three,one_by_two_to_one_by_one,left_edge[1:1],one_by_two_to_two_by_two,two_by_two_to_one_by_two,0,one_by_one_to_one_by_two,one_by_three_to_one_by_two,wonebytwo,row_2[7:7]);

digit_store onebyone(clk,set & set_coordinate_x[0:0] & set_coordinate_y[0:0],reset,one_by_one_to_one_by_two,lower_edge[0:0],left_edge[0:0],one_by_one_to_two_by_one,two_by_one_to_one_by_one,0,0,one_by_two_to_one_by_one,wonebyone,row_1[7:7]);


control_signal_mux muxtwobyeight(control_x_coordinate[1:1] & control_y_coordinate[7:7],control,wtwobyeight);

control_signal_mux muxtwobyseven(control_x_coordinate[1:1] & control_y_coordinate[6:6],control,wtwobyseven);

control_signal_mux muxtwobysix(control_x_coordinate[1:1] & control_y_coordinate[5:5],control,wtwobysix);

control_signal_mux muxtwobyfive(control_x_coordinate[1:1] & control_y_coordinate[4:4],control,wtwobyfive);

control_signal_mux muxtwobyfour(control_x_coordinate[1:1] & control_y_coordinate[3:3],control,wtwobyfour);

control_signal_mux muxtwobythree(control_x_coordinate[1:1] & control_y_coordinate[2:2],control,wtwobythree);

control_signal_mux muxtwobytwo(control_x_coordinate[1:1] & control_y_coordinate[1:1],control,wtwobytwo);

control_signal_mux muxtwobyone(control_x_coordinate[1:1] & control_y_coordinate[0:0],control,wtwobyone);


digit_store twobyeight(clk,set & set_coordinate_x[1:1] & set_coordinate_y[7:7],reset,upper_edge[1:1],two_by_eight_to_two_by_seven,two_by_eight_to_one_by_eight,two_by_eight_to_three_by_eight,three_by_eight_to_two_by_eight,one_by_eight_to_two_by_eight,two_by_seven_to_two_by_eight,0,wtwobyeight,row_8[6:6]);

digit_store twobyseven(clk,set & set_coordinate_x[1:1] & set_coordinate_y[6:6],reset,two_by_seven_to_two_by_eight,two_by_seven_to_two_by_six,two_by_seven_to_one_by_seven,two_by_seven_to_three_by_seven,three_by_seven_to_two_by_seven,one_by_seven_to_two_by_seven,two_by_six_to_two_by_seven,two_by_eight_to_two_by_seven,wtwobyseven,row_7[6:6]);

digit_store twobysix(clk,set & set_coordinate_x[1:1] & set_coordinate_y[5:5],reset,two_by_six_to_two_by_seven,two_by_six_to_two_by_five,two_by_six_to_one_by_six,two_by_six_to_three_by_six,three_by_six_to_two_by_six,one_by_six_to_two_by_six,two_by_five_to_by_six,two_by_seven_to_two_by_six,wtwobysix,row_6[6:6]);

digit_store twobyfive(clk,set & set_coordinate_x[1:1] & set_coordinate_y[4:4],reset,two_by_five_to_by_six,two_by_five_to_two_by_four,two_by_five_to_one_by_five,two_by_five_to_three_by_five,three_by_five_to_two_by_five,one_by_five_to_two_by_five,two_by_four_to_two_by_five,two_by_six_to_two_by_five,wtwobyfive,row_5[6:6]);

digit_store twobyfour(clk,set & set_coordinate_x[1:1] & set_coordinate_y[3:3],reset,two_by_four_to_two_by_five,two_by_four_to_two_by_three,two_by_four_to_one_by_four,two_by_four_to_three_by_four,three_by_four_to_two_by_four,one_by_four_to_two_by_four,two_by_three_to_two_by_four,two_by_five_to_two_by_four,wtwobyfour,row_4[6:6]);

digit_store twobythree(clk,set & set_coordinate_x[1:1] & set_coordinate_y[2:2],reset,two_by_three_to_two_by_four,two_by_three_to_two_by_two,two_by_three_to_one_by_three,two_by_three_to_three_by_three,three_by_three_to_two_by_three,one_by_three_to_two_by_three,two_by_two_to_two_by_three,two_by_four_to_two_by_three,wtwobythree,row_3[6:6]);

digit_store twobytwo(clk,set & set_coordinate_x[1:1] & set_coordinate_y[1:1],reset,two_by_two_to_two_by_three,two_by_two_to_two_by_one,two_by_two_to_one_by_two,two_by_two_to_three_by_two,three_by_two_to_two_by_two,one_by_two_to_two_by_two,two_by_one_to_two_by_two,two_by_three_to_two_by_two,wtwobytwo,row_2[6:6]);

digit_store twobyone(clk,set & set_coordinate_x[1:1] & set_coordinate_y[0:0],reset,two_by_one_to_two_by_two,lower_edge[1:1],two_by_one_to_one_by_one,two_by_one_to_three_by_one,three_by_one_to_two_by_one,one_by_one_to_two_by_one,0,two_by_two_to_two_by_one,wtwobyone,row_1[6:6]);


control_signal_mux muxthreebyeight(control_x_coordinate[2:2] & control_y_coordinate[7:7],control,wthreebyeight);

control_signal_mux muxthreebyseven(control_x_coordinate[2:2] & control_y_coordinate[6:6],control,wthreebyseven);

control_signal_mux muxthreebysix(control_x_coordinate[2:2] & control_y_coordinate[5:5],control,wthreebysix);

control_signal_mux muxthreebyfive(control_x_coordinate[2:2] & control_y_coordinate[4:4],control,wthreebyfive);

control_signal_mux muxthreebyfour(control_x_coordinate[2:2] & control_y_coordinate[3:3],control,wthreebyfour);

control_signal_mux muxthreebythree(control_x_coordinate[2:2] & control_y_coordinate[2:2],control,wthreebythree);

control_signal_mux muxthreebytwo(control_x_coordinate[2:2] & control_y_coordinate[1:1],control,wthreebytwo);

control_signal_mux muxthreebyone(control_x_coordinate[2:2] & control_y_coordinate[0:0],control,wthreebyone);


digit_store threebyeight(clk,set & set_coordinate_x[2:2] & set_coordinate_y[7:7],reset,upper_edge[2:2],three_by_eight_to_three_by_seven,three_by_eight_to_two_by_eight,three_by_eight_to_four_by_eight,four_by_eight_to_three_by_eight,two_by_eight_to_three_by_eight,three_by_seven_to_three_by_eight,0,wthreebyeight,row_8[5:5]);

digit_store threebyseven(clk,set & set_coordinate_x[2:2] & set_coordinate_y[6:6],reset,three_by_seven_to_three_by_eight,three_by_seven_to_three_by_six,three_by_seven_to_two_by_seven,three_by_seven_to_four_by_seven,four_by_seven_to_three_by_seven,two_by_seven_to_three_by_seven,three_by_six_to_three_by_seven,three_by_eight_to_three_by_seven,wthreebyseven,row_7[5:5]);

digit_store threebysix(clk,set & set_coordinate_x[2:2] & set_coordinate_y[5:5],reset,three_by_six_to_three_by_seven,three_by_six_to_three_by_five,three_by_six_to_two_by_six,three_by_six_to_four_by_six,four_by_six_to_three_by_six,two_by_six_to_three_by_six,three_by_five_to_three_by_six,three_by_seven_to_three_by_six,wthreebysix,row_6[5:5]);

digit_store threebyfive(clk,set & set_coordinate_x[2:2] & set_coordinate_y[4:4],reset,three_by_five_to_three_by_six,three_by_five_to_three_by_four,three_by_five_to_two_by_five,three_by_five_to_four_by_five,four_by_five_to_three_by_five,two_by_five_to_three_by_five,three_by_four_to_three_by_five,three_by_six_to_three_by_five,wthreebyfive,row_5[5:5]);

digit_store threebyfour(clk,set & set_coordinate_x[2:2] & set_coordinate_y[3:3],reset,three_by_four_to_three_by_five,three_by_four_to_three_by_three,three_by_four_to_two_by_four,three_by_four_to_four_by_four,four_by_four_to_three_by_four,two_by_four_to_three_by_four,three_by_three_to_three_by_four,three_by_five_to_three_by_four,wthreebyfour,row_4[5:5]);

digit_store threebythree(clk,set & set_coordinate_x[2:2] & set_coordinate_y[2:2],reset,three_by_three_to_three_by_four,three_by_three_to_three_by_two,three_by_three_to_two_by_three,three_by_three_to_four_by_three,four_by_three_to_three_by_three,two_by_three_to_three_by_three,three_by_two_to_three_by_three,three_by_four_to_three_by_three,wthreebythree,row_3[5:5]);

digit_store threebytwo(clk,set & set_coordinate_x[2:2] & set_coordinate_y[1:1],reset,three_by_two_to_three_by_three,three_by_two_to_three_by_one,three_by_two_to_two_by_two,three_by_two_to_four_by_two,four_by_two_to_three_by_two,two_by_two_to_three_by_two,three_by_one_to_three_by_two,three_by_three_to_three_by_two,wthreebytwo,row_2[5:5]);

digit_store threebyone(clk,set & set_coordinate_x[2:2] & set_coordinate_y[0:0],reset,three_by_one_to_three_by_two,lower_edge[2:2],three_by_one_to_two_by_one,three_by_one_to_four_by_one,four_by_one_to_three_by_one,two_by_one_to_three_by_one,0,three_by_two_to_three_by_one,wthreebyone,row_1[5:5]);


control_signal_mux muxfourbyeight(control_x_coordinate[3:3] & control_y_coordinate[7:7],control,wfourbyeight);

control_signal_mux muxfourbyseven(control_x_coordinate[3:3] & control_y_coordinate[6:6],control,wfourbyseven);

control_signal_mux muxfourbysix(control_x_coordinate[3:3] & control_y_coordinate[5:5],control,wfourbysix);

control_signal_mux muxfourbyfive(control_x_coordinate[3:3] & control_y_coordinate[4:4],control,wfourbyfive);

control_signal_mux muxfourbyfour(control_x_coordinate[3:3] & control_y_coordinate[3:3],control,wfourbyfour);

control_signal_mux muxfourbythree(control_x_coordinate[3:3] & control_y_coordinate[2:2],control,wfourbythree);

control_signal_mux muxfourbytwo(control_x_coordinate[3:3] & control_y_coordinate[1:1],control,wfourbytwo);

control_signal_mux muxfourbyone(control_x_coordinate[3:3] & control_y_coordinate[0:0],control,wfourbyone);


digit_store fourbyeight(clk,set & set_coordinate_x[3:3] & set_coordinate_y[7:7],reset,upper_edge[3:3],four_by_eight_to_four_by_seven,four_by_eight_to_three_by_eight,four_by_eight_to_five_by_eight,five_by_eight_to_four_by_eight,three_by_eight_to_four_by_eight,four_by_seven_to_four_by_eight,0,wfourbyeight,row_8[4:4]);

digit_store fourbyseven(clk,set & set_coordinate_x[3:3] & set_coordinate_y[6:6],reset,four_by_seven_to_four_by_eight,four_by_seven_to_four_by_six,four_by_seven_to_three_by_seven,four_by_seven_to_five_by_seven,five_by_seven_to_four_by_seven,three_by_seven_to_four_by_seven,four_by_six_to_four_by_seven,four_by_eight_to_four_by_seven,wfourbyseven,row_7[4:4]);

digit_store fourbysix(clk,set & set_coordinate_x[3:3] & set_coordinate_y[5:5],reset,four_by_six_to_four_by_seven,four_by_six_to_four_by_five,four_by_six_to_three_by_six,four_by_six_to_five_by_six,five_by_six_to_four_by_six,three_by_six_to_four_by_six,four_by_five_to_four_by_six,four_by_seven_to_four_by_six,wfourbysix,row_6[4:4]);

digit_store fourbyfive(clk,set & set_coordinate_x[3:3] & set_coordinate_y[4:4],reset,four_by_five_to_four_by_six,four_by_five_to_four_by_four,four_by_five_to_three_by_five,four_by_five_to_five_by_five,five_by_five_to_four_by_five,three_by_five_to_four_by_five,four_by_four_to_four_by_five,four_by_six_to_four_by_five,wfourbyfive,row_5[4:4]);

digit_store fourbyfour(clk,set & set_coordinate_x[3:3] & set_coordinate_y[3:3],reset,four_by_four_to_four_by_five,four_by_four_to_four_by_three,four_by_four_to_three_by_four,four_by_four_to_five_by_four,five_by_four_to_four_by_four,three_by_four_to_four_by_four,four_by_three_to_four_by_four,four_by_five_to_four_by_four,wfourbyfour,row_4[4:4]);

digit_store fourbythree(clk,set & set_coordinate_x[3:3] & set_coordinate_y[2:2],reset,four_by_three_to_four_by_four,four_by_three_to_four_by_two,four_by_three_to_three_by_three,four_by_three_to_five_by_three,five_by_three_to_four_by_three,three_by_three_to_four_by_three,four_by_two_to_four_by_three,four_by_four_to_four_by_three,wfourbythree,row_3[4:4]);

digit_store fourbytwo(clk,set & set_coordinate_x[3:3] & set_coordinate_y[1:1],reset,four_by_two_to_four_by_three,four_by_two_to_four_by_one,four_by_two_to_three_by_two,four_by_two_to_five_by_two,five_by_two_to_four_by_two,three_by_two_to_four_by_two,four_by_one_to_four_by_two,four_by_three_to_four_by_two,wfourbytwo,row_2[4:4]);

digit_store fourbyone(clk,set & set_coordinate_x[3:3] & set_coordinate_y[0:0],reset,four_by_one_to_four_by_two,lower_edge[3:3],four_by_one_to_three_by_one,four_by_one_to_five_by_one,five_by_one_to_four_by_one,three_by_one_to_four_by_one,0,four_by_two_to_four_by_one,wfourbyone,row_1[4:4]);


control_signal_mux muxfivebyeight(control_x_coordinate[4:4] & control_y_coordinate[7:7],control,wfivebyeight);

control_signal_mux muxfivebyseven(control_x_coordinate[4:4] & control_y_coordinate[6:6],control,wfivebyseven);

control_signal_mux muxfivebysix(control_x_coordinate[4:4] & control_y_coordinate[5:5],control,wfivebysix);

control_signal_mux muxfivebyfive(control_x_coordinate[4:4] & control_y_coordinate[4:4],control,wfivebyfive);

control_signal_mux muxfivebyfour(control_x_coordinate[4:4] & control_y_coordinate[3:3],control,wfivebyfour);

control_signal_mux muxfivebythree(control_x_coordinate[4:4] & control_y_coordinate[2:2],control,wfivebythree);

control_signal_mux muxfivebytwo(control_x_coordinate[4:4] & control_y_coordinate[1:1],control,wfivebytwo);

control_signal_mux muxfivebyone(control_x_coordinate[4:4] & control_y_coordinate[0:0],control,wfivebyone);


digit_store fivebyeight(clk,set & set_coordinate_x[4:4] & set_coordinate_y[7:7],reset,upper_edge[4:4],five_by_eight_to_five_by_seven,five_by_eight_to_four_by_eight,five_by_eight_to_six_by_eight,six_by_eight_to_five_by_eight,four_by_eight_to_five_by_eight,five_by_seven_to_five_by_eight,0,wfivebyeight,row_8[3:3]);

digit_store fivebyseven(clk,set & set_coordinate_x[4:4] & set_coordinate_y[6:6],reset,five_by_seven_to_five_by_eight,five_by_seven_to_five_by_six,five_by_seven_to_four_by_seven,five_by_seven_to_six_by_seven,six_by_seven_to_five_by_seven,four_by_seven_to_five_by_seven,five_by_six_to_five_by_seven,five_by_eight_to_five_by_seven,wfivebyseven,row_7[3:3]);

digit_store fivebysix(clk,set & set_coordinate_x[4:4] & set_coordinate_y[5:5],reset,five_by_six_to_five_by_seven,five_by_six_to_five_by_five,five_by_six_to_four_by_six,five_by_six_to_six_by_six,six_by_six_to_five_by_six,four_by_six_to_five_by_six,five_by_five_to_five_by_six,five_by_seven_to_five_by_six,wfivebysix,row_6[3:3]);

digit_store fivebyfive(clk,set & set_coordinate_x[4:4] & set_coordinate_y[4:4],reset,five_by_five_to_five_by_six,five_by_five_to_five_by_four,five_by_five_to_four_by_five,five_by_five_to_six_by_five,six_by_five_to_five_by_five,four_by_five_to_five_by_five,five_by_four_to_five_by_five,five_by_six_to_five_by_five,wfivebyfive,row_5[3:3]);

digit_store fivebyfour(clk,set & set_coordinate_x[4:4] & set_coordinate_y[3:3],reset,five_by_four_to_five_by_five,five_by_four_to_five_by_three,five_by_four_to_four_by_four,five_by_four_to_six_by_four,six_by_four_to_five_by_four,four_by_four_to_five_by_four,five_by_three_to_five_by_four,five_by_five_to_five_by_four,wfivebyfour,row_4[3:3]);

digit_store fivebythree(clk,set & set_coordinate_x[4:4] & set_coordinate_y[2:2],reset,five_by_three_to_five_by_four,five_by_three_to_five_by_two,five_by_three_to_four_by_three,five_by_three_to_six_by_three,six_by_three_to_five_by_three,four_by_three_to_five_by_three,five_by_two_to_five_by_three,five_by_four_to_five_by_three,wfivebythree,row_3[3:3]);

digit_store fivebytwo(clk,set & set_coordinate_x[4:4] & set_coordinate_y[1:1],reset,five_by_two_to_five_by_three,five_by_two_to_five_by_one,five_by_two_to_four_by_two,five_by_two_to_six_by_two,six_by_two_to_five_by_two,four_by_two_to_five_by_two,five_by_one_to_five_by_two,five_by_three_to_five_by_two,wfivebytwo,row_2[3:3]);

digit_store fivebyone(clk,set & set_coordinate_x[4:4] & set_coordinate_y[0:0],reset,five_by_one_to_five_by_two,lower_edge[4:4],five_by_one_to_four_by_one,five_by_one_to_six_by_one,six_by_one_to_five_by_one,four_by_one_to_five_by_one,0,five_by_two_to_five_by_one,wfivebyone,row_1[3:3]);


control_signal_mux muxsixbyeight(control_x_coordinate[5:5] & control_y_coordinate[7:7],control,wsixbyeight);

control_signal_mux muxsixbyseven(control_x_coordinate[5:5] & control_y_coordinate[6:6],control,wsixbyseven);

control_signal_mux muxsixbysix(control_x_coordinate[5:5] & control_y_coordinate[5:5],control,wsixbysix);

control_signal_mux muxsixbyfive(control_x_coordinate[5:5] & control_y_coordinate[4:4],control,wsixbyfive);

control_signal_mux muxsixbyfour(control_x_coordinate[5:5] & control_y_coordinate[3:3],control,wsixbyfour);

control_signal_mux muxsixbythree(control_x_coordinate[5:5] & control_y_coordinate[2:2],control,wsixbythree);

control_signal_mux muxsixbytwo(control_x_coordinate[5:5] & control_y_coordinate[1:1],control,wsixbytwo);

control_signal_mux muxsixbyone(control_x_coordinate[5:5] & control_y_coordinate[0:0],control,wsixbyone);


digit_store sixbyeight(clk,set & set_coordinate_x[5:5] & set_coordinate_y[7:7],reset,upper_edge[5:5],six_by_eight_to_six_by_seven,six_by_eight_to_five_by_eight,six_by_eight_to_seven_by_eight,seven_by_eight_to_six_by_eight,five_by_eight_to_six_by_eight,six_by_seven_to_six_to_eight,0,wsixbyeight,row_8[2:2]);

digit_store sixbyseven(clk,set & set_coordinate_x[5:5] & set_coordinate_y[6:6],reset,six_by_seven_to_six_to_eight,six_by_seven_to_six_by_six,six_by_seven_to_five_by_seven,six_by_seven_to_seven_by_seven,seven_by_seven_to_six_by_seven,five_by_seven_to_six_by_seven,six_by_six_to_six_by_seven,six_by_eight_to_six_by_seven,wsixbyseven,row_7[2:2]);

digit_store sixbysix(clk,set & set_coordinate_x[5:5] & set_coordinate_y[5:5],reset,six_by_six_to_six_by_seven,six_by_six_to_six_by_five,six_by_six_to_five_by_six,six_by_six_to_seven_by_six,seven_by_six_to_six_by_six,five_by_six_to_six_by_six,six_by_five_to_six_by_six,six_by_seven_to_six_by_six,wsixbysix,row_6[2:2]);

digit_store sixbyfive(clk,set & set_coordinate_x[5:5] & set_coordinate_y[4:4],reset,six_by_five_to_six_by_six,six_by_five_to_six_by_four,six_by_five_to_five_by_five,six_by_five_to_seven_by_five,seven_by_five_to_six_by_five,five_by_five_to_six_by_five,six_by_four_to_six_by_five,six_by_six_to_six_by_five,wsixbyfive,row_5[2:2]);

digit_store sixbyfour(clk,set & set_coordinate_x[5:5] & set_coordinate_y[3:3],reset,six_by_four_to_six_by_five,six_by_four_to_six_by_three,six_by_four_to_five_by_four,six_by_four_to_seven_by_four,seven_by_four_to_six_by_four,five_by_four_to_six_by_four,six_by_three_to_six_by_four,six_by_five_to_six_by_four,wsixbyfour,row_4[2:2]);

digit_store sixbythree(clk,set & set_coordinate_x[5:5] & set_coordinate_y[2:2],reset,six_by_three_to_six_by_four,six_by_three_to_six_by_two,six_by_three_to_five_by_three,six_by_three_to_seven_by_three,seven_by_three_to_six_by_three,five_by_three_to_six_by_three,six_by_two_to_six_by_three,six_by_four_to_six_by_three,wsixbythree,row_3[2:2]);

digit_store sixbytwo(clk,set & set_coordinate_x[5:5] & set_coordinate_y[1:1],reset,six_by_two_to_six_by_three,six_by_two_to_six_by_one,six_by_two_to_five_by_two,six_by_two_to_seven_by_two,seven_by_two_to_six_by_two,five_by_two_to_six_by_two,six_by_one_to_six_by_two,six_by_three_to_six_by_two,wsixbytwo,row_2[2:2]);

digit_store sixbyone(clk,set & set_coordinate_x[5:5] & set_coordinate_y[0:0],reset,six_by_one_to_six_by_two,lower_edge[5:5],six_by_one_to_five_by_one,six_by_one_to_seven_by_one,seven_by_one_to_six_by_one,five_by_one_to_six_by_one,0,six_by_two_to_six_by_one,wsixbyone,row_1[2:2]);


control_signal_mux muxsevenbyeight(control_x_coordinate[6:6] & control_y_coordinate[7:7],control,wsevenbyeight);

control_signal_mux muxsevenbyseven(control_x_coordinate[6:6] & control_y_coordinate[6:6],control,wsevenbyseven);

control_signal_mux muxsevenbysix(control_x_coordinate[6:6] & control_y_coordinate[5:5],control,wsevenbysix);

control_signal_mux muxsevenbyfive(control_x_coordinate[6:6] & control_y_coordinate[4:4],control,wsevenbyfive);

control_signal_mux muxsevenbyfour(control_x_coordinate[6:6] & control_y_coordinate[3:3],control,wsevenbyfour);

control_signal_mux muxsevenbythree(control_x_coordinate[6:6] & control_y_coordinate[2:2],control,wsevenbythree);

control_signal_mux muxsevenbytwo(control_x_coordinate[6:6] & control_y_coordinate[1:1],control,wsevenbytwo);

control_signal_mux muxsevenbyone(control_x_coordinate[6:6] & control_y_coordinate[0:0],control,wsevenbyone);


digit_store sevenbyeight(clk,set & set_coordinate_x[6:6] & set_coordinate_y[7:7],reset,upper_edge[6:6],seven_by_eight_to_seven_by_seven,seven_by_eight_to_six_by_eight,seven_by_eight_to_eight_by_eight,eight_by_eight_to_seven_by_eight,six_by_eight_to_seven_by_eight,seven_by_seven_to_seven_by_eight,0,wsevenbyeight,row_8[1:1]);

digit_store sevenbyseven(clk,set & set_coordinate_x[6:6] & set_coordinate_y[6:6],reset,seven_by_seven_to_seven_by_eight,seven_by_seven_to_seven_by_six,seven_by_seven_to_six_by_seven,seven_by_seven_to_eight_by_seven,eight_by_seven_to_seven_by_seven,six_by_seven_to_seven_by_seven,seven_by_six_to_seven_by_seven,seven_by_eight_to_seven_by_seven,wsevenbyseven,row_7[1:1]);

digit_store sevenbysix(clk,set & set_coordinate_x[6:6] & set_coordinate_y[5:5],reset,seven_by_six_to_seven_by_seven,seven_by_six_to_seven_by_five,seven_by_six_to_six_by_six,seven_by_six_to_eight_by_six,eight_by_six_to_seven_by_six,six_by_six_to_seven_by_six,seven_by_five_to_seven_by_six,seven_by_seven_to_seven_by_six,wsevenbysix,row_6[1:1]);

digit_store sevenbyfive(clk,set & set_coordinate_x[6:6] & set_coordinate_y[4:4],reset,seven_by_five_to_seven_by_six,seven_by_five_to_seven_by_four,seven_by_five_to_six_by_five,seven_by_five_to_eight_by_five,eight_by_five_to_seven_by_five,six_by_five_to_seven_by_five,seven_by_four_to_seven_by_five,seven_by_six_to_seven_by_five,wsevenbyfive,row_5[1:1]);

digit_store sevenbyfour(clk,set & set_coordinate_x[6:6] & set_coordinate_y[3:3],reset,seven_by_four_to_seven_by_five,seven_by_four_to_seven_by_three,seven_by_four_to_six_by_four,seven_by_four_to_eight_by_four,eight_by_four_to_seven_by_four,six_by_four_to_seven_by_four,seven_by_three_to_seven_by_four,seven_by_five_to_seven_by_four,wsevenbyfour,row_4[1:1]);

digit_store sevenbythree(clk,set & set_coordinate_x[6:6] & set_coordinate_y[2:2],reset,seven_by_three_to_seven_by_four,seven_by_three_to_seven_by_two,seven_by_three_to_six_by_three,seven_by_three_to_eight_by_three,eight_by_three_to_seven_by_three,six_by_three_to_seven_by_three,seven_by_two_to_seven_by_three,seven_by_four_to_seven_by_three,wsevenbythree,row_3[1:1]);

digit_store sevenbytwo(clk,set & set_coordinate_x[6:6] & set_coordinate_y[1:1],reset,seven_by_two_to_seven_by_three,seven_by_two_to_seven_by_one,seven_by_two_to_six_by_two,seven_by_two_to_eight_by_two,eight_by_two_to_seven_by_two,six_by_two_to_seven_by_two,seven_by_one_to_seven_by_two,seven_by_three_to_seven_by_two,wsevenbytwo,row_2[1:1]);

digit_store sevenbyone(clk,set & set_coordinate_x[6:6] & set_coordinate_y[0:0],reset,seven_by_one_to_seven_by_two,lower_edge[6:6],seven_by_one_to_six_by_one,seven_by_one_to_eight_by_one,eight_by_one_to_seven_by_one,six_by_one_to_seven_by_one,0,seven_by_two_to_seven_by_one,wsevenbyone,row_1[1:1]);


control_signal_mux muxeightbyeight(control_x_coordinate[7:7] & control_y_coordinate[7:7],control,weightbyeight);

control_signal_mux muxeightbyseven(control_x_coordinate[7:7] & control_y_coordinate[6:6],control,weightbyseven);

control_signal_mux muxeightbysix(control_x_coordinate[7:7] & control_y_coordinate[5:5],control,weightbysix);

control_signal_mux muxeightbyfive(control_x_coordinate[7:7] & control_y_coordinate[4:4],control,weightbyfive);

control_signal_mux muxeightbyfour(control_x_coordinate[7:7] & control_y_coordinate[3:3],control,weightbyfour);

control_signal_mux muxeightbythree(control_x_coordinate[7:7] & control_y_coordinate[2:2],control,weightbythree);

control_signal_mux muxeightbytwo(control_x_coordinate[7:7] & control_y_coordinate[1:1],control,weightbytwo);

control_signal_mux muxeightbyone(control_x_coordinate[7:7] & control_y_coordinate[0:0],control,weightbyone);


digit_store eightbyeight(clk,set & set_coordinate_x[7:7] & set_coordinate_y[7:7],reset,upper_edge[7:7],eight_by_eight_to_eight_by_seven,eight_by_eight_to_seven_by_eight,right_edge[7:7],0,seven_by_eight_to_eight_by_eight,eight_by_seven_to_eight_by_eight,0,weightbyeight,row_8[0:0]);

digit_store eightbyseven(clk,set & set_coordinate_x[7:7] & set_coordinate_y[6:6],reset,eight_by_seven_to_eight_by_eight,eight_by_seven_to_eight_by_six,eight_by_seven_to_seven_by_seven,right_edge[6:6],0,seven_by_seven_to_eight_by_seven,eight_by_six_to_eight_by_seven,eight_by_eight_to_eight_by_seven,weightbyseven,row_7[0:0]);

digit_store eightbysix(clk,set & set_coordinate_x[7:7] & set_coordinate_y[5:5],reset,eight_by_six_to_eight_by_seven,eight_by_six_to_eight_by_five,eight_by_six_to_seven_by_six,right_edge[5:5],0,seven_by_six_to_eight_by_six,eight_by_five_to_eight_by_six,eight_by_seven_to_eight_by_six,weightbysix,row_6[0:0]);

digit_store eightbyfive(clk,set & set_coordinate_x[7:7] & set_coordinate_y[4:4],reset,eight_by_five_to_eight_by_six,eight_by_five_to_eight_by_four,eight_by_five_to_seven_by_five,right_edge[4:4],0,seven_by_five_to_eight_by_five,eight_by_four_to_eight_by_five,eight_by_six_to_eight_by_five,weightbyfive,row_5[0:0]);

digit_store eightbyfour(clk,set & set_coordinate_x[7:7] & set_coordinate_y[3:3],reset,eight_by_four_to_eight_by_five,eight_by_four_to_eight_by_three,eight_by_four_to_seven_by_four,right_edge[3:3],0,seven_by_four_to_eight_by_four,eight_by_three_to_eight_by_four,eight_by_five_to_eight_by_four,weightbyfour,row_4[0:0]);

digit_store eightbythree(clk,set & set_coordinate_x[7:7] & set_coordinate_y[2:2],reset,eight_by_three_to_eight_by_four,eight_by_three_to_eight_by_two,eight_by_three_to_seven_by_three,right_edge[2:2],0,seven_by_three_to_eight_by_three,eight_by_two_to_eight_by_three,eight_by_four_to_eight_by_three,weightbythree,row_3[0:0]);

digit_store eightbytwo(clk,set & set_coordinate_x[7:7] & set_coordinate_y[1:1],reset,eight_by_two_to_eight_by_three,eight_by_two_to_eight_by_one,eight_by_two_to_seven_by_two,right_edge[1:1],0,seven_by_two_to_eight_by_two,eight_by_one_to_eight_by_two,eight_by_three_to_eight_by_two,weightbytwo,row_2[0:0]);

digit_store eightbyone(clk,set & set_coordinate_x[7:7] & set_coordinate_y[0:0],reset,eight_by_one_to_eight_by_two,lower_edge[7:7],eight_by_one_to_seven_by_one,right_edge[0:0],0,seven_by_one_to_eight_by_one,0,eight_by_two_to_eight_by_one,weightbyone,row_1[0:0]);



endmodule

//bi_shift_register row_one(clk,right_shift[7:7],left_shift[7:7],up_shift,down_shift,row_2,8'b0,row_1,reset,set_coordinate_x,(set_coordinate_y[7:7] & set));

//bi_shift_register row_two(clk,right_shift[6:6],left_shift[6:6],up_shift,down_shift,row_3,row_1,row_2,reset,set_coordinate_x,(set_coordinate_y[6:6] & set));

//bi_shift_register row_three(clk,right_shift[5:5],left_shift[5:5],up_shift,down_shift,row_4,row_2,row_3,reset,set_coordinate_x,(set_coordinate_y[5:5] & set));

//bi_shift_register row_four(clk,right_shift[4:4],left_shift[4:4],up_shift,down_shift,row_5,row_3,row_4,reset,set_coordinate_x,(set_coordinate_y[4:4] & set));

//bi_shift_register row_five(clk,right_shift[3:3],left_shift[3:3],up_shift,down_shift,row_6,row_4,row_5,reset,set_coordinate_x,(set_coordinate_y[3:3] & set));

//bi_shift_register row_six(clk,right_shift[2:2],left_shift[2:2],up_shift,down_shift,row_7,row_5,row_6,reset,set_coordinate_x,(set_coordinate_y[2:2] & set));

//bi_shift_register row_seven(clk,right_shift[1:1],left_shift[1:1],up_shift,down_shift,row_8,row_6,row_7,reset,set_coordinate_x,(set_coordinate_y[1:1] & set));

//bi_shift_register row_eight(clk,right_shift[0:0],left_shift[0:0],up_shift,down_shift,8'b0,row_7,row_8,reset,set_coordinate_x,(set_coordinate_y[0:0] & set));