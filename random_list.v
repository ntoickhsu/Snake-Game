module random_list(clk,reset,y,x);

input clk,reset;

output reg [2:0] y;

output reg [7:0] x;

reg [5:0] count;

always@(posedge clk,posedge reset) begin
if(reset == 1) begin
count = 6'b0;
y = 3'b011;
x = 8'b01000000;
end else begin
	case(count) 
	6'b0: begin 
	y = 3'b011;
	x = 8'b01000000;
	end
	6'b1: begin
	y = 3'b001;
	x = 8'b1;
	end
	6'b10: begin
	y = 3'b110;
	x = 8'b00100000;
	end
	6'b11: begin
	y = 3'b110;
	x = 8'b01000000;
	end
	6'b100: begin
	y = 3'b010;
	x = 8'b01000000;
	end
	6'b101: begin
	y = 3'b100;
	x = 8'b00000100;
	end
	6'b110: begin
	y = 3'b111;
	x = 8'b10;
	end
	6'b111: begin
	y = 3'b11;
	x = 8'b100;
	end
	6'b1000: begin
	y = 3'b101;
	x = 8'b10;
	end
	6'b1001: begin
	y = 3'b100;
	x = 8'b1000000;
	end
	6'b1010: begin
	y = 3'b110;
	x = 8'b100;
	end
	6'b1011: begin
	y = 3'b101;
	x = 8'b1000;
	end
	6'b1100: begin
	y = 3'b1;
	x = 8'b10;
	end
	6'b1101: begin
	y = 3'b111;
	x = 8'b1000000;
	end
	6'b1110: begin
	y = 3'b1;
	x = 8'b1000000;
	end
	6'b1111: begin
	y = 3'b11;
	x = 8'b100000;
	end
	6'b10000: begin
	y = 3'b0;
	x = 8'b10000000;
	end
	6'b10001: begin
	y = 3'b0;
	x = 8'b100;
	end
	6'b10010: begin
	y = 3'b111;
	x = 8'b10000;
	end
	6'b10011: begin
	y = 3'b111;
	x = 8'b10000000;
	end
	6'b10100: begin
	y = 3'b101;
	x = 8'b1;
	end
	6'b10101: begin
	y = 3'b101;
	x = 8'b1000000;
	end
	6'b10110: begin
	y = 3'b100;
	x = 8'b100000;
	end
	6'b10111: begin
	y = 3'b111;
	x = 8'b100000;
	end
	6'b11000: begin
	y = 3'b110;
	x = 8'b10;
	end
	6'b11001: begin
	y = 3'b111;
	x = 8'b1;
	end
	6'b11010: begin
	y = 3'b0;
	x = 8'b1000;
	end
	6'b11011: begin
	y = 3'b100;
	x = 8'b10000;
	end
	6'b11100: begin
	y = 3'b11;
	x = 8'b1000;
	end
	6'b11101: begin
	y = 3'b10;
	x = 8'b1;
	end
	6'b11110: begin
	y = 3'b101;
	x = 8'b10000;
	end
	6'b11111: begin
	y = 3'b1;
	x = 8'b10000000;
	end
	6'b100000: begin 
	y = 3'b11;
	x = 8'b10;
	end
	6'b100001: begin
	y = 3'b1;
	x = 8'b1000;
	end
	6'b100010: begin
	y = 3'b0;
	x = 8'b10;
	end
	6'b100011: begin
	y = 3'b0;
	x = 8'b100000;
	end
	6'b100100: begin
	y = 3'b100;
	x = 8'b10000000;
	end
	6'b100101: begin
	y = 3'b0;
	x = 8'b10000;
	end
	6'b100110: begin
	y = 3'b101;
	x = 8'b100;
	end
	6'b100111: begin
	y = 3'b111;
	x = 8'b100;
	end
	6'b101000: begin
	y = 3'b11;
	x = 8'b10000;
	end
	6'b101001: begin
	y = 3'b100;
	x = 8'b10;
	end
	6'b101010: begin
	y = 3'b111;
	x = 8'b1000;
	end
	6'b101011: begin
	y = 3'b10;
	x = 8'b10;
	end
	6'b101100: begin
	y = 3'b110;
	x = 8'b10000000;
	end
	6'b101101: begin
	y = 3'b10;
	x = 8'b100;
	end
	6'b101110: begin
	y = 3'b1;
	x = 8'b100;
	end
	6'b101111: begin
	y = 3'b110;
	x = 8'b1;
	end
	6'b110000: begin	
	y = 3'b101;
	x = 8'b100000;
	end
	6'b110001: begin
	y = 3'b100;
	x = 8'b1;
	end
	6'b110010: begin
	y = 3'b10;
	x = 8'b10000000;
	end
	6'b110011: begin
	y = 3'b101;
	x = 8'b10000000;
	end
	6'b110100: begin
	y = 3'b1;
	x = 8'b10000;
	end
	6'b110101: begin
	y = 3'b110;
	x = 8'b1000;
	end
	6'b110110: begin
	y = 3'b1;
	x = 8'b100000;
	end
	6'b110111: begin
	y = 3'b100;
	x = 8'b1000;
	end
	6'b111000: begin
	y = 3'b10;
	x = 8'b10000;
	end
	6'b111001: begin
	y = 3'b11;
	x = 8'b10000000;
	end
	6'b111010: begin
	y = 3'b0;
	x = 8'b1000000;
	end
	6'b111011: begin
	y = 3'b10;
	x = 8'b1000;
	end
	6'b111100: begin
	y = 3'b11;
	x = 8'b1;
	end
	6'b111101: begin
	y = 3'b110;
	x = 8'b10000;
	end
	6'b111110: begin
	y = 3'b0;
	x = 8'b1;
	end
	6'b111111: begin
	y = 3'b10;
	x = 8'b100000;
	count = 0;
	end
	default: begin
	y = 3'b10;
	x = 8'b100000;
	count = 0;
	end
	endcase
	count = count + 6'b1;
	end
end

endmodule

