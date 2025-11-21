//1 bit 2x1 MUX using Ternary Operator

module MUX( 
    input a, b, sel,
    output out ); 

    	assign out= sel ? b: a; //select a if sel=0 else b
endmodule