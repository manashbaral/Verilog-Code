/*Build a decade counter that counts from 0 through 9, inclusive, with a period of 10.
 The reset input is synchronous, and should reset the counter to 0.*/

 module decadeCounter(
    input clk,
    input reset,
    output reg [3:0] count      
 );

    always @(posedge clk) begin
        if (reset)
            count <= 4'b0000; // Synchronous reset to 0
        else if (count == 4'b1001)
            count <= 4'b0000; // Reset to 0 after reaching 9
        else
            count <= count + 1; // Increment count
    end
endmodule