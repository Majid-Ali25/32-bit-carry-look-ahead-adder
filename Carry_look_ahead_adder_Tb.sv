
module Carry_look_ahead_adder_Tb;

  // Inputs
  logic [31:0] a;
  logic [31:0] b;
  logic cin;

  // Outputs
  logic [31:0] sum;
  logic cout;

  // DUT (Device Under Test) instance
  Carry_look_ahead_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Apply various test cases to verify the adder
    
    // Test case 1: Simple addition
    a <= 32'd10;
    b <= 32'd20;
    cin <= 0;
    #10;  

    
    $display("Test Case 1: Simple Addition");
    $display("a = %d, b = %d, cin = %b", a, b, cin);
    $display("sum = %d, cout = %b", sum, cout);

    // Test case 2: Addition with carry-in
    a <= 32'd9;
    b <= 32'd11;
    cin <= 1;
    #10;


    $display("Test Case 2: Addition with carry-in");
    $display("a = %d, b = %d, cin = %b", a, b, cin);
    $display("sum = %d, cout = %b", sum, cout);

    // Test case 3: Addition with overflow (positive)
    a <= 32'hFFFFFFF;
    b <= 32'h1;
    cin <= 0;
    #10;

   
    $display("Test Case 3: Addition with overflow (positive)");
    $display("a = %h, b = %h, cin = %b", a, b, cin);
    $display("sum = %h, cout = %b", sum, cout);

   
    a <= 32'hFFFFFFFF;
    b <= 32'hFFFFFFFF;
    cin <= 1;
    #10;


    $display("Test Case 4: Addition with overflow (negative)");
    $display("a = %h, b = %h, cin = %b", a, b, cin);
    $display("sum = %h, cout = %b", sum, cout);

  

    #10;
    $finish;
  end

endmodule
