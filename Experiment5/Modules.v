/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/

`timescale 1ns / 1ps

module NAND_Gate(
    input wire A,
    input wire B,
    output wire O
    );
    assign O = ~(A & B);
endmodule

module NAND_Gate3(
    input wire A,
    input wire B,
    input wire C,
    output wire O
    );
    assign O = ~(A & B & C);
endmodule


module AND_Gate(
    input wire A,
    input wire B,
    output wire O
    );
    assign O = A & B;
endmodule

module OR_Gate(
    input wire A,
    input wire B,
    output wire O
    );
    assign O = A | B;
endmodule

module XOR_Gate(
    input wire A,
    input wire B,
    output wire O
    );
    assign O = (A & ~B) | (~A & B);
endmodule


module NOT_Gate( 
    input wire A,
    output wire B);
    assign B = ~A;
endmodule


module D_Latch(
    input wire D,
    input wire E,
    output wire Q,
    output wire Qn   
    );
    wire not_D, var1, var2;
    
    NAND_Gate nand0(D, D, not_D);
    
    NAND_Gate nand1(E, D, var1);
    NAND_Gate nand2(E, not_D, var2);
    
    NAND_Gate nand3(var1, Qn, Q);
    NAND_Gate nand4(var2, Q, Qn);
endmodule


module D_FlipFlop(
    input wire D,
    input wire C,
    output wire Q,
    output wire Qn     
    );
    wire Qm, not_Qm, not_C;
    
    NAND_Gate nand1(C, C, not_C);
    
    D_Latch d1(D, not_C, Qm, not_Qm);
    
    D_Latch d2(Qm, C, Q, Qn);
    
endmodule



module JK_FlipFlop(
    input wire J,
    input wire K,
    input wire C,
    output wire Q,
    output wire Qn
    );
    wire var1, var2;
    
    /* The other JK Flip Flop implementation
    
    NAND_Gate3 n0(J, C, Qn, var1);
    NAND_Gate3 n1(K, C, Q , var2);
    
    NAND_Gate n2(var1, Qn, Q);
    NAND_Gate n3(var2, Q, Qn);
    */
    wire not_K, and1, and2;
    wire not_Reset, var2, var3;
    
    NOT_Gate n1(K, not_K);
    
    AND_Gate a1(Qn, J, and1);
    AND_Gate a2(Q, not_K, and2);
    
    OR_Gate o1(and1, and2, or1);
    
    D_FlipFlop d(or1, C, Q, Qn);
endmodule


module T_FlipFlop(
    input wire T,
    input wire Reset,
    input wire C,
    output wire Q,
    output wire Qn
    );
    wire var1, var2, var3;
    wire Qm, Qm1;
    wire not_Reset;
    
    XOR_Gate x(T, Q, var1);
    D_FlipFlop jk(var1, C, Qm, Qm1);
    
    NOT_Gate n0(Reset, not_Reset);
    
    AND_Gate a1(Reset, 0, var2);
    AND_Gate a2(not_Reset, Qm, var3);
    
    OR_Gate o1(var2, var3, Q);
    NOT_Gate n1(Q, Qn);
       
endmodule


module part1(
    input wire A,
    input wire B,
    input wire Reset,
    input wire Clock,
    output wire Z,
    output wire Q0,
    output wire Q0n,
    output wire Q1,
    output wire Q1n
    );
    wire AnandB, AorB;
    wire J, K, T, and_last;
    
    NAND_Gate na1(A, B, AnandB);
    OR_Gate o1(A, B, AorB);
    
    OR_Gate o2(Q0, AnandB, J);
    OR_Gate o3(Q1n, AnandB, K);
    
    AND_Gate a(AorB, Q1n, T);
    
    JK_FlipFlop jk(J, K, Clock, Q0, Q0n);
    T_FlipFlop tt(T, Reset, Clock, Q1, Q1n);
    
    AND_Gate aa(AnandB, Q0n, and_last);
    OR_Gate o4(and_last, Q1n, Z);
    
endmodule

/*
module part1(
    input A,
    input B,
    input C,
    output Z
    );
    wire notA, notB;
    wire Q0, Q0n;
    wire Q1, Q1n;
    wire D0_Logic;
    wire D1_Logic;
    
    NOT_Gate n0(A, notA);
    NOT_Gate n1(B, notB);
    
    wire d, e, f, g, h, i;
    AND_Gate a0(notA, notB, d);
    AND_Gate a1(d, Q0n, e);
    AND_Gate a2(A, B, f);
    AND_Gate a3(Q1, Q0, g);
    AND_Gate a4(f, g, h);
    
    OR_Gate o1(d, e, i);
    
    OR_Gate o2(i, h, D0_Logic);
    
    D_FlipFlop d0(D0_Logic, C, Q0, Q0n);
    
    wire c;
    
    OR_Gate o3(A, B, c);
    OR_Gate o4(c, Q1, D1_Logic);
    
    D_FlipFlop d1(D1_Logic, C, Q1, Q1n);
    
    
    wire j;
    AND_Gate a5(notB, Q0n, j);
    wire k;
    AND_Gate a6(notA, Q0n, k);
    wire l;
    OR_Gate o5(j, k ,l);
    OR_Gate o6(l, Q1n, Z);
endmodule
*/




module part3(
    input wire [15:0] I,
    input wire load,
    input wire clock,
    input wire direction,
    input wire [2:0] value,
    input wire clear,
    output wire [15:0] Output
    );
    reg [15:0] O;
    
    assign Output = O;
    
    always @(posedge clock)
    begin
        if (clear == 0)
        begin
            O <= 16'b0;
        end
        else if (load == 0)
        begin
            O <= I;
        end
        else
        begin
            if (direction == 1)
            begin
                O <= O + value;
            end
            else
            begin
                O <= O - value;
            end
        end
    end
endmodule

