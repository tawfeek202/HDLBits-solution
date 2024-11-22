module Vector4 (
    input  [ 7:0] in,
    output [31:0] out
);

  //syntax       {num{vector}}
  //Build a circuit that sign-extends an 8-bit number to 32 bits. This requires 
  //a concatenation of 24 copies of the sign bit (i.e., replicate bit[7] 24 times) followed by the 8-bit number itself.

  assign out = {{24{in[7]}}, in[7:0]};
endmodule
