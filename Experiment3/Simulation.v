/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/

`timescale 1ns / 1ps

module test();
    /*
    //  Half Adder Simulation
    reg A_1bit, B_1bit;
    wire Half_Adder, Cout_HA;
    half_adder_1bit  uut0(A_1bit , B_1bit , Half_Adder, Cout_HA);
    
    initial begin
        A_1bit = 0;   B_1bit = 0; #250;
        A_1bit = 0;   B_1bit = 1; #250;
        A_1bit = 1;   B_1bit = 0; #250;
        A_1bit = 1;   B_1bit = 1; #250;
    end
    */
    
    /*
    //  1-Bit Full Adder Simulation
    reg A_1bit, B_1bit, Cin;
    wire Full_Adder, Cout_FA_1Bit;
    full_adder_1bit  uut(A_1bit, B_1bit, Cin, Full_Adder, Cout_FA_1Bit);
    
    initial begin
        A_1bit = 0;   B_1bit = 0;  Cin = 0;  #125;
        A_1bit = 0;   B_1bit = 0;  Cin = 1;  #125;
        A_1bit = 0;   B_1bit = 1;  Cin = 0;  #125;
        A_1bit = 0;   B_1bit = 1;  Cin = 1;  #125;
        A_1bit = 1;   B_1bit = 0;  Cin = 0;  #125;
        A_1bit = 1;   B_1bit = 0;  Cin = 1;  #125;
        A_1bit = 1;   B_1bit = 1;  Cin = 0;  #125;
        A_1bit = 1;   B_1bit = 1;  Cin = 1;  #125;
    end
    */
    
    /*
    //  4-Bit Full Adder Simulation
    reg [3:0] A_4bit;
    reg [3:0] B_4bit;
    wire [3:0] Full_Adder_4bit;
    wire Cout_FA_4Bit;
    full_adder_4bit  uut(A_4bit , B_4bit , 0, Full_Adder_4bit, Cout_FA_4Bit);
    initial begin
        A_4bit = 4'd7;    B_4bit = 4'd1;    #125;
        A_4bit = 4'd2;    B_4bit = 4'd8;    #125;
        A_4bit = 4'd2;    B_4bit = 4'd3;    #125;
        A_4bit = 4'd14;   B_4bit = 4'd10;   #125;
        A_4bit = 4'd10;   B_4bit = 4'd5;    #125;
        A_4bit = 4'd15;   B_4bit = 4'd4;    #125;
        A_4bit = 4'd6;    B_4bit = 4'd5;    #125;
        A_4bit = 4'd8;    B_4bit = 4'd5;    #125;
    end
    */
    
    /*
    //  16-Bit Full Adder Simulation
    reg [15:0] A_16bit;
    reg [15:0] B_16bit;
    wire [15:0] Full_Adder_16bit; 
    wire Cout_FA_16Bit;
    full_adder_16bit uut(A_16bit, B_16bit, 0, Full_Adder_16bit, Cout_FA_16Bit);
    
    initial begin
        A_16bit = 16'd29;     B_16bit = 16'd3;          #125;
        A_16bit = 16'd21;     B_16bit = 16'd83;         #125;
        A_16bit = 16'd16800;  B_16bit = 16'd16900;      #125;
        A_16bit = 16'd65534;  B_16bit = 16'd65100;      #125;
        A_16bit = 16'd202;    B_16bit = 16'd97;         #125;        
        A_16bit = 16'd44;     B_16bit = 16'd19;         #125;        
        A_16bit = 16'd644;    B_16bit = 16'd255;        #125;  
        A_16bit = 16'd86;     B_16bit = 16'd572;        #125;
    end  
    */
    
    /*
    //  16-Bit Full Adder-Subtractor Simulation
    reg [15:0] A_16bit;
    reg [15:0] B_16bit;
    reg sub;
    reg s;
    wire [15:0] Full_Adder_16bit; 
    wire Carry, Overflow, Borrow;
    
    full_adder_subtractor_16bit fad_sub1(A_16bit, B_16bit, sub, s, Full_Adder_16bit, 
                                                    Carry, Overflow, Borrow);

     initial begin
        A_16bit = 16'd29;     B_16bit = 16'd3;       sub = 1;  s = 0; #125;
        A_16bit = 16'd21;     B_16bit = 16'd83;      sub = 1;  s = 0; #125;
        A_16bit = 16'd16800;  B_16bit = 16'd16900;   sub = 1;  s = 1; #125;
        A_16bit = 16'd103;    B_16bit = 16'd145;     sub = 1;  s = 0; #125;
        A_16bit = 16'd202;    B_16bit = 16'd97;      sub = 0;  s = 0; #125;
        A_16bit = 16'd32400;  B_16bit = 16'd32200;   sub = 0;  s = 1; #125;
        A_16bit = 16'd6478;   B_16bit = 16'd2585;    sub = 1;  s = 0; #125;     
        A_16bit = 16'd8;      B_16bit = 16'd52;      sub = 1;  s = 0; #125;  
    end
    */
    
    /*
    //  3A - 2B    
    reg [15:0] A;
    reg [15:0] B;
    wire [15:0] threeA_Minus_twoB;
    
    threeA_minus_twoB uut(A, B, threeA_Minus_twoB);
    initial begin
        A = 16'd3105;    B = 16'd11275;    #125;
        A = 16'd21;      B = 16'd83;       #125;
        A = 16'd24;      B = 16'd32;       #125;
        A = 16'd16386;   B = 16'd353;      #125;
        A = 16'd202;     B = 16'd97;       #125;
        A = 16'd44;      B = 16'd9;        #125;
        A = 16'd64;      B = 16'd65535;    #125;
        A = 16'd8;       B = 16'd52;       #125;
        A = 16'd0;       B = 16'd0;        #125;
      end
    */
endmodule
