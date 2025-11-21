// 1-bit MUX using always block

module MUX(
    input a,b,sel,
    output out
);

always @(a,b,sel) // execute this block if any change occurs in a,b or sel
    begin
        if(sel)
            out=a;
        else
            out=b;
    end