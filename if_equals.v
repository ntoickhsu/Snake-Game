module if_equals(in1,in2,out);

output reg out;

input [2:0] in1;

input [2:0] in2;

always@(in1,in2) begin
if(in1 == in2) begin
out = 1;
end else begin
out = 0;
end
end

endmodule