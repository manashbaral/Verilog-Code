module D_flipflop_with_reset(
    input clk,
    input reset,
    input [7:0] d, // 8-bit data input
    output reg[7:0] out // 8-bit data output
);

always@(posedge clk) begin
    if(reset)
        out <=8'b0; // If reset is high, set output to 0
    else
        out <= d;
    end
endmodule