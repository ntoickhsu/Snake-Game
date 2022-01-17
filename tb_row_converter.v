module tb_row_converter();

reg [2:0] coordinate_y_test;

reg [2:0] coordinate_x_test;

wire [7:0] row1_test,row2_test,row3_test,row4_test,row5_test,row6_test,row7_test,row8_test;

integer count1;
integer count2;


row_converter port_map(
.coordinate_y(coordinate_y_test),
.coordinate_x(coordinate_x_test),
.row1(row1_test),
.row2(row2_test),
.row3(row3_test),
.row4(row4_test),
.row5(row5_test),
.row6(row6_test),
.row7(row7_test),
.row8(row8_test)

);

always begin
for (count1 = 0; count1 < 8; count1 = count1 + 1) begin
		coordinate_y_test = count1;
		for (count2 = 0; count2 < 8; count2 = count2 + 1) begin
			coordinate_x_test = count2;
			#5;
		end
		#5;
end

end



endmodule