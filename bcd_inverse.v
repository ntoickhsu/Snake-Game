module bcd_inverse(in,out);

input [7:0] in;

output reg [2:0] out;

always@* begin
	case (in) 
		8'b00000001: begin
			out = 3'b0;
		end
		8'b00000010: begin
			out = 3'b1;
		end	
		8'b00000100: begin
			out = 3'b10;
		end
		8'b00001000: begin
			out = 3'b11;
		end
		8'b00010000: begin
			out = 3'b100;
		end
		8'b00100000: begin
			out = 3'b101;
		end
		8'b01000000: begin
			out = 3'b110;
		end
		8'b10000000: begin
			out = 3'b111;
		end
		default: begin
			out = 3'b111;
		end
	endcase

end

endmodule