`timescale 1us / 1ns
module Wire_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //*Inputs
  reg  in_TB;

  //* Outputs
  wire out_TB;

  ////////////////////////////////////////////////////////
  ////////////////// initial block /////////////////////// 
  ////////////////////////////////////////////////////////


  initial begin
    //^ generating VCD file "value change dump"

    $dumpfile("Wire.vcd");
    $dumpvars(0, Wire_TB);

    ////////////////////////////////////////////////////////////////
    ///////////////////observing the wire output ///////////////////
    ////////////////////////////////////////////////////////////////

    $display("****************** one ******************");
    in_TB = 1;
    #Clock_PERIOD

      if (out_TB == 1) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end


    $display("****************** zero ******************");
    in_TB = 0;
    #Clock_PERIOD

      if (out_TB == 0) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

  end
  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  Wire DUT (

      //*Inputs
      .in(in_TB),

      //* Outputs
      .out(out_TB)
  );

endmodule