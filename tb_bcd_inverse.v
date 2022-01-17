module tb_bcd_inverse();

reg [7:0] in_test;

wire [2:0] out_test;

bcd_inverse port_map(
.in(in_test),
.out(out_test)
);


initial begin
in_test = 8'b1;
end
always begin
#5;
in_test = in_test << 1;
end



endmodule