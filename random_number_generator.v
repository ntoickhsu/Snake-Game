module random_number_generator(reset,clk,x_output,y_output);

input clk,reset;

output reg[2:0] y_output, x_output;

reg count;

always@(posedge clk,posedge reset) begin

	if (reset == 1) begin
		count = 0;
		y_output = 3'b01;
		x_output = 3'b11;
	end else begin
		count = count + 1;
		if(count == 1) begin
		y_output = 3'b01;
		x_output = 3'b11;
		end else begin
			if(count == 2) begin
			y_output = 3'b100;
	      x_output = 3'b11;
			end else begin
				y_output = 3'b101;
				x_output = 3'b10;
				count = 0;
			end
		
		end

	end

end



endmodule