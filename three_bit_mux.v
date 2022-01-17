module three_bit_mux(in1,in2,cntrl,out1);
input [2:0] in1;
input [2:0] in2;

input cntrl;

output reg [2:0] out1;

always@(in1,in2,cntrl) begin
if( cntrl == 0) begin
out1 = in2;
end else begin
out1 = in1;
end
end

endmodule