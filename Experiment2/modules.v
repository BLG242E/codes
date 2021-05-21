/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/


`timescale 1ns / 1ps

//and gate implemented that can AND 2 inputs
module and_gate_2input(
    input A,
    input B,
    output C
    );
    assign C = A & B;    
endmodule


//and gate implemented that can AND 2 inputs
module and_gate_3input(
    input A,
    input B,
    input C,
    output D
    );
    assign D = A & B & C;    
endmodule


//and gate implemented that can AND 4 inputs
module and_gate_4input(
    input A,
    input B,
    input C,
    input D,    
    output E
    );
    assign E = A & B & C & D;    
endmodule


//or gate implemented that can OR 2 inputs
module or_gate_2input(
    input A,
    input B,
    output C
    );
    assign C = A | B;
endmodule


//OR gate implemented that can OR 3 inputs
module or_gate_3input(
    input A,
    input B,
    input C,
    output D
    );
    assign D = A | B | C;
endmodule


//OR gate implemented that can OR 8 inputs
module or_gate_8input(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    input H,    
    output I
    );
    assign I = A | B | C | D | E | F | G | H;
endmodule


//NOT gate implemented that can get the complement of an input
module not_gate(
    input A,
    output B
    );
    assign B = ~A;
endmodule


//nand gate implemented that can NAND 2 inputs
module nand_gate(
    input A,
    input B,
    output C
    );
    wire not_C;
    
    and_gate_2input and0(A, B, not_C); //since nand gate is basically complement of and operation,
    not_gate not0(not_C, C); //we first apply AND operation to inputs and then get its complement
    
endmodule


//multiplexer implemented that gets 8 inputs and 3 selectors
module multiplexer_8input(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    input H,
    input s0, //selector 1
    input s1, //selector 2
    input s2, //selector 3
    output O
    );
    wire not_s0, not_s1, not_s2; 
    wire OA, OB, OC, OD, OE, OF, OG, OH;
    
    not_gate not0(s0, not_s0); // complement of selector 1
    not_gate not1(s1, not_s1); // complement of selector 2
    not_gate not2(s2, not_s2); // complement of selector 3

                                                       // selector combinations 
                                                       //that generates 1 inputs 
                                                       //are as following:
    and_gate_4input o0(not_s0, not_s1, not_s2, A, OA); // 000
    and_gate_4input o1(s0    , not_s1, not_s2, B, OB); // 001
    and_gate_4input o2(not_s0, s1    , not_s2, C, OC); // 010
    and_gate_4input o3(s0    , s1    , not_s2, D, OD); // 011
    and_gate_4input o4(not_s0, not_s1, s2    , E, OE); // 100
    and_gate_4input o5(s0    , not_s1, s2    , F, OF); // 101
    and_gate_4input o6(not_s0, s1    , s2    , G, OG); // 110
    and_gate_4input o7(s0    , s1    , s2    , H, OH); // 111
    
    or_gate_8input or0(OA, OB, OC, OD, OE, OF, OG, OH, O);
endmodule


//decoder implemented that gets 3 inputs
module decoder_3input(
    input s0,
    input s1,
    input s2,
    output O0,
    output O1,
    output O2,
    output O3,
    output O4,
    output O5,
    output O6,
    output O7
    );
    wire not_s0, not_s1, not_s2;
    
    not_gate not0(s0, not_s0);
    not_gate not1(s1, not_s1);
    not_gate not2(s2, not_s2);
                                                      // input combinations 
                                                      //that generates 1 outouts 
                                                      //are as following:
    and_gate_3input and0(not_s0, not_s1, not_s2, O0); // 000
    and_gate_3input and1(not_s0, not_s1, s2    , O1); // 001
    and_gate_3input and2(not_s0, s1    , not_s2, O2); // 010
    and_gate_3input and3(not_s0, s1    , s2    , O3); // 011
    and_gate_3input and4(s0    , not_s1, not_s2, O4); // 100
    and_gate_3input and5(s0    , not_s1, s2    , O5); // 101
    and_gate_3input and6(s0    , s1    , not_s2, O6); // 110
    and_gate_3input and7(s0    , s1    , s2    , O7); // 111
endmodule


// This part is the implementation of preliminary part1-d
// and the expression for that is A'.B' + A.D' + B.C'.D
module pre1_d(
    input A,
    input B,
    input C,
    input D,
    output E
    );
    wire var1, var2, var3;
    wire not_A, not_B, not_C, notD; 
    
    not_gate not0(A, not_A); // getting the complement of A
    not_gate not1(B, not_B); // getting the complement of B
    not_gate not2(C, not_C); // getting the complement of C
    not_gate not3(D, not_D); // getting the complement of D
    
    and_gate_2input and1(not_A, not_B, var1); // A'.B' obtained, by using 2-input AND gate
    and_gate_2input and2(A    , not_D, var2); // A.D' obtained, by using 2-input AND gate
    and_gate_3input and3(B, not_C, D,  var3); // B.C'.D obtained, by using 3-input AND gate
    
    or_gate_3input or1(var1, var2, var3, E); // A'.B' + A.D' + B.C'.D obtained, by using 3-input OR gate
endmodule


// This part is the implementation of preliminary part1-e
// the expression for that is same with the one above but 
// the restriction is using only 2-INPUT NAND gates
module pre1_e(
    input A,
    input B,
    input C,
    input D,
    output E    
    );
    wire var1, var2, var3, var4, var5, var6, var7;
    wire not_A, not_B, not_C, notD;
    
    //please look at the circuit diagrams to understand left/right subtrees 
    //and concatenating them to the root using only nand gates
    
    nand_gate nand0(A, A, not_A);
    nand_gate nand1(B, B, not_B);
    nand_gate nand2(C, C, not_C);
    nand_gate nand3(D, D, not_D);
    
    //left subtree of the diagram
    nand_gate nand4(D, B, var1);
    nand_gate nand5(var1, var1, var2);
    nand_gate nand6(var2, not_C, var3);
    
    //right subtree of the diagram
    nand_gate nand7(not_A, not_B, var4);
    nand_gate nand8(A, not_D, var5);
    nand_gate nand9(var4, var5, var6);
    nand_gate nand10(var6, var6, var7);

    //left       right
    //    \     /
    //      NAND 
    //       ||
    //      root:

    nand_gate nand11(var7, var3, E);

endmodule


// This part is the implementation of preliminary part1-f
// the expression for that is same with the one above but 
// the restriction is using a multiplexer and not gates
module pre1_f(
    input A,
    input B,
    input C,
    input D,
    output E
    );
    wire not_A, not_D;

    not_gate not1(A, not_A);
    not_gate not2(D, not_D);

    multiplexer_8input mux(not_A, C, D, A, not_D, not_D, B, not_D, C, B, A, E); 
    
endmodule


// This part is the implementation of the expression = A.B.C' + A'.C
// by using a decoder and 2-input or gates
module F2(
    input A,
    input B,
    input C,
    output D
    );
    wire var0, var1, var2, var3, var4, var5, var6, var7;
    wire or_output;
    decoder_3input decoder(A, B, C, var0, var1, var2, var3, var4, var5, var6, var7);
    
    or_gate_2input or1(var1, var3, or_output);
    or_gate_2input or2(or_output, var6, D);
endmodule


// This part is the implementation of the expression = A.B'.C' + B.C
// by using a decoder and 2-input or gates
module F3(
    input A,
    input B,
    input C,
    output D
    );
    wire var0, var1, var2, var3, var4, var5, var6, var7;
    wire or_output;
    decoder_3input decoder(A, B, C, var0, var1, var2, var3, var4, var5, var6, var7);
    
    or_gate_2input or1(var3, var7, or_output);
    or_gate_2input or2(or_output, var4, D);    
endmodule