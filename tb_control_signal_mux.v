module tb_control_signal_mux();
reg select_test;
reg [2:0] in_test;
wire [2:0] out_test;

integer count;

control_signal_mux port_map(
.select(select_test),
.in(in_test),
.out(out_test)
);

initial begin 
select_test = 0;
in_test = 3'b0;
end

always begin 
for(count = 0; count < 8; count = count + 1) begin
in_test = count;
#5;
select_test = 1;
#5;
select_test = 0;
end
end

endmodule