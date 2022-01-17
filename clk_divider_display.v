module clk_divider_display(clk_50Mhz, rst, clk1hz);

input clk_50Mhz,rst;

output reg clk1hz;

reg [12:0] count;

always@(posedge clk_50Mhz,  posedge rst) begin

if(rst == 1)begin
count <= 13'b0;
clk1hz <= 0;
end
else if(count == 4999) begin //24999
count <= 13'b0;
clk1hz <= ~clk1hz;
end

else begin
count <= count + 13'b1;
clk1hz <= clk1hz;
end


end

endmodule