`timescale 1us / 1ns
module XNOR_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //* inputs
  reg a_TB, b_TB;


  //* outputs
  wire out_TB;


  ////////////////////////////////////////////////////////
  ////////////////// initial block /////////////////////// 
  ////////////////////////////////////////////////////////


  initial begin
    //^ generating VCD file "value change dump"

    $dumpfile("XNOR.vcd");
    $dumpvars(0, XNOR_TB);

    ////////////////////////////////////////////////////////////////
    /////////////////// XNOR Gate with 4 scenarios //////////////////
    ////////////////////////////////////////////////////////////////

    $display("****************** Test case 1***************");
    a_TB = 0;
    b_TB = 0;
    #Clock_PERIOD

      if (out_TB == 1) begin

        $display("test case 1 succedded");

      end else begin

        $display("test case 1 failed");

      end

    $display("****************** Test case 2***************");

    a_TB = 1;
    b_TB = 0;
    #Clock_PERIOD


      if (out_TB == 0) begin

        $display("test case 2 succedded");

      end else begin

        $display("test case 2 failed");

      end

    $display("****************** Test case 3***************");

    a_TB = 0;
    b_TB = 1;
    #Clock_PERIOD


      if (out_TB == 0) begin

        $display("test case 3 succedded");

      end else begin

        $display("test case 3 failed");

      end


    $display("****************** Test case 4***************");

    a_TB = 1;
    b_TB = 1;
    #Clock_PERIOD


      if (out_TB == 1) begin

        $display("test case 4 succedded");

      end else begin

        $display("test case 4 failed");

      end

    #100 $stop;

  end

  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  XNOR DUT (

      //* Inputs
      .a(a_TB),
      .b(b_TB),


      //* Outputs
      .out(out_TB)
  );
endmodule
