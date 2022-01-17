module tb_D_Flip_Flop_eight_bit();

reg [7:0] D_test;
reg Rst_test,Clk_test,set_test;
wire [7:0] Q_test;

integer count1;



D_Flip_Flop_eight_bit port_map(
.D(D_test),
.Rst(Rst_test),
.Clk(Clk_test),
.set(set_test),
.Q(Q_test)

);


initial begin
D_test = 8'b0;
Rst_test = 0;
Clk_test = 0;
set_test = 0;
#5;
set_test = 1;
#5;
set_test = 0;
#5;
Rst_test = 1;
#5;
Rst_test = 0;
#5;
end

always begin 

	for(count1 = 0; count1  < 256; count1 = count1 + 1) begin
		D_test = count1;
		Clk_test = 0;
		#5;
		Clk_test = 1;
		#5;
	end

end

endmodule