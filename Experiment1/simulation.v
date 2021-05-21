`timescale 1ns / 1ps

module test();

    reg A;
    reg B;
    reg C;
    reg D;
    wire f1;
    wire f2;
    wire dual_of_f1;
    wire comp_f3;
    wire f4;
    
    F1          uut1  (A,B,f1);
    F2          uut2  (A,B,f2);
    dual_of_F1  uut3  (A,B,dual_of_f1);
    comp_F3     uut4  (A,B,C,comp_f3);
    F4          uut5  (A,B,C,D,f4);
 
    
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
