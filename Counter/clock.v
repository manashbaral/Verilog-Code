/*From a 1000 Hz clock, derive a 1 Hz signal, called OneHertz, that could be used to drive an Enable signal for a set of hour/minute/second counters to create a digital wall clock. Since we want the clock to count once per second, the OneHertz signal must be asserted for exactly one cycle each second. Build the frequency divider using modulo-10 (BCD) counters and as few other gates as possible. Also output the enable signals from each of the BCD counters you use (c_enable[0] for the fastest counter, c_enable[2] for the slowest).

The following BCD counter is provided for you. Enable must be high for the counter to run. Reset is synchronous and set high to force the counter to zero. All counters in your circuit must directly use the same 1000 Hz signal.
*/
module bcdcount (
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q
);



    // Counter enable logic
    assign c_enable[0] = 1'b1;         // Fastest counter always runs
    assign c_enable[1] = (Q0 == 4'd9); // Next counter increments every 10 cycles
    assign c_enable[2] = (Q1 == 4'd9); // Slowest increments every 100 cycles

    // One pulse per second when all 3 counters reach 9
    assign OneHertz = (Q0 == 4'd9) & (Q1 == 4'd9) & (Q2 == 4'd9);

    // Instantiate the 3 BCD counters (each ÷10)
    bcdcount counter0 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(Q0)
    );

    bcdcount counter1 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(Q1)
    );

    bcdcount counter2 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[2]),
        .Q(Q2)
    );

 always @(posedge clk) begin
        if (reset) begin
            Q0 <= 4'b0000;
            Q1 <= 4'b0000;
            Q2 <= 4'b0000;
        end
    end

endmodule
