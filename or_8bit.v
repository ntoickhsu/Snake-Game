module or_8bit(in1,in2,in3,in4,out);

input [7:0] in1,in2,in3,in4;

reg [7:0] hold;

output reg out;


always@(in1,in2,in3,in4) begin

hold = in1|in2|in3|in4;

out = hold[7:7]|hold[6:6]|hold[5:5]|hold[4:4]|hold[3:3]|hold[2:2]|hold[1:1]|hold[0:0];

end


endmodule

