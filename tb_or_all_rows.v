module tb_or_all_rows();
reg [7:0] row_1_1_test,row_2_1_test,row_3_1_test,row_4_1_test,row_5_1_test,row_6_1_test,row_7_1_test,row_8_1_test,row_1_2_test,row_2_2_test,row_3_2_test,row_4_2_test,row_5_2_test,row_6_2_test,row_7_2_test,row_8_2_test;

wire [7:0] row_1_test,row_2_test,row_3_test,row_4_test,row_5_test,row_6_test,row_7_test,row_8_test;

or_all_rows port_map(
.row_1_1(row_1_1_test),
.row_2_1(row_2_1_test),
.row_3_1(row_3_1_test),
.row_4_1(row_4_1_test),
.row_5_1(row_5_1_test),
.row_6_1(row_6_1_test),
.row_7_1(row_7_1_test),
.row_8_1(row_8_1_test),
.row_1_2(row_1_2_test),
.row_2_2(row_2_2_test),
.row_3_2(row_3_2_test),
.row_4_2(row_4_2_test),
.row_5_2(row_5_2_test),
.row_6_2(row_6_2_test),
.row_7_2(row_7_2_test),
.row_8_2(row_8_2_test),
.row_1(row_1_test),
.row_2(row_2_test),
.row_3(row_3_test),
.row_4(row_4_test),
.row_5(row_5_test),
.row_6(row_6_test),
.row_7(row_7_test),
.row_8(row_8_test)
);

initial begin 

#5;
row_1_1_test  = 8'b1;
row_2_1_test  = 8'b1;
row_3_1_test  = 8'b1;
row_4_1_test  = 8'b1;
row_5_1_test  = 8'b1;
row_6_1_test  = 8'b1;
row_7_1_test  = 8'b1;
row_8_1_test  = 8'b1;

row_1_2_test = 8'b10000000;
row_2_2_test = 8'b10000000;
row_3_2_test = 8'b10000000;
row_4_2_test = 8'b10000000;
row_5_2_test = 8'b10000000;
row_6_2_test = 8'b10000000;
row_7_2_test = 8'b10000000;
row_8_2_test = 8'b10000000;
#5;

end

endmodule