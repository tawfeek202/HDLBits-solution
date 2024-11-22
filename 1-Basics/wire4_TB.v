`timescale 1us / 1ns
module Wire4_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //*Inputs
  reg  a_TB;
  reg  b_TB;
  reg  c_TB;

  //* Outputs

  wire w_TB;
  wire x_TB;
  wire y_TB;
  wire z_TB;

  ////////////////////////////////////////////////////////
  ////////////////// initial block /////////////////////// 
  ////////////////////////////////////////////////////////


  initial begin
    //^ generating VCD file "value change dump"

    $dumpfile("Wire4.vcd");
    $dumpvars(0, Wire4_TB);

    ////////////////////////////////////////////////////////////////
    ///////////////////observing the wire output ///////////////////
    ////////////////////////////////////////////////////////////////

    $display("****************** testing w ******************");
    $display("****************** first case ******************");

    a_TB = 0;
    b_TB = 0;
    c_TB = 0;
    //note: w=a;
    #Clock_PERIOD

      if (w_TB == 0) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

    $display("****************** second case ******************");

    a_TB = 1;
    b_TB = 0;
    c_TB = 0;
    //note: w=a;
    #Clock_PERIOD

      if (w_TB == 1) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

    $display("****************** testing x and y ******************");
    $display("****************** first case ******************");

    a_TB = 0;
    b_TB = 0;
    c_TB = 0;
    //note: x = b and y = b;
    #Clock_PERIOD

      if (x_TB == 0) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

    if (y_TB == 0) begin

      $display("test case succedded");

    end else begin

      $display("test case failed");

    end


    $display("****************** second case ******************");

    a_TB = 0;
    b_TB = 1;
    c_TB = 0;
    //note: x = b and y = b;
    #Clock_PERIOD

      if (x_TB == 1) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

    if (y_TB == 1) begin

      $display("test case succedded");

    end else begin

      $display("test case failed");

    end

    $display("****************** testing z ******************");
    $display("****************** first case ******************");

    a_TB = 0;
    b_TB = 0;
    c_TB = 0;
    //note: z = c;
    #Clock_PERIOD

      if (z_TB == 0) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

    $display("****************** second case ******************");

    a_TB = 0;
    b_TB = 0;
    c_TB = 1;
    #Clock_PERIOD

      if (z_TB == 1) begin

        $display("test case succedded");

      end else begin

        $display("test case failed");

      end

  end
  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  Wire4 DUT (

      //*Inputs
      .a(a_TB),
      .b(b_TB),
      .c(c_TB),

      //* Outputs
      .w(w_TB),
      .x(x_TB),
      .y(y_TB),
      .z(z_TB)
  );

endmodule
