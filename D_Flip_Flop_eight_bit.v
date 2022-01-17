module D_Flip_Flop_eight_bit(D,Q,Rst,Clk,set);
input [7:0] D;
input Rst,Clk,set;
output reg [7:0] Q;

always@(posedge Clk,posedge Rst, posedge set) begin
if(set == 1) begin
Q <= 8'b1;
end
else if(Rst == 1) begin
Q <= 8'b0;
end
else begin
Q <= D;
end
end

endmodule