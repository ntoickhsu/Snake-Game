module digit_store(clk,set,reset,out_up,out_down,out_left,out_right,left_shift,right_shift,up_shift,down_shift,user_input,data_out);
input clk,set,reset,left_shift,right_shift,up_shift,down_shift;
input [2:0] user_input;
reg [1:0] direction;
output reg out_up,out_down,out_left,out_right,data_out;

always@(posedge clk,posedge reset,posedge set) begin

				if(reset == 1) begin
				
				data_out = 0;
				direction = 2'b0;
				out_right = data_out; 
				out_left= data_out; 
				out_up = data_out; 
	         out_down = data_out; 

				end else begin 
								if(set == 1) begin
								   
								   data_out = 1;
				                   
									case (user_input) 
                           3'b0: begin direction = 2'b00; end
                           3'b01: begin direction = 2'b01; end
                           3'b10: begin direction = 2'b10; end
                           3'b11: begin direction = 2'b11; end
                           default: begin direction = 2'b00; end
									endcase
								
								case (direction) 
										2'b0: begin out_right = 1; 
										out_left = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b01: begin out_left = 1; 
										out_right = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b10: begin out_up = 1; 
										out_down = 0;
										out_right = 0;
										out_left = 0;
										end
										2'b11: begin out_down = 1; 
										out_right = 0;
										out_left = 0;
										out_up = 0; 
										end
										default: begin out_right = 1; 
										out_left = 0;
										out_up = 0; 
										out_down = 0;
										end
										endcase
								
									

							      end else begin 
									if(data_out == 0) begin
										if(right_shift == 1)begin
										direction = 2'b0;
										end else begin
												if(left_shift == 1) begin
												direction = 2'b01;
													end else begin
															if(up_shift == 1) begin
															direction = 2'b10;
																end else begin
																		if(down_shift == 1) begin
																		direction = 2'b11;
																		end else begin
																		direction = direction;
																		end
																	end
														end 
											end
									end else begin
											direction = direction;
										end
										
										data_out = left_shift|right_shift|up_shift|down_shift;
										
									case (direction) 
										2'b0: begin out_right = data_out; 
										out_left = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b01: begin out_left = data_out; 
										out_right = 0;
										out_up = 0; 
										out_down = 0;
										end
										2'b10: begin out_up = data_out; 
										out_down = 0;
										out_right = 0;
										out_left = 0;
										end
										2'b11: begin out_down = data_out;
										out_left = 0;
										out_up = 0;
									//error was here	
										out_right = 0;
									end
										default: begin out_right = data_out;
										out_left = 0;
										out_up = 0; 
										out_down = 0;
									   end
										endcase
                               end   
				     end
                                      

end
endmodule


																		

																		
																									  
																												 

	
     

		
		
		
                
               
    