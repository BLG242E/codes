/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/

`timescale 1ns / 1ps


//and gate implemented that can AND 2 inputs
module and_gate_2input(
    input wire A,
    input wire B,
    output wire C
    );
    assign C = A & B;    
endmodule



//and gate implemented that can AND 3 inputs
module and_gate_3input(
    input wire A,
    input wire B,
    input wire C,
    output wire D
    );
    assign D = A & B & C;    
endmodule



//or gate implemented that can OR 2 inputs
module or_gate_2input(
    input wire A,
    input wire B,
    output wire C
    );
    assign C = A | B;
endmodule



//NOT gate implemented that can get the complement of an input
module not_gate(
    input wire A,
    output wire B
    );
    assign B = ~A;
endmodule



//XOR gate implemented that can XOR 16 inputs
module xor_gate_16_1input(
    input wire [15:0] A,
    input wire s,
    output wire [15:0] B
    );
    wire not_s;
    
    not_gate not1(s, not_s);
    
    assign B[0]  = (A[0] & not_s)  | (~A[0] & s);
    assign B[1]  = (A[1] & not_s)  | (~A[1] & s);
    assign B[2]  = (A[2] & not_s)  | (~A[2] & s);
    assign B[3]  = (A[3] & not_s)  | (~A[3] & s);
    assign B[4]  = (A[4] & not_s)  | (~A[4] & s);
    assign B[5]  = (A[5] & not_s)  | (~A[5] & s);
    assign B[6]  = (A[6] & not_s)  | (~A[6] & s);
    assign B[7]  = (A[7] & not_s)  | (~A[7] & s);
    assign B[8]  = (A[8] & not_s)  | (~A[8] & s);
    assign B[9]  = (A[9] & not_s)  | (~A[9] & s);
    assign B[10] = (A[10] & not_s) | (~A[10] & s);
    assign B[11] = (A[11] & not_s) | (~A[11] & s);
    assign B[12] = (A[12] & not_s) | (~A[12] & s);
    assign B[13] = (A[13] & not_s) | (~A[13] & s);
    assign B[14] = (A[14] & not_s) | (~A[14] & s);
    assign B[15] = (A[15] & not_s) | (~A[15] & s);
endmodule



//XOR gate implemented that can XOR 2 inputs
module xor_gate_2input(
    input wire A,
    input wire B,
    output wire C
    );
    wire not_A, not_B;
    
    not_gate not0(A, not_A);
    not_gate not1(B, not_B);
    
    assign C = (A & not_B) | (not_A & B);    
endmodule



//1-Bit Half Adder implemented that can 
//get 2 input value, 1 Output and 1 Carry Output
module half_adder_1bit(
    input wire A,
    input wire B,
    output wire s,
    output wire Cout
    );
    xor_gate_2input output1(A, B, s);
    and_gate_2input output2(A, B, Cout);
endmodule



//1-Bit Full Adder implemented that can get 
//2 input values, 1 Carry Input, 1 1-bit Output and 1 Carry Output
// using with 1-Bit Half Adder
module full_adder_1bit(
    input wire A,
    input wire B,
    input wire Cin,
    output wire s,
    output wire Cout
    );

    wire c1, c2, s1;
    half_adder_1bit ha1(A, B, s1, c1);
    half_adder_1bit ha2(s1, Cin, s, c2);

    or_gate_2input or1(c1, c2, Cout);
endmodule



//4-Bit Full Adder implemented that can 
//get 2 input values, 1 Carry Input, 1 4-bit Output and 1 Carry Output
// using with 1-Bit Full Adder
module full_adder_4bit(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] s,
    output wire Cout
    );

    wire c1, c2, c3;
    
    full_adder_1bit fa0(A[0], B[0], Cin, s[0], c1);
    full_adder_1bit fa1(A[1], B[1], c1 , s[1], c2);
    full_adder_1bit fa2(A[2], B[2], c2 , s[2],  c3);
    full_adder_1bit fa3(A[3], B[3], c3 , s[3],  Cout);
endmodule



// 16-Bit Full Adder implemented that can get 
// 2 input values, 1 Carry Input, 1 16-bit Output and 1 Carry Output
// using with 4-Bit Full Adder
module full_adder_16bit(
    input wire [15:0] A,
    input wire [15:0] B,
    input wire Cin,
    output wire [15:0] s,
    output wire Cout
    );

    wire c1, c2, c3;
    
    full_adder_4bit fa0(A[3:0]  , B[3:0]  , Cin, s[3:0],    c1  );
    full_adder_4bit fa1(A[7:4]  , B[7:4]  , c1 , s[7:4],    c2  );
    full_adder_4bit fa2(A[11:8] , B[11:8] , c2 , s[11:8],   c3  );
    full_adder_4bit fa3(A[15:12], B[15:12], c3 , s[15:12],  Cout);
endmodule



// 16-Bit Full Adder-Subtractor implemented that can get 
// 2 16-Bit input values, 1 signed-unsigned and 
// 1 addition-subtarction selector,
// 1 Carry Input, 1 16-bit Output and 1 Carry Output
// using with 16-Bit Full Adder
module full_adder_subtractor_16bit(
    input wire [15:0] A,
    input wire [15:0] B,
    input wire sub,
    input wire s,
    output wire [15:0] Output,
    output wire Carry,
    output wire Overflow,
    output wire Borrow
    );
    
    wire [15:0] c;
    wire cout;
    
    xor_gate_16_1input xor0(B[15:0]  , sub, c[15:0]);
    
    //Output Calculation
    full_adder_16bit FA(A, c, sub, Output, Cout);
    
    //Overflow  checking
    wire sub_not;
    wire xor1, xor1_not, xor2, xor3, xor3_not;
    wire and1, and2, and3;
    wire or1;
    
    xor_gate_2input xorf1(A[15], B[15]     , xor1);
    xor_gate_2input xorf2(A[15], Output[15], xor2);
    xor_gate_2input xorf3(B[15], Output[15], xor3);
    
    not_gate not1(xor1, xor1_not);
    not_gate not2(xor3, xor3_not);
    not_gate not3(sub, sub_not);
    
    and_gate_3input andf1(xor1_not, sub_not, xor2, and1);
    and_gate_3input andf2(xor1    , sub    , xor3_not, and2);
    
    or_gate_2input  orf1 (and1, and2, or1);
    and_gate_2input andf3(s, or1, Overflow);
    
    //Borrow  checking
    wire s_not, Cout_not;
    
    not_gate not4(s, s_not);
    not_gate not5(Cout, Cout_not);
    
    and_gate_3input andf4(s_not, sub, Cout_not, Borrow);
    
    //Carry Checking
    and_gate_2input andf5(s_not, Cout, Carry);
endmodule



// 3A - 2B implemented that can get 
// 2 16-bit input values, 1 16-bit Output
// using with 16-Bit Full Adder Subtractor
module threeA_minus_twoB(
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [15:0] Output
    );
    wire [15:0] twoA;
    wire [15:0] threeA;
    wire [15:0] twoB;
    
    wire Carry, Overflow, Borrow;
    wire firstCout, secondCout, thirdCout ;
    
    full_adder_16bit fa1(A   , A,  0, twoA  , firstCout);
    full_adder_16bit fa2(twoA, A,  0, threeA, secondCout);
    full_adder_16bit fa3(B   , B,  0, twoB  , thirdCout);
    
    full_adder_subtractor_16bit fad_sub0
            (A, A, 0, 0, twoA, Carry, Overflow, Borrow);                            
    
    full_adder_subtractor_16bit fad_sub1
            (A, twoA, 0, 0, threeA, Carry, Overflow, Borrow);
    
    full_adder_subtractor_16bit fad_sub2
            (B, B, 0, 0, twoB, Carry, Overflow, Borrow);
    
    full_adder_subtractor_16bit fad_sub3
            (threeA, twoB, 1, 0, Output, Carry, Overflow, Borrow);
endmodule