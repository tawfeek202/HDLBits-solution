module Vector2_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  //* Inputs
  reg  [31:0] in_TB;

  //*Outputs
  wire [31:0] out_TB;

  ////////////////////////////////////////////////////////
  ////////////////// initial block ///////////////////////
  ////////////////////////////////////////////////////////
  initial begin

    //^ generating VCD file "value change dump"
    $dumpfile("Vector2.vcd");
    $dumpvars(0, Vector2_TB);

    ////////////////////////////////////////////////////////
    ///////////////////////Test Cases///////////////////////
    ////////////////////////////////////////////////////////
    // todo AaaaaaaaBbbbbbbbCcccccccDddddddd => DdddddddCcccccccBbbbbbbbAaaaaaaa

    $display("****************** Test case 1 ******************");

    in_TB = 32'b10101010101010101010101010101010;  // Changed to 32 bits for a 32-bit input
    #Clock_PERIOD;

    if (out_TB[31:24] == in_TB[7:0] && 
        out_TB[23:16] == in_TB[15:8] && 
        out_TB[15:8] == in_TB[23:16] && 
        out_TB[7:0] == in_TB[31:24]) begin

      $display("Test case 1 succeeded");

    end else begin

      $display("Test case 1 failed");
      $display("Expected out_TB = %b, but got %b", {in_TB[7:0], in_TB[15:8], in_TB[23:16],
                                                    in_TB[31:24]}, out_TB);

    end

    $display("****************** Test case 2 ******************");

    in_TB = 32'b11110000111100001111000011110000;  // Test with another 32-bit pattern
    #Clock_PERIOD;

    if (out_TB[31:24] == in_TB[7:0] && 
        out_TB[23:16] == in_TB[15:8] && 
        out_TB[15:8] == in_TB[23:16] && 
        out_TB[7:0] == in_TB[31:24]) begin

      $display("Test case 2 succeeded");

    end else begin

      $display("Test case 2 failed");
      $display("Expected out_TB = %b, but got %b", {in_TB[7:0], in_TB[15:8], in_TB[23:16],
                                                    in_TB[31:24]}, out_TB);

    end

    #100 $stop;

  end

  ////////////////////////////////////////////////////////
  /////////////////// DUT Instantiation //////////////////
  ////////////////////////////////////////////////////////
  Vector2 DUT (
      //* Inputs
      .in(in_TB),

      //* Outputs
      .out(out_TB)
  );

endmodule


//! ===================================================================================
//! ===================================================================================
//! ===================================================================================
//! ===================================================================================
//another test bench 

module Vector2_TB ();

  /////////////////////////////////////////////////////////
  ///////////////////// Parameters ////////////////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  /////////////////////////////////////////////////////////
  //////////////////// DUT Signals ////////////////////////
  /////////////////////////////////////////////////////////
  reg  [31:0] in_TB;
  wire [31:0] out_TB;

  reg clk, reset;

  /////////////////////////////////////////////////////////
  /////////////////////// Clock ///////////////////////////
  /////////////////////////////////////////////////////////
  initial clk = 0;
  always #(Clock_PERIOD / 2) clk = ~clk;  // Generate clock signal

  /////////////////////////////////////////////////////////
  ///////////////////// Test Task /////////////////////////
  /////////////////////////////////////////////////////////
  task run_test(input [31:0] test_in, input [31:0] expected_out);
    begin
      in_TB = test_in;
      #Clock_PERIOD;

      if (out_TB === expected_out) begin
        $display("Test passed: input = %h, output = %h", test_in, out_TB);
      end else begin
        $display("Test failed: input = %h, expected output = %h, got output = %h", test_in,
                 expected_out, out_TB);
      end
    end
  endtask

  /////////////////////////////////////////////////////////
  /////////////////// Initial Block ///////////////////////
  /////////////////////////////////////////////////////////
  initial begin

    // VCD file generation
    $dumpfile("Vector2.vcd");
    $dumpvars(0, Vector2_TB);

    // Reset initialization
    reset = 1;
    #Clock_PERIOD;
    reset = 0;

    /////////////////////////////////////////////////////////
    /////////////////// Test Cases /////////////////////////
    /////////////////////////////////////////////////////////
    // Test case 1: Reversing A1B2C3D4 to D4C3B2A1
    run_test(32'hA1B2C3D4, 32'hD4C3B2A1);

    // Test case 2: Reversing F0E1D2C3 to C3D2E1F0
    run_test(32'hF0E1D2C3, 32'hC3D2E1F0);

    // Test case 3: All zeros
    run_test(32'h00000000, 32'h00000000);

    // Test case 4: All ones
    run_test(32'hFFFFFFFF, 32'hFFFFFFFF);

    // Test case 5: Alternating 1s and 0s (AA...)
    run_test(32'hAAAAAAAA, 32'hAAAAAAAA);

    // Test case 6: Alternating 0s and 1s (55...)
    run_test(32'h55555555, 32'h55555555);

    // Test case 7: Randomized inputs
    reg [31:0] random_in;
    integer i;
    for (i = 0; i < 5; i = i + 1) begin
      random_in = $random;
      run_test(random_in, {random_in[7:0], random_in[15:8], random_in[23:16], random_in[31:24]});
    end

    #100 $stop;

  end

  /////////////////////////////////////////////////////////
  ////////////////// DUT Instantiation ////////////////////
  /////////////////////////////////////////////////////////
  Vector2 DUT (
      .in (in_TB),
      .out(out_TB)
  );

endmodule
