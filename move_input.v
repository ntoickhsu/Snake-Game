module move_input(left,right,up,down,out,reset,clk);

input left,right,up,down,reset,clk;

output reg [2:0] out;

always@(posedge clk,posedge reset) begin
if(reset == 1) begin
out = 3'b0;
end else begin

if ( left == 1) begin
	if ( out == 3'b0) begin
	out = out;
	end else begin
	out = 3'b001;
	end
end else begin
	if(right == 1) begin
		if( out == 3'b001)begin
		out = out;
		end else begin
		out = 3'b0;
		end 
	end else begin
		if(up == 1) begin
			if (out == 3'b011) begin 
			out = out;
			end else begin
			out = 3'b010;
			end
		end else begin
			if(down == 1) begin
				if(out == 3'b010)begin
				out = out;
				end else begin
				out = 3'b011;
				end
			end else begin
				out = out;
			end
		end
	end

end
end
end
endmodule