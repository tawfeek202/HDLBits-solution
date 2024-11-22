`timescale 1us / 1ns
module NOT_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //* inputs
  reg  in_TB;

  //* outputs
  wire out_TB;

  ////////////////////////////////////////////////////////
  ////////////////// initial block /////////////////////// 
  ////////////////////////////////////////////////////////


  initial begin
    //^ generating VCD file "value change dump"

    $dumpfile("NOT.vcd");
    $dumpvars(0, NOT_TB);

    ////////////////////////////////////////////////////////////////
    ///////////////////NOT Gate with 2 scenarios ///////////////////
    ////////////////////////////////////////////////////////////////

    $display("****************** Test case 1***************");
    in_TB = 0;
    #Clock_PERIOD

      if (out_TB == 1) begin

        $display("test case 1 succedded");

      end else begin

        $display("test case 1 failed");

      end

    $display("****************** Test case 2***************");
    in_TB = 1;
    #Clock_PERIOD

      if (out_TB == 0) begin

        $display("test case 2 succedded");

      end else begin

        $display("test case 2 failed");

      end
  end
  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  NOT DUT (

      //* Inputs
      .in(in_TB),

      //* Outputs
      .out(out_TB)
  );

endmodule