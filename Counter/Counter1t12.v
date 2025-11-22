/*Design a 1-12 counter with the following inputs and outputs:

Reset Synchronous active-high reset that forces the counter to 1
Enable Set high for the counter to run
Clk Positive edge-triggered clock input
Q[3:0] The output of the counter
c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit counter, so correct operation can be verified.*/

module Counter1t12(
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q,
    output reg c_enable,
    output reg c_load,
    output reg [3:0] c_d
);

    always @(posedge clk) begin
        if (reset) begin
            Q <= 4'b0001; // Synchronous reset to 1
        end else if (enable) begin
            if (Q == 4'b1100) begin // If Q reaches 12
                Q <= 4'b0001; // Reset to 1
            end else begin
                Q <= Q + 1; // Increment count
            end
        end
    end

    // Control signals for the provided 4-bit counter
    always @(*) begin
        c_enable = enable; // Enable signal mirrors the input enable
        if (reset) begin
            c_load = 1'b1; // Load signal active on reset
            c_d = 4'b0001; // Load value of 1 on reset
        end else begin
            c_load = 1'b0; // No load during normal operation
            c_d = 4'b0000; // Don't care value when not loading
        end
    end