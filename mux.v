module mux(in1,in2,cntrl,out1);
input in1;
input in2;

input cntrl;

output reg out1;

always@* begin
if( cntrl == 0) begin
out1 = in2;
end else begin
out1 = in1;
end
end

endmodule