module clk_drivers(reset,clk_master,clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,food_collision,set_collide,load,snake_increment,clk_food,food_collision_replace,display);

input reset,food_collision,clk_master,food_collision_replace;

output reg clk_load_move,clk_load_move_register,set_eightbyeight,update_counters,clk_eightxeight,set_collide,load,snake_increment,clk_food,display;

reg [3:0] count;

always@(posedge clk_master,posedge reset) begin
if(reset == 1) begin
count = 4'b0;
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;

end else begin
	case(count)
	4'b0: begin
	clk_load_move = 1;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b1;
	
	end
	4'b1: begin
	clk_load_move = 0;
	clk_load_move_register = 1;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 1;
	
	count = count + 4'b1;
	
	end
	4'b10: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 1;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b1;
	
	end
	4'b11: begin
	
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = count + 4'b1;
	end
	4'b100: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 1;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b1;
	
	end
	4'b101: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 1;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	
	count = count + 4'b1;
	
	end
	4'b110: begin
		if(food_collision == 1) begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 1;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = count + 4'b1;
		end else begin
		count = 4'b0;
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
		end
	end
	4'b111: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 1;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = count + 4'b1;
	end
	4'b1000: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 1;
	clk_food = 0;
	display = 0;
	count = count + 4'b1;
	end
	4'b1001: begin
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 1;
	display = 0;
	count = count + 4'b1;
	end
	4'b1010: begin
		if(food_collision_replace == 1)begin
		if(clk_food == 1) begin
		clk_food = 0;
		end else begin
		clk_food = 1;
		end
		clk_load_move = 0;
	 clk_load_move_register = 0;
	 set_eightbyeight = 0;
	 update_counters = 0;
	 clk_eightxeight = 0;
	 set_collide = 0;
	 load = 0;
	 snake_increment = 0;
	 display = 0;
		count = 4'b1010;
		end else begin
		count = 4'b0;
		clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	count = 4'b0;
		end
	end
	default: begin
	count = 4'b0;
	clk_load_move = 0;
	clk_load_move_register = 0;
	set_eightbyeight = 0;
	update_counters = 0;
	clk_eightxeight = 0;
	set_collide = 0;
	load = 0;
	snake_increment = 0;
	clk_food = 0;
	display = 0;
	end
	endcase
end
end

endmodule