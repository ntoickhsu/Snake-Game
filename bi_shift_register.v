module bi_shift_register(clk,shift_right,shift_left,load_ups,load_downs,load_ups_values,load_downs_values,parallel_out,reset,load_in,set);
input clk,shift_right,shift_left,reset,set;
input [7:0] load_ups,load_downs,load_in,load_ups_values,load_downs_values;
output reg [7:0] parallel_out;

always@(posedge clk,posedge reset,posedge set) begin
if(reset == 1)begin
parallel_out = 8'b0;
end
else begin
	if(set == 1)begin
	parallel_out = parallel_out|load_in;
	end
	else begin
		
	   if(parallel_out == parallel_out|load_ups_values) begin
		case (load_ups)
		8'b10000000: begin parallel_out[7:7] = load_ups_values[7:7];  end
		8'b01000000: begin parallel_out[6:6] = load_ups_values[6:6];  end
		8'b00100000: begin parallel_out[5:5] = load_ups_values[5:5];  end
		8'b00010000: begin parallel_out[4:4] = load_ups_values[4:4];  end
		8'b00001000: begin parallel_out[3:3] = load_ups_values[3:3];  end
		8'b00000100: begin parallel_out[2:2] = load_ups_values[2:2];  end
		8'b00000010: begin parallel_out[1:1] = load_ups_values[1:1];  end
		8'b00000001: begin parallel_out[0:0] = load_ups_values[0:0];  end
		default:     begin parallel_out = parallel_out;               end
		endcase
		end else begin
		parallel_out = parallel_out;
		end
		if(parallel_out == parallel_out|load_downs_values) begin
		case (load_downs)
		8'b10000000: begin parallel_out[7:7] = load_downs_values[7:7];  end
		8'b01000000: begin parallel_out[6:6] = load_downs_values[6:6];  end
		8'b00100000: begin parallel_out[5:5] = load_downs_values[5:5];  end
		8'b00010000: begin parallel_out[4:4] = load_downs_values[4:4];  end
		8'b00001000: begin parallel_out[3:3] = load_downs_values[3:3];  end
		8'b00000100: begin parallel_out[2:2] = load_downs_values[2:2];  end
		8'b00000010: begin parallel_out[1:1] = load_downs_values[1:1];  end
		8'b00000001: begin parallel_out[0:0] = load_downs_values[0:0];  end
		default:     begin parallel_out = parallel_out;                 end
		endcase
		end else begin
		parallel_out = parallel_out;
		end
		
		if(shift_right == 1)begin
		parallel_out = parallel_out >> 1;
		end else begin
		parallel_out = parallel_out;
		end
		
		if(shift_left == 1)begin
		parallel_out = parallel_out << 1;
		end else begin
		parallel_out = parallel_out;
		end
		
	end
end


end
endmodule