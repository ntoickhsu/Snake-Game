module tb_position_recorder();


 reg clk_test,reset_test;
 reg l_test,r_test,u_test,d_test;
 wire[2:0] motion_x_test;
 wire[2:0] motion_y_test;
 wire edge_collision_test;
 reg load_test;
 reg [2:0]load_x_test;
 reg [2:0] load_y_test;
  
position_recorder port_map(
.clk(clk_test),
.reset(reset_test),
.l(l_test),
.r(r_test),
.u(u_test),
.d(d_test),
.motion_x(motion_x_test),
.motion_y(motion_y_test),
.edge_collision(edge_collision_test),
.load(load_test),
.load_x(load_x_test),
.load_y(load_y_test)
);

initial begin
load_test =0;
load_x_test = 3'b0;
load_y_test = 3'b0;
clk_test = 0;
reset_test =0;
l_test = 0;
r_test = 0;
u_test = 0;
d_test = 0;
#5;
reset_test = 1;
#5;
reset_test = 0;
#5;
end

always begin 
l_test = 0;
r_test = 0;
u_test = 0;
d_test = 0;


clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 1;
r_test = 0;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 1;
r_test = 0;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;


clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 1;
r_test = 0;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

#5;
reset_test = 1;
#5;
reset_test = 0;
#5;

l_test = 0;
r_test = 1;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 1;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 1;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 1;
u_test = 0;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;

#5;
reset_test = 1;
#5;
reset_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 0;
d_test = 1;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 0;
d_test = 1;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 0;
d_test = 1;

clk_test = 1;
#5;
clk_test = 0;
#5;

reset_test = 1;
#5;
reset_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 1;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 1;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 1;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 1;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

l_test = 0;
r_test = 0;
u_test = 1;
d_test = 0;

clk_test = 1;
#5;
clk_test = 0;
#5;

load_x_test = 3'b011;
load_y_test = 3'b011;

load_test = 0;
#5;
load_test = 1;
#5;
load_test =0;




end



endmodule