/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/

`timescale 1ns / 1ps

module test();

    //inputs
    reg A;
    reg B;
    reg C;
    reg D;

    //outputs
    wire pre1_D; 
    wire pre1_E; 
    wire pre1_F; 
    wire f2;
    wire f3;
    
    //simulation of the required functions we implemented 
    pre1_d uut1 (A, B, C, D, pre1_D);
    pre1_e uut2 (A, B, C, D, pre1_E);
    pre1_f uut3 (A, B, C, D, pre1_F);
    F2     uut4 (A, B, C,    f2    );
    F3     uut5 (A, B, C,    f3    );
    
    // all of the differents states we considered for 2^n input 
    initial begin
        A = 0;   B = 0; C = 0;  D = 0;  #62.5;
        A = 0;   B = 0; C = 0;  D = 1;  #62.5;
        A = 0;   B = 0; C = 1;  D = 0;  #62.5;
        A = 0;   B = 0; C = 1;  D = 1;  #62.5;
        A = 0;   B = 1; C = 0;  D = 0;  #62.5;
        A = 0;   B = 1; C = 0;  D = 1;  #62.5;
        A = 0;   B = 1; C = 1;  D = 0;  #62.5;
        A = 0;   B = 1; C = 1;  D = 1;  #62.5;
        A = 1;   B = 0; C = 0;  D = 0;  #62.5;
        A = 1;   B = 0; C = 0;  D = 1;  #62.5;
        A = 1;   B = 0; C = 1;  D = 0;  #62.5;
        A = 1;   B = 0; C = 1;  D = 1;  #62.5;
        A = 1;   B = 1; C = 0;  D = 0;  #62.5;
        A = 1;   B = 1; C = 0;  D = 1;  #62.5;
        A = 1;   B = 1; C = 1;  D = 0;  #62.5;
        A = 1;   B = 1; C = 1;  D = 1;  #62.5;
    end    
endmodule
