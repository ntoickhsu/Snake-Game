module tb_move_register();
reg clk_test,reset_test,shift_test;
reg [2:0] load_test;
reg [5:0] pos_test;
wire [2:0] out_head_test,out_pos_test;

integer input_test0;
integer input_test1;
integer input_test2;


move_register port_map(
.clk(clk_test),
.reset(reset_test),
.load(load_test),
.pos(pos_test),
.out_head(out_head_test),
.out_pos(out_pos_test),
.shift(shift_test)

);

initial begin 
shift_test = 0;
clk_test = 0;
reset_test = 0;
pos_test = 6'b0;
load_test = 2'b0;
#5;
reset_test = 1;
#5;
reset_test = 0;
end

always begin 

	shift_test = 1;
	
	for(input_test0 = 0; input_test0 < 16; input_test0 = input_test0 + 1) begin
		for(input_test1 = 0;input_test1 < 4; input_test1 = input_test1 + 1) begin
		load_test = input_test1;
		#5;
		clk_test = 1;
		#5;
		clk_test = 0;
		end
	end
	
	shift_test = 0;
	
	for(input_test2 = 0; input_test2 < 64; input_test2 = input_test2 + 1) begin
		pos_test = input_test2;
		#5;
		clk_test = 1;
		#5;
		clk_test = 0;
	end
end

endmodule