module D_Flip_Flop(D,Q,Rst,Clk,set);
input D,Rst,Clk,set;
output reg Q;

always@(posedge Clk,posedge Rst, posedge set) begin
if(set == 1) begin
Q <= 1;
end
else if(Rst == 1) begin
Q <= 0;
end
else begin
Q <= D;
end
end

endmodule