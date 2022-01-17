module control_signal_mux(select,in,out);
input select;
input [2:0] in;
output reg [2:0] out;

always@* begin
if(select == 1) begin 
out = in;
end else begin
out = 3'b111;
end



end
endmodule

//always@(select) begin
//if(select == 1) begin 
//out = in;
//end else begin
//out = 3'b111;
//end
//
//
//
//end
//endmodule

