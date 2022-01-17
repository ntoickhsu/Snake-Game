module clk_divider_game(clk_50Mhz, rst, clk1hz);

input clk_50Mhz,rst;

output reg clk1hz;

reg [21:0] count;

always@(posedge clk_50Mhz,  posedge rst) begin

if(rst == 1)begin
count <= 22'b0;
clk1hz <= 0;
end
else if(count == 2499999) begin //24999
count <= 22'b0;
clk1hz <= ~clk1hz;
end

else begin
count <= count + 22'b1;
clk1hz <= clk1hz;
end


end

endmodule