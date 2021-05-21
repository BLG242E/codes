/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/


`timescale 1ns / 1ps

module test();
    /* SR Latch withoutEnable FlipFlop
    reg S, R;
    wire Q, Qn;
    
    SR_Latch_withoutEnable  uut0(S , R , Q, Qn);
    
    initial begin
        S = 0; R = 0;  #100;
        S = 0; R = 1;  #100;
        S = 1; R = 0;  #100;
        S = 1; R = 1;  #100;
        S = 0; R = 0;  #100;
        S = 0; R = 1;  #100;
        S = 1; R = 0;  #100;
        S = 1; R = 1;  #100;
        S = 0; R = 0;  #100;
        S = 0; R = 1;  #100;
    end
    */

    /* SR Latch withEnable FlipFlop
    reg S, R, E;
    wire Q, Qn;
    
    SR_Latch_withEnable  uut0(S , R, E , Q, Qn);
    
    initial begin
        S = 0; R = 0;  E = 0; #50;
        S = 0; R = 1;  E = 0; #50;
        S = 1; R = 0;  E = 0; #50;
        S = 1; R = 1;  E = 0; #50;
        S = 0; R = 0;  E = 0; #50;
        S = 0; R = 1;  E = 0; #50;
        S = 1; R = 0;  E = 0; #50;
        S = 1; R = 1;  E = 0; #50;
        S = 0; R = 0;  E = 0; #50;
        S = 0; R = 1;  E = 0; #50;
        S = 0; R = 0;  E = 1; #50;
        S = 0; R = 1;  E = 1; #50;
        S = 1; R = 0;  E = 1; #50;
        S = 1; R = 1;  E = 1; #50;
        S = 0; R = 0;  E = 1; #50;
        S = 0; R = 1;  E = 1; #50;
        S = 1; R = 0;  E = 1; #50;
        S = 1; R = 1;  E = 1; #50;
        S = 0; R = 0;  E = 1; #50;
        S = 0; R = 1;  E = 1; #50;
    end
    */
    
    /* D Latch
    reg A, E;
    wire Q, Qn;
    
    D_Latch  uut0(A , E , Q, Qn);
    
    initial begin
        A = 0; E = 0;  #100;
        A = 0; E = 1;  #100;
        A = 1; E = 0;  #100;
        A = 1; E = 1;  #100;
        A = 0; E = 0;  #100;
        A = 0; E = 1;  #100;
        A = 1; E = 0;  #100;
        A = 1; E = 1;  #100;
        A = 0; E = 0;  #100;
        A = 0; E = 1;  #100;
    end
    */
    
    

    /* D FlipFlop
    reg A, Clock;
    wire Q, Qn;
    
    D_FlipFlop  uut0(A , Clock , Q, Qn);
    
    initial begin
        A = 0; Clock = 0;  #100;
        A = 0; Clock = 1;  #100;
        A = 1; Clock = 0;  #100;
        A = 1; Clock = 1;  #100;
        A = 0; Clock = 0;  #100;
        A = 0; Clock = 1;  #100;
        A = 1; Clock = 0;  #100;
        A = 1; Clock = 1;  #100;
        A = 0; Clock = 0;  #100;
        A = 0; Clock = 1;  #100;
    end
    */
    
    
    /**/
    
    reg [15:0] I;
    reg clock, load;
    wire shift_out;
    shift_register_16 uut(I, clock, load, shift_out);
    
    
    
    /* 1/2 frequency
    initial begin
        I = 16'b1010101010101010;   load = 1; clock = 0; #40;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #40; // Toggle clock signal
    end
    */
    
    /* 1/4 frequency
    initial begin
        I = 16'b1100110011001100;   load = 1; clock = 0; #40;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #40; // Toggle clock signal
    end
    */
   
    /* 1/8 frequency
    initial begin
        I = 16'b1111000011110000;   load = 1; clock = 0; #40;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #40; // Toggle clock signal
    end
    */

    /* 1/7 pulse-gap duration*/
    initial begin
        I = 16'b1000000010000000;   load = 1; clock = 0; #20;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #20; // Toggle clock signal
    end
    


    /* 1/15 pulse-gap duration
    initial begin
        I = 16'b1000000000000000;   load = 1; clock = 0; #20;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #20; // Toggle clock signal
    end
    */


    /* 3/13 pulse-gap duration
    initial begin
        I = 16'b1110000000000000;   load = 1; clock = 0; #20;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #20; // Toggle clock signal
    end
    */
    
    
    /* 11/5 pulse-gap duration
    initial begin
        I = 16'b1111111111100000;   load = 1; clock = 0; #20;
        load = 0; #1000;
    end
    always begin
        clock = ~clock ; #20; // Toggle clock signal
    end
    */
endmodule
