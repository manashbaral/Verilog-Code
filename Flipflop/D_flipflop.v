/* A D flip-flop is a circuit that stores a bit and is updated periodically, at the (usually)
positive edge of a clock signal.*/

module D_flipflop(
    input clk,
    input d,
    output reg q
);

always @(posedge clk) begin
    q<=d;
end

endmodule