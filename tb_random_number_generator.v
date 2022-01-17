module tb_random_number_generator();

reg clk_test,reset_test;

wire[2:0] y_output_test,x_output_test;

random_number_generator port_map(
.clk(clk_test),
.reset(reset_test),
.y_output(y_output_test),
.x_output(x_output_test)
);

initial begin
clk_test = 0;
reset_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
#5;
end

always begin
clk_test = 1;
#5;
clk_test = 0;
#5;
$display("%b",y_output_test);
$display("%b",x_output_test);
end

endmodule