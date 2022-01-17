module bcd_to_decimal(bcd,out);

input [2:0] bcd;
output reg [7:0] out;

always @*
 begin
									case (bcd) 
                           3'b0: begin 
						out = 8'b00000001;
								
								end
                           3'b1: begin
						out = 8'b00000010;
								
								end
                           3'b10: begin 
						out = 8'b00000100;
								end
                           3'b11: begin 
						out = 8'b00001000;
								end
								   3'b100: begin
						out = 8'b00010000;			
								end
									3'b101: begin
						out = 8'b00100000;	
								end
									3'b110: begin
						out = 8'b01000000;		
								end
									3'b111: begin
						out = 8'b10000000;			
								end
									
                           default: begin 
						out = 8'b00000001;
								end
									endcase
 end
endmodule
