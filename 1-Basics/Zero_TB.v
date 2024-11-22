`timescale 1us / 1ns
module ZERO_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////

  //* outputs
  wire zero_TB;

  ////////////////////////////////////////////////////////
  ////////////////// initial block /////////////////////// 
  ////////////////////////////////////////////////////////


  initial begin
    //^ generating VCD file "value change dump"

    $dumpfile("ZERO.vcd");
    $dumpvars(0, ZERO_TB);

    ////////////////////////////////////////////////////////////////
    ///////////////////observing the output is one ///////////////////
    ////////////////////////////////////////////////////////////////

    $display("****************** ZERO ******************");
    #Clock_PERIOD

      if (zero_TB == 0) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

  end
  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  ZERO DUT (
      //* Outputs
      .zero(zero_TB)
  );

endmodule