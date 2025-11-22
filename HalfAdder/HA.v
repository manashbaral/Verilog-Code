module Half-Adder( 
    input a, b,
    output cout, sum );

assign sum= a ^ b; //sum as XOR operation
assign cout=a & b; // carryout as AND operation

endmodule