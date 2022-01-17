module LED_driver_test_lower_level(clk,reset,out_cathode,out_anode,row1,row2,row3,row4,row5,row6,row7,row8);
input clk, reset;

input [7:0] row1,row2,row3,row4,row5,row6,row7,row8;

output reg [7:0] out_cathode,out_anode;

reg [2:0] count;

reg[7:0] count2;

always@(posedge clk,posedge reset) begin
if(reset == 1) begin
count = 3'b0;
count2 = 8'b10000000;
end else begin
	case(count)
	3'b0: begin
		if(count2 == 8'b0) begin
		count = 3'b1;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row1;
		out_cathode = 8'b01111111;
		count2 = count2 >> 1;
		end
	end
	3'b1: begin
		if(count2 == 8'b0) begin
		count = 3'b10;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row2;
		out_cathode = 8'b10111111;
		count2 = count2 >> 1;
		end
	end
	3'b10: begin
		if(count2 == 8'b0) begin
		count = 3'b11;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row3;
		out_cathode = 8'b11011111;
		count2 = count2 >> 1;
		end
	end
	3'b11: begin
		if(count2 == 8'b0) begin
		count = 3'b100;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row4;
		out_cathode = 8'b11101111;
		count2 = count2 >> 1;
		end
	end
	3'b100: begin
		if(count2 == 8'b0) begin
		count = 3'b101;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row5;
		out_cathode = 8'b11110111;
		count2 = count2 >> 1;
		end
	end
	3'b101: begin
		if(count2 == 8'b0) begin
		count = 3'b110;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row6;
		out_cathode = 8'b11111011;
		count2 = count2 >> 1;
		end
	end
	3'b110: begin
		if(count2 == 8'b0) begin
		count = 3'b111;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row7;
		out_cathode = 8'b11111101;
		count2 = count2 >> 1;
		end
	end
	3'b111: begin
		if(count2 == 8'b0) begin
		count = 3'b0;
		count2 = 8'b10000000;
		end else begin
		out_anode = count2&row8;
		out_cathode = 8'b11111110;
		count2 = count2 >> 1;
		end
	end
	default: begin
	out_anode = 8'b10000000;
	out_cathode = 8'b11111110;
	count = 3'b0;
	end
	endcase

end
end

endmodule

//8'b00100100
//8'b01011010
//8'b10000001
//8'b01000010
//8'b00100100
//8'b00011000
//8'b01111110
//8'b10000001