module position_recorder(clk,r,l,u,d,reset,motion_x,motion_y,edge_collision,load_x,load_y,load);

  input clk,reset;
  input l,r,u,d;
  output reg[2:0] motion_x;
  output reg[2:0] motion_y;
  reg[3:0] reg_x;
  reg[3:0] reg_y;
  output reg edge_collision;
  input [2:0] load_x;
  input [2:0] load_y;
  input load;
  
  
  

  always@(posedge clk,posedge reset,posedge load) begin
		if(reset == 1)begin
		reg_y = 4'b011;
		reg_x = 4'b011;
		motion_x = reg_x[2:0];
		motion_y = reg_y[2:0];
		edge_collision = 0;
		end else begin
			if(load == 1) begin
			reg_x[2:0] = load_x;
			reg_x[3:3] = 0;
			reg_y[2:0] = load_y;
			reg_y[3:3] = 0;
			edge_collision = 0;
			motion_x = load_x;
			motion_y = load_y;
			end else begin

			if(l==1) begin
				reg_x = reg_x - 4'b1;
			end else begin
				if(r==1) begin
					reg_x = reg_x + 4'b1;
				end else begin
							if(u==1) begin
							reg_y = reg_y + 4'b1;
							end else begin
									if(d==1) begin
										reg_y = reg_y - 4'b1;
										end else begin
											reg_y = reg_y;
											reg_x = reg_x;
										end
							end
				end
				end
				
			motion_x = reg_x[2:0];
			motion_y = reg_y[2:0];
			
			edge_collision = reg_x[3:3]|reg_y[3:3];
			end
			
		

		end  

  end
endmodule
