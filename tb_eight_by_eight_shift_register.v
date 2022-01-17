module tb_eight_by_eight_shift_register();

reg clk_test,reset_test,set_test;
reg [2:0] control_test;
reg [7:0] set_coordinate_x_test,set_coordinate_y_test,control_x_coordinate_test,control_y_coordinate_test;
wire[7:0] row_1_test,row_2_test,row_3_test,row_4_test,row_5_test,row_6_test,row_7_test,row_8_test;
wire[7:0] left_edge_test,right_edge_test,upper_edge_test,lower_edge_test;
eight_by_eight_shift_register port_map(

.clk(clk_test),
.reset(reset_test),
.set(set_test),
.control(control_test),
.set_coordinate_x(set_coordinate_x_test),
.set_coordinate_y(set_coordinate_y_test),
.control_x_coordinate(control_x_coordinate_test),
.control_y_coordinate(control_y_coordinate_test),
.row_1(row_1_test),
.row_2(row_2_test),
.row_3(row_3_test),
.row_4(row_4_test),
.row_5(row_5_test),
.row_6(row_6_test),
.row_7(row_7_test),
.row_8(row_8_test),
.left_edge(left_edge_test),
.right_edge(right_edge_test),
.upper_edge(upper_edge_test),
.lower_edge(lower_edge_test)

);

initial begin

clk_test = 0;
reset_test = 0;
set_test = 0;
control_test = 3'b0;
set_coordinate_x_test = 8'b0;
set_coordinate_y_test = 8'b0;
control_x_coordinate_test = 8'b0;
control_y_coordinate_test = 8'b0;

#5;
reset_test = 1;
#5;
reset_test = 0;
#5;
#5;
reset_test = 1;
#5;
reset_test = 0;
#5;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
set_test = 1;
set_coordinate_x_test = 8'b00000001;
set_coordinate_y_test = 8'b00000001;
#5;
set_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

control_x_coordinate_test = 8'b00000001;
control_y_coordinate_test = 8'b00000001;
control_test = 3'b0;
#5;
control_x_coordinate_test = 8'b00000000;
control_y_coordinate_test = 8'b00000000;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
set_test = 1;
set_coordinate_x_test = 8'b00000010;
set_coordinate_y_test = 8'b00000001;
#5;
set_test = 0;
#5;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
set_test = 1;
set_coordinate_x_test = 8'b00000100;
set_coordinate_y_test = 8'b00000001;
#5;
set_test = 0;
#5;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");
#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");


#5;
clk_test = 1;
#5;
clk_test = 0;

control_x_coordinate_test = 8'b10000000;
control_y_coordinate_test = 8'b00000001;
set_coordinate_x_test = 8'b10000000;
set_coordinate_y_test = 8'b00000001;
control_test = 3'b10;
#5;



#5;
set_test = 1;

#5;
set_test = 0;

control_x_coordinate_test = 8'b10000000;
control_y_coordinate_test = 8'b00000010;
set_coordinate_x_test = 8'b10000000;
set_coordinate_y_test = 8'b00000010;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");



#5;
clk_test = 1;
#5;
clk_test = 0;

control_x_coordinate_test = 8'b10000000;
control_y_coordinate_test = 8'b00000010;
control_test = 3'b01;
set_coordinate_x_test = 8'b10000000;
set_coordinate_y_test = 8'b00000010;
#5;
set_test = 1;

#5;
set_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

control_x_coordinate_test = 8'b01000000;
control_y_coordinate_test = 8'b00000010;
control_test = 3'b01;
#5;
set_test = 1;
set_coordinate_x_test = 8'b01000000;
set_coordinate_y_test = 8'b00000010;
#5;
set_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;


$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

control_x_coordinate_test = 8'b00000001;
control_y_coordinate_test = 8'b00000010;
control_test = 3'b10;
#5;
set_test = 1;
set_coordinate_x_test = 8'b00000001;
set_coordinate_y_test = 8'b00000010;
#5;
set_test = 0;

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

control_x_coordinate_test = 8'b00000001;
control_y_coordinate_test = 8'b00000100;
control_test = 3'b0;
#5;
set_test = 1;
set_coordinate_x_test = 8'b00000001;
set_coordinate_y_test = 8'b00000100;
#5;
set_test = 0;

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

control_x_coordinate_test = 8'b10000000;
control_y_coordinate_test = 8'b00000100;
control_test = 3'b10;
#5;
set_test = 1;
set_coordinate_x_test = 8'b10000000;
set_coordinate_y_test = 8'b00000100;
#5;
set_test = 0;

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

control_x_coordinate_test = 8'b10000000;
control_y_coordinate_test = 8'b00001000;
control_test = 3'b01;
set_coordinate_x_test = 8'b10000000;
set_coordinate_y_test = 8'b00001000;


#5;
set_test = 1;
#5;
set_test = 0;
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);

$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

control_x_coordinate_test = 8'b00000001;
control_y_coordinate_test = 8'b00001000;
control_test = 3'b10;
set_coordinate_x_test = 8'b00000001;
set_coordinate_y_test = 8'b00001000;


#5;
set_test = 1;
#5;
set_test = 0;
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");


control_x_coordinate_test = 8'b00000001;
control_y_coordinate_test = 8'b00010000;
control_test = 3'b0;
set_coordinate_x_test = 8'b00000001;
set_coordinate_y_test = 8'b00010000;


#5;
set_test = 1;
#5;
set_test = 0;
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

control_x_coordinate_test = 8'b00010000;
control_y_coordinate_test = 8'b00010000;
control_test = 3'b10;
set_coordinate_x_test = 8'b00010000;
set_coordinate_y_test = 8'b00010000;


#5;
set_test = 1;
#5;
set_test = 0;
#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");

#5;
clk_test = 1;
#5;
clk_test = 0;

$display("%b",row_8_test);
$display("%b",row_7_test);
$display("%b",row_6_test);
$display("%b",row_5_test);
$display("%b",row_4_test);
$display("%b",row_3_test);
$display("%b",row_2_test);
$display("%b",row_1_test);



$display("break");
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;

//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//control_x_coordinate_test = 8'b10000000;
//control_y_coordinate_test = 8'b00010000;
//control_test = 3'b10;
//set_coordinate_x_test = 8'b10000000;
//set_coordinate_y_test = 8'b00010000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b10000000;
//control_y_coordinate_test = 8'b00100000;
//control_test = 3'b01;
//set_coordinate_x_test = 8'b10000000;
//set_coordinate_y_test = 8'b00100000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b00000001;
//control_y_coordinate_test = 8'b00100000;
//control_test = 3'b10;
//set_coordinate_x_test = 8'b00000001;
//set_coordinate_y_test = 8'b00100000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b00000001;
//control_y_coordinate_test = 8'b01000000;
//control_test = 3'b0;
//set_coordinate_x_test = 8'b00000001;
//set_coordinate_y_test = 8'b01000000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");

//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b10000000;
//control_y_coordinate_test = 8'b01000000;
//control_test = 3'b10;
//set_coordinate_x_test = 8'b10000000;
//set_coordinate_y_test = 8'b01000000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b10000000;
//control_y_coordinate_test = 8'b10000000;
//control_test = 3'b01;
//set_coordinate_x_test = 8'b10000000;
//set_coordinate_y_test = 8'b10000000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b00000001;
//control_y_coordinate_test = 8'b10000000;
//control_test = 3'b11;
//set_coordinate_x_test = 8'b00000001;
//set_coordinate_y_test = 8'b10000000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b00000001;
//control_y_coordinate_test = 8'b00010000;
//control_test = 3'b0;
//set_coordinate_x_test = 8'b00000001;
//set_coordinate_y_test = 8'b00010000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//control_x_coordinate_test = 8'b00001000;
//control_y_coordinate_test = 8'b00010000;
//control_test = 3'b10;
//set_coordinate_x_test = 8'b00001000;
//set_coordinate_y_test = 8'b00010000;
//
//
//#5;
//set_test = 1;
//#5;
//set_test = 0;
//#5;
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
//
//#5;
//clk_test = 1;
//#5;
//clk_test = 0;
//
//$display("%b",row_8_test);
//$display("%b",row_7_test);
//$display("%b",row_6_test);
//$display("%b",row_5_test);
//$display("%b",row_4_test);
//$display("%b",row_3_test);
//$display("%b",row_2_test);
//$display("%b",row_1_test);
//
//
//
//$display("break");
end







endmodule
