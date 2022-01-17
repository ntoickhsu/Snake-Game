module collision_detector(row1,row2,row3,row4,row5,row6,row7,row8,collide,coordinate_x,coordinate_y);

input[7:0] row1,row2,row3,row4,row5,row6,row7,row8;

output reg collide;

input[2:0] coordinate_y;

input[2:0] coordinate_x;

reg[7:0] hold;


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