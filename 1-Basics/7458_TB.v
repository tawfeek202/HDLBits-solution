`timescale 1us / 1ns
`include "7458.v"

module TB_7458 ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////
  parameter Clock_PERIOD = 10;


  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //*inputs
  reg  p1a;
  reg  p1b;
  reg  p1c;
  reg  p1d;
  reg  p1e;
  reg  p1f;
  //*output;
  wire p1y;  //ans: p1y= ( p1c & p1a & p1b) | (p1f & p1e & p1d)

  //*inputs;
  reg  p2a;
  reg  p2b;
  reg  p2c;
  reg  p2d;
  //*output;
  wire p2y;  //ans: p2y=(p2a & p2b )| (p2c & p2d);


  ////////////////////////////////////////////////////////
  ////////////////// initial block /////////////////////// 
  ////////////////////////////////////////////////////////


  initial begin
    //^ generating VCD file "value change dump"
    $dumpfile("TB_7458.vcd");
    $dumpvars;

    ////////////////////// testing p1y //////////////////////////
    $display("****************** Test case 1 for p1y***************");

    p1a = 1;
    p1b = 1;
    p1c = 1;
    p1d = 1;
    p1e = 1;
    p1f = 1;
    #Clock_PERIOD  //expect p1y =1;

      $display(
          "all inputs =1, output should =1 ; p1y = %b", p1y
      );  // to debug from the wave 

    #Clock_PERIOD
      if (p1y == 1) begin

        $display("test case 1 succedded");

      end else begin

        $display("test case 1 failed");

      end

    $display("****************** Test case 2 for p1y***************");


    p1a = 0;
    p1b = 1;
    p1c = 0;
    p1d = 1;
    p1e = 1;
    p1f = 1;
    #Clock_PERIOD  //expect p1y =1;

      if (p1y == 1) begin

        $display("test case 2 succedded");

      end else begin

        $display("test case 2 failed");

      end

    $display("****************** Test case 3 for p1y***************");

    p1a = 0;
    p1b = 1;
    p1c = 1;
    p1d = 1;
    p1e = 0;
    p1f = 1;
    #Clock_PERIOD  //expect p1y =1;

      if (p1y == 0) begin

        $display("test case 3 succedded");

      end else begin

        $display("test case 3 failed");

      end


    ////////////////////// testing p2y //////////////////////////

    $display("****************** Test case 1 for p2y***************");

    p2a = 1;
    p2b = 1;
    p2c = 1;
    p2d = 1;

    #Clock_PERIOD

      if (p2y == 1) begin

        $display("test case 1 succedded");

      end else begin

        $display("test case 1 failed");

      end

    $display("****************** Test case 2 for p2y***************");

    p2a = 1;
    p2b = 0;
    p2c = 1;
    p2d = 0;

    #Clock_PERIOD

      if (p2y == 0) begin

        $display("test case 2 succedded");

      end else begin

        $display("test case 2 failed");

      end


    #100 $stop;

  end


  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  top_module DUT0 (
      .p1a(p1a),
      .p1b(p1b),
      .p1c(p1c),
      .p1d(p1d),
      .p1e(p1e),
      .p1f(p1f),

      .p1y(p1y),

      .p2a(p2a),
      .p2b(p2b),
      .p2c(p2c),
      .p2d(p2d),

      .p2y(p2y)

  );

endmodule
