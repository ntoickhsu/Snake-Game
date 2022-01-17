module three_bit_flip_flop(D,clk,Q,set,rst);

input clk,rst;

input [2:0]D,set;

output[2:0] Q;

D_Flip_Flop D1 (D[0],Q[0],rst,clk,set[0]);

D_Flip_Flop D2 (D[1],Q[1],rst,clk,set[1]);

D_Flip_Flop D3 (D[2],Q[2],rst,clk,set[2]);

endmodule