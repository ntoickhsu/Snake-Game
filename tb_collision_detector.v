module tb_collision_detector();

reg[7:0] row1_test,row2_test,row3_test,row4_test,row5_test,row6_test,row7_test,row8_test;

wire collide_test;

reg[2:0] coordinate_y_test;

reg[2:0] coordinate_x_test;

collision_detector port_map(
.row1(row1_test),
.row2(row2_test),
.row3(row3_test),
.row4(row4_test),
.row5(row5_test),
.row6(row6_test),
.row7(row7_test),
.row8(row8_test),
.collide(collide_test),
.coordinate_y(coordinate_y_test),
.coordinate_x(coordinate_x_test)
);

initial begin
row1_test = 8'b0;
row2_test = 8'b0;
row3_test = 8'b0;
row4_test = 8'b00010000;
row5_test = 8'b0;
row6_test = 8'b0;
row7_test = 8'b0;
row8_test = 8'b0;
coordinate_x_test = 3'b011;
coordinate_y_test = 3'b011;
#5;
row1_test = 8'b0;
row2_test = 8'b0;
row3_test = 8'b0;
row4_test = 8'b00000010;
row5_test = 8'b0;
row6_test = 8'b0;
row7_test = 8'b0;
row8_test = 8'b0;
coordinate_x_test = 3'b011;
coordinate_y_test = 3'b011;
#5;


end



endmodule