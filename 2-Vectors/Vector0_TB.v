module Vector0_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //* Inputs
  reg [2:0] vec_TB;  //3 bits

  //*Outputs
  wire [2:0] outv_TB;
  wire o2_TB;
  wire o1_TB;
  wire o0_TB;


  ////////////////////////////////////////////////////////
  ////////////////// initial block ///////////////////////
  ////////////////////////////////////////////////////////
  initial begin

    //^ generating VCD file "value change dump"
    $dumpfile("Vector0.vcd");
    $dumpvars(0, Vector0_TB);

    ////////////////////////////////////////////////////////
    ///////////////////////Test Cases///////////////////////
    ////////////////////////////////////////////////////////

    $display("****************** Test case 1 ******************");

    vec_TB = 3'b101;
    #Clock_PERIOD

      if (outv_TB == vec_TB) begin

        $display("Test case 1 succedded");

      end else begin

        $display("Test case 1 failed");

      end

    $display("****************** Test case 2 ******************");

    vec_TB = 3'b101;
    #Clock_PERIOD

      if (o2_TB == vec_TB[2]) begin

        $display("Test case 2 succedded");

      end else begin

        $display("Test case 2 failed");

      end


    $display("****************** Test case 3 ******************");

    vec_TB = 3'b101;
    #Clock_PERIOD

      if (o1_TB == vec_TB[1]) begin

        $display("Test case 3 succedded");

      end else begin

        $display("Test case 3 failed");

      end

    $display("****************** Test case 4 ******************");

    vec_TB = 3'b101;
    #Clock_PERIOD

      if (o0_TB == vec_TB[0]) begin

        $display("Test case 4 succedded");

      end else begin

        $display("Test case 4 failed");

      end

    #100 $stop;

  end


  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantation ///////////////////
  ////////////////////////////////////////////////////////
  Vector0 DUT (

      //* Inputs
      .vec(vec_TB),

      //* Outputs
      .outv(outv_TB),
      .o2  (o2_TB),
      .o1  (o1_TB),
      .o0  (o0_TB)

  );

endmodule
