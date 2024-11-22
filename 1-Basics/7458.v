module top_module (
    input  p1a,
    p1b,
    p1c,
    p1d,
    p1e,
    p1f,
    output p1y,
    input  p2a,
    p2b,
    p2c,
    p2d,
    output p2y
);
  wire x, y, z, l;
  assign x   = p2a & p2b;
  assign y   = p2c & p2d;
  assign p2y = x | y;  //p2y=(p2a & p2b )| (p2c & p2d);
  assign z   = p1c & p1a & p1b;
  assign l   = p1f & p1e & p1d;
  assign p1y = z | l;  //p1y= ( p1c & p1a & p1b) | (p1f & p1e & p1d)

endmodule

