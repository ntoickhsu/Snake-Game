module move_register(clk,load,out_head,out_pos,pos,reset,shift);

input clk,reset,shift;

input [2:0] load;

input [5:0] pos;

output reg [2:0] out_head,out_pos;

reg [191:0] hold_all;



always@(posedge clk,posedge reset)begin
	if(reset == 1) begin
	hold_all = 192'b0;
	out_head = hold_all[191:189];
	out_pos = hold_all[191:189];
	end else begin
	
		if(shift == 1) begin
		hold_all = hold_all >> 1;
		hold_all = hold_all >> 1;
		hold_all = hold_all >> 1;

		hold_all[191:189] = load;
		end else begin
		hold_all = hold_all;
		end
		
	out_head = hold_all[191:189];
	
	case(pos)
	6'b0:begin out_pos = hold_all[191:189]; end
	6'b1:begin out_pos = hold_all[188:186]; end
	6'b10:begin out_pos = hold_all[185:183]; end
	6'b11:begin out_pos = hold_all[182:180];	end
	6'b100:begin out_pos = hold_all[179:177]; end
	6'b101:begin out_pos = hold_all[176:174]; end
	6'b110:begin out_pos = hold_all[173:171]; end
	6'b111:begin out_pos = hold_all[170:168]; end
	6'b1000:begin out_pos = hold_all[167:165]; end
	6'b1001:begin out_pos = hold_all[164:162]; end
	6'b1010:begin out_pos = hold_all[161:159]; end
	6'b1011:begin out_pos = hold_all[158:156]; end
	6'b1100:begin out_pos = hold_all[155:153]; end
	6'b1101:begin out_pos = hold_all[152:150]; end
	6'b1110:begin out_pos = hold_all[149:147]; end
	6'b1111:begin out_pos = hold_all[146:144]; end
	6'b10000:begin out_pos = hold_all[143:141]; end
	6'b10001:begin out_pos = hold_all[140:138]; end
	6'b10010:begin out_pos = hold_all[137:135]; end
	6'b10011:begin out_pos = hold_all[134:132]; end
	6'b10100:begin out_pos = hold_all[131:129]; end
	6'b10101:begin out_pos = hold_all[128:126]; end
	6'b10110:begin out_pos = hold_all[125:123]; end
	6'b10111:begin out_pos = hold_all[122:120]; end
	6'b11000:begin out_pos = hold_all[119:117]; end
	6'b11001:begin out_pos = hold_all[116:114]; end
	6'b11010: begin out_pos = hold_all[113:111]; end
	6'b11011: begin out_pos = hold_all[110:108]; end
	6'b11100: begin out_pos = hold_all[107:105]; end
	6'b11101: begin out_pos = hold_all[104:102]; end
	6'b11110: begin out_pos = hold_all[101:99]; end
	6'b11111: begin out_pos = hold_all[98:96]; end
	6'b100000: begin out_pos = hold_all[95:93]; end
	6'b100001: begin out_pos = hold_all[92:90]; end
	6'b100010: begin out_pos = hold_all[89:87]; end
	6'b100011: begin out_pos = hold_all[86:84]; end
	6'b100100: begin out_pos = hold_all[83:81]; end
	6'b100101: begin out_pos = hold_all[80:78]; end
	6'b100110: begin out_pos = hold_all[77:75]; end
	6'b100111: begin out_pos = hold_all[74:72]; end
	6'b101000: begin out_pos = hold_all[71:69]; end
	6'b101001: begin out_pos = hold_all[68:66]; end
	6'b101010: begin out_pos = hold_all[65:63]; end
	6'b101011: begin out_pos = hold_all[62:60]; end
	6'b101100: begin out_pos = hold_all[59:57]; end
	6'b101101: begin out_pos = hold_all[56:54]; end
	6'b101110: begin out_pos = hold_all[53:51]; end
	6'b101111: begin out_pos = hold_all[50:48]; end
	6'b110000: begin out_pos = hold_all[47:45]; end
	6'b110001: begin out_pos = hold_all[44:42]; end
	6'b110010: begin out_pos = hold_all[41:39]; end
	6'b110011: begin out_pos = hold_all[38:36]; end
	6'b110100: begin out_pos = hold_all[35:33]; end
	6'b110101: begin out_pos = hold_all[32:30]; end
	6'b110110: begin out_pos = hold_all[29:27]; end
	6'b110111: begin out_pos = hold_all[26:24]; end
	6'b111000: begin out_pos = hold_all[23:21]; end
	6'b111001: begin out_pos = hold_all[20:18]; end
	6'b111010: begin out_pos = hold_all[17:15]; end
	6'b111011: begin out_pos = hold_all[14:12]; end
	6'b111100: begin out_pos = hold_all[11:9]; end
	6'b111101: begin out_pos = hold_all[8:6]; end
	6'b111110: begin out_pos = hold_all[5:3]; end
	6'b111111: begin out_pos = hold_all[2:0]; end
	default: begin out_pos = hold_all[2:0]; end
	endcase
	
	end
end
endmodule