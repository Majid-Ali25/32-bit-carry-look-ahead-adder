module carry_look_ahead_adder (
  input logic [31:0] a,
  input logic [31:0] b,
  input logic cin,
  output logic [31:0] sum,
  output logic cout
);

  // Propagate (P) and generate (G) signals for each bit position
  logic [31:0] P, G;
  assign P = a ^ b;
  assign G = a & b;

  // Generate carry signals (C) based on propagate and generate
  logic [31:0] C;

  // Generate block to calculate carry signals
  genvar i;
  generate
    for (i = 1; i < 32; i++) begin // Using 32 to include C[31]
      assign C[i] = G[i] | (P[i] & C[i-1]);
    end
  endgenerate

  // Initial carry in
  assign C[0] = cin;

  // Sum based on carry and inputs
  assign sum = P ^ C;

  // Output carry is the carry out of the most significant bit
  assign cout = C[31];

endmodule

