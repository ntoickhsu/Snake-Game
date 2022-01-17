module move_to_position(bcd,r,l,u,d);

input [2:0] bcd;
output reg l,r,u,d;

always @*
 begin
									case (bcd) 
                           3'b0: begin 
									r = 1;
									u = 0;
									d = 0;
									l = 0;
								
								end
                           3'b01: begin
									r = 0;
									u = 0;
									d = 0;
									l = 1;
								
								end
                           3'b10: begin 
									r = 0;
									u = 1;
									d = 0;
									l = 0;
								
								end
                           3'b11: begin 
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
