module Wiredecl (
    input  a,
    input  b,
    input  c,
    input  d,


    output out,
    output out_n
);

  wire x;
  wire y;
  assign x = a & b;
  assign y = c & d;
  assign out = x | y;
  assign out_n = ~(x | y);


out = (a & b) | (c & d) ;
out_n = ~((a & b) | (c & d));
endmodule
