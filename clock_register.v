//this module is supposed to allock for a single clock to control the other modules. It first engages the three clock signals needed to control the main modules, then provides the clock signal needed to run the serial converter
module clock_register(reset,clk_main,clk_move,clk_head,clk_shift_register,clk_serial);

input reset,clk_main;

output reg clk_move,clk_head,clk_shift_register,clk_serial;

reg[6:0] count;

always@(posedge clk_main,posedge reset) begin

	if(reset == 1) begin 
		count = 7'b0;
		clk_move = 0;
		clk_head = 0;
		clk_shift_register = 0;
		clk_serial = 0;
	end else begin
		if(count == 7'b0) begin
		clk_move = 1;
		clk_head = 0;
		clk_shift_register = 0;
		clk_serial = 0;
		end else begin
			if(count == 7'b1) begin
			clk_head = 1;
			clk_move = 0;
			clk_shift_register = 0;
		   clk_serial = 0;
			end else begin
				if(count == 7'b10) begin
				clk_shift_register = 1;
				clk_move = 0;
		      clk_head = 0;
				clk_serial = 0;
				end else begin
				clk_serial = ~clk_serial;
				end
			end
		end
		
		if(count == 1000010)begin
		count = 7'b0;
		end else begin
		count = count + 7'b1;
		end

	end

end



endmodule