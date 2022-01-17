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