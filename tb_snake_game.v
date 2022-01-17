`timescale 1ns/1ps
module tb_snake_game();

reg reset_master_test,left_test,right_test,up_test,down_test,clk_master_test;
wire [7:0] out_cathode_test,out_anode_test;

snake_game port_map(

.reset_master(reset_master_test),
.left(left_test),
.right(right_test),
.up(up_test),
.down(down_test),
.clk_master(clk_master_test),
.out_cathode(out_cathode_test),
.out_anode(out_anode_test)

);

initial begin
reset_master_test = 1'b0;
left_test = 1'b1;
right_test = 1'b1;
up_test = 1'b1;
down_test = 1'b1;
clk_master_test = 1'b0;
#20;
reset_master_test = 1'b1;
#20;
reset_master_test = 1'b0;
#20;

end

always begin
left_test = 1'b1;
right_test = 1'b0;
up_test = 1'b1;
down_test = 1'b1;
clk_master_test = 0;
#20;
clk_master_test = 1;
#20;


end

endmodule