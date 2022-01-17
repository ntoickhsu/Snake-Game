module tb_move_to_position();

reg [2:0] bcd_test;
wire l_test,r_test,u_test,d_test;

integer integer_test;

move_to_position port_map(

.bcd(bcd_test),
.l(l_test),
.r(r_test),
.u(u_test),
.d(d_test)

);

always begin 

	for(integer_test = 0; integer_test < 8; integer_test = integer_test + 1) begin
		bcd_test = integer_test;
		#5;
	end

end

endmodule
