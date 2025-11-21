//Create a 1-bit wide, 256-to-1 multiplexer. The 256 inputs are all packed into a single 256-bit input vector. 
// sel=0 should select in[0],
// sel=1 selects bits in[1], sel=2 selects bits in[2], etc.

module mux256to1 (
    input  wire [255:0] in,   // 256-bit input vector
    input  wire [7:0]   sel,  // 8-bit select line (0–255)
    output wire         out   // 1-bit output
);

    assign out = in[sel];     // Select the bit at position sel

endmodule
