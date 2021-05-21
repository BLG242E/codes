`timescale 1ns / 1ps


module and_gate(
    input A,
    input B,
    output C
    );
    assign C = A & B;    
endmodule

module or_gate(
    input A,
    input B,
    output C
    );
    assign C = A | B;
endmodule

module not_gate(
    input A,
    output B
    );
    assign B = ~A;
endmodule

module F1(
    input wire a,
    input wire b,
    output wire c
    );
    wire var1;
    and_gate and1(a, b, var1);
    or_gate or1(a, var1, c);
endmodule

module F2(
    input wire a,
    input wire b,
    output wire c
    );
    wire var1, var2, var3;
    or_gate or1(a, b, var1);
    
    not_gate not1(b,var2);
    or_gate or2(a, var2, var3);
    
    and_gate and1(var1, var3, c);
endmodule

module dual_of_F1(
    input wire a,
    input wire b,
    output wire c
    );
    wire var1;
    or_gate or1(a, b, var1);
    and_gate and1(a, var1, c);
endmodule


module comp_F3(
    input wire a,
    input wire b,
    input wire c,
    output wire d
    );
    wire not_a, not_b, not_c, var1, var2;
    not_gate not1(a, not_a);
    not_gate not2(b,not_b);
    not_gate not3(c, not_c);
    
    or_gate or1(not_a, not_b, var1);
    or_gate or2(a, not_c, var2);
    
    and_gate and1(var1, var2, d);
endmodule

module F4(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire e
    );
    wire not_c, not_d, var1, var2;
    not_gate not1(c, not_c);
    not_gate not2(d,not_d);
    
    and_gate and1(not_c, d, var1);
    and_gate and2(c, not_d, var2);
    
    or_gate or1(var1, var2, e);
endmodule
