//Create a 4-bit wide, 256-to-1 multiplexer. The 256 4-bit inputs are all packed into a single 1024-bit input vector.
 //sel=0 should select bits in[3:0],
 //sel=1 selects bits in[7:4], sel=2 selects bits in[11:8], etc.

 module mux256x4 (
    input  wire [1023:0] in,   // 256 words × 4 bits
    input  wire [7:0]    sel,  // selects 0–255
    output wire [3:0]    out   // selected 4-bit word
);

    // Select 4-bit chunk using variable part-select
    assign out = in[(sel*4) +: 4]; //(sel*4) +: 4 means: "Starting from bit (sel*4), take 4 bits upward."

endmodule
