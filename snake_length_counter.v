module snake_length_counter(clk,reset,length);
input clk;
input reset;
output reg [5:0] length;

always@(posedge clk, posedge reset) begin
	if(reset == 1) begin
	length = 6'b0;
	end else begin
	length = length + 6'b1;
	end
end
endmodule