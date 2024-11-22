
`timescale 1ns / 1ps

module Vector4_TB;

  /////////////////////////////////////////////////////////
  ///////////////// Parameters and Variables //////////////
  /////////////////////////////////////////////////////////

  parameter Clock_PERIOD = 10;

  // Inputs to DUT (Device Under Test)

  reg [7:0] in_TB;


  // Outputs from DUT

  wire [31:0] out_TB;

  // Clock and reset
  reg clk;
  reg rst_n;  // not used in the real design

  /////////////////////////////////////////////////////////
  ////////////////// Clock Generation /////////////////////
  /////////////////////////////////////////////////////////
  always begin
    #(Clock_PERIOD / 2) clk = ~clk;  // Toggle clock every half period
  end

  /////////////////////////////////////////////////////////
  ///////////////////// Task Definitions //////////////////
  /////////////////////////////////////////////////////////

  //* Task to initialize inputs

  task initialize;
    begin
      in_TB = 8'b0;
      
      expected_concat = 32'b0;
    end
  endtask

  //* Task to apply test vectors

  task apply_test_vector(input [4:0] a, b, c, d, e, f);
    begin
      a_TB = a;
      b_TB = b;
      c_TB = c;
      d_TB = d;
      e_TB = e;
      f_TB = f;

      expected_concat = {a, b, c, d, e, f, 2'b11};  // Concatenate inputs with padding
      #Clock_PERIOD;  // Wait for the clock cycle
    end
  endtask

  //* Task to check outputs
  task check_output;
    begin
      if (w_TB !== expected_concat[31:24]) begin
        $display("Error: Mismatch in W. Expected: %h, Got: %h", expected_concat[31:24], w_TB);
      end else begin
        $display("W passed");
      end

      if (x_TB !== expected_concat[23:16]) begin
        $display("Error: Mismatch in X. Expected: %h, Got: %h", expected_concat[23:16], x_TB);
      end else begin
        $display("X passed");
      end

      if (y_TB !== expected_concat[15:8]) begin
        $display("Error: Mismatch in Y. Expected: %h, Got: %h", expected_concat[15:8], y_TB);
      end else begin
        $display("Y passed");
      end

      if (z_TB !== expected_concat[7:0]) begin
        $display("Error: Mismatch in Z. Expected: %h, Got: %h", expected_concat[7:0], z_TB);
      end else begin
        $display("Z passed");
      end
    end
  endtask

  /////////////////////////////////////////////////////////
  ////////////////// Initial Block (Testbench) ////////////
  /////////////////////////////////////////////////////////
  initial begin
    // Initialize signals
    clk   = 1'b0;
    rst_n = 1'b0;

    // Dump simulation data to file
    $dumpfile("Vector3.vcd");
    $dumpvars(0, Vector3_TB);

    // Reset DUT
    #5 rst_n = 1'b1;

    // Initialize inputs
    initialize;

    /////////////////////////////////////////////////////////
    /////////////////////// Test Cases /////////////////////
    /////////////////////////////////////////////////////////

    // Test case 1
    $display("****************** Test case 1 ******************");
    apply_test_vector(5'b00001, 5'b10000, 5'b11011, 5'b11010, 5'b11101, 5'b11111);
    check_output;

    // Test case 2
    $display("****************** Test case 2 ******************");
    apply_test_vector(5'b01010, 5'b01100, 5'b10011, 5'b10100, 5'b11100, 5'b11011);
    check_output;

    // Test case 3
    $display("****************** Test case 3 ******************");
    apply_test_vector(5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b11111);
    check_output;

    // Test case 4
    $display("****************** Test case 4 ******************");
    apply_test_vector(5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000);
    check_output;

    // End simulation
    #100 $finish;

  end

  /////////////////////////////////////////////////////////
  ////////////////// DUT Instantiation ////////////////////
  /////////////////////////////////////////////////////////
  Vector3 DUT (

      .a(a_TB),
      .b(b_TB),
      .c(c_TB),
      .d(d_TB),
      .e(e_TB),
      .f(f_TB),


      .w(w_TB),
      .x(x_TB),
      .y(y_TB),
      .z(z_TB)

  );

endmodule
