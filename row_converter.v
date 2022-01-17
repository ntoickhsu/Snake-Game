module row_converter(coordinate_x,coordinate_y,row1,row2,row3,row4,row5,row6,row7,row8);

input [2:0] coordinate_y;

input [2:0] coordinate_x;

output reg [7:0] row1,row2,row3,row4,row5,row6,row7,row8;

reg [7:0] hold;



always @* begin
						case(coordinate_x)
						3'b0: begin
						hold = 8'b10000000;
						end
						3'b01: begin
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
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = 8'b0;
								row8 = 8'b0;
								end
                           3'b1: begin
								row1 = 8'b0;
								row2 = hold;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = 8'b0;
								row8 = 8'b0;
								end
                           3'b10: begin 
								row1 = 8'b0;
								row2 = 8'b0;
								row3 = hold;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = 8'b0;
								row8 = 8'b0;
								end
                           3'b11: begin 
								row1 = 8'b0;
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = hold;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = 8'b0;
								row8 = 8'b0;
								end
								   3'b100: begin
								row1 = 8'b0;
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = hold;
								row6 = 8'b0;
								row7 = 8'b0;
								row8 = 8'b0;
								end
									3'b101: begin
							   row1 = 8'b0;
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = hold;
								row7 = 8'b0;
								row8 = 8'b0;
								end
									3'b110:begin
							   row1 = 8'b0;
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = hold;
								row8 = 8'b0;
								end
									3'b111: begin
							   row1 = 8'b0;
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = 8'b0;
								row8 = hold;
								end
                        default: begin 
							   row1 = 8'b0;
								row2 = 8'b0;
								row3 = 8'b0;
								row4 = 8'b0;
								row5 = 8'b0;
								row6 = 8'b0;
								row7 = hold;
								row8 = 8'b0;
								end
									endcase



end
endmodule


