/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/

`timescale 1ns / 1ps


module test();

    /* Simulation for part 1
    reg A, B, C;
    reg Reset;
    wire Z, Q0, Q0n, Q1, Q1n;// Zn; Zn;

    part1 uut(A, B, Reset, C, Z, Q0, Q0n, Q1, Q1n);
    
    //JK_FlipFlop uut(A, B, C, Z);
    
    initial begin
        A = 0; B = 1; C = 0; Reset = 1; #50;
        A = 0; B = 1; C = 1; Reset = 1; #50;
        A = 1; B = 1; C = 0; Reset = 0; #50;
        A = 1; B = 1; C = 1; Reset = 0; #50;
        A = 1; B = 0; C = 0; Reset = 0; #50;
        A = 1; B = 0; C = 1; Reset = 0; #50;
        A = 0; B = 0; C = 0; Reset = 0; #50;
        A = 0; B = 0; C = 1; Reset = 0; #50;
        A = 1; B = 1; C = 0; Reset = 1; #50;
        A = 1; B = 1; C = 1; Reset = 0; #50;
        A = 0; B = 0; C = 0; Reset = 0; #50;
        A = 0; B = 0; C = 1; Reset = 0; #50;
        A = 0; B = 1; C = 0; Reset = 0; #50;
        A = 0; B = 1; C = 1; Reset = 0; #50;
        A = 1; B = 0; C = 0; Reset = 0; #50;
        A = 1; B = 0; C = 1; Reset = 0; #50;
    end
    */
    
    
    
    /* General Code for Part4 
    reg [15:0] I;
    reg load, clock, direction, clear;
    reg [2:0] value;
    wire [15:0] O;
    
    part3 uut(I, load, clock, direction, value, clear, O);
    */
   
   
    /*   0 to 40 in circular way with increment value 2
    initial begin
        I = 16'd0; load = 0;  direction = 1;   value = 3'd2; clock = 0; clear = 1; #6;
        load = 1;        
    end
    always begin
        
        clock = ~clock; #5;
        if (O >= 16'd40)
        begin 
            clear = 0; #5;
        end
        else
        begin 
            clear = 1; #5;
        end
        
    end
    */
     
     /*   350 to 371 in circular way with increment value 3 
    initial begin
        I = 16'd350; load = 0;  direction = 1;   value = 3'd3; clock = 0; clear = 1; #11;
        load = 1;        
    end
    always begin
        
        clock = ~clock; #10;
        
        if (O >= 16'd371)
        begin 
            load = 0; 
            I = 16'd350; #10;
        end
        else
        begin 
            load = 1; #10;
        end
        
    end
    */   
      
   /*   93 to 5 in circular way with decrement value 4 
    initial begin
        I = 16'd93; load = 0;  direction = 0;   value = 3'd4; clock = 0; clear = 1; #6;
        load = 1;        
    end
    always begin
        
        clock = ~clock; #5;
        
        if (O <= 16'd5)
        begin 
            load = 0; 
            I = 16'd93; #5;
        end
        else
        begin 
            load = 1; #5;
        end
        
    end
    */

     /*    22525 to 22535 in circular way with increment value 1
    initial begin
        I = 16'd22525; load = 0;  direction = 1;   value = 3'd1; clock = 0; clear = 1; #16;
        load = 1;        
    end
    always begin
        
        clock = ~clock; #15;
        
        if (O >= 16'd22535)
        begin 
            load = 0; 
            I = 16'd22525; #15;
        end
        else
        begin 
            load = 1; #15;
        end
        
    end
    */


endmodule



