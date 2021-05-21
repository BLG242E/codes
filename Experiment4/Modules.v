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

module SR_Latch_withoutEnable(
    input wire S,
    input wire R,
    output wire Q,
    output wire Qn
    );
    
    NAND_Gate nand1(S, Qn, Q);
    NAND_Gate nand2(R, Q, Qn);
    
endmodule


module SR_Latch_withEnable(
    input wire S,
    input wire R,
    input wire E,
    output wire Q,
    output wire Qn
    );
    wire S1, R1;
    
    NAND_Gate nand1(E, S, S1);
    NAND_Gate nand2(E, R, R1);
    
    NAND_Gate nand3(S1, Qn, Q);
    NAND_Gate nand4(R1, Q, Qn);
    
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



module notgate( input A, output B);
  assign B = ~A;
endmodule



module shift_register_16(input [15:0] I,
  input clock,
  input load,
  output shift_out
);
    reg  bit0,bit1,bit2,bit3,
    bit4,bit5,bit6,bit7,
    bit8,bit9,bit10,bit11,
    bit12,bit13,bit14,bit15;
    wire  l;
    notgate n1(load,l);

    assign shift_out = bit15;
  
  always @(posedge clock)
    begin
      bit15 <= (bit14 &  l) | (I[15] & load ) ;
      bit14 <= (bit13 &  l) | (I[14] & load ) ;
      bit13 <= (bit12 &  l) | (I[13] & load ) ;
      bit12 <= (bit11 &  l) | (I[12] & load ) ;
      
      bit11 <= (bit10 &  l) | (I[11] & load ) ;
      bit10 <= (bit9 &  l) | (I[10] & load ) ;
      bit9  <= (bit8 &  l) | (I[9] & load ) ;
      bit8  <= (bit7  &  l) | (I[8] & load ) ;

      bit7 <= (bit6 &  l) | (I[7] & load ) ;
      bit6 <= (bit5 &  l) | (I[6] & load ) ;
      bit5 <= (bit4 &  l) | (I[5] & load ) ;
      bit4 <= (bit3 &  l) | (I[4] & load ) ;
      
      bit3 <= (bit2 &  l) | (I[3] & load ) ;
      bit2 <= (bit1 &  l) | (I[2] & load ) ;
      bit1 <= (bit0 &  l) | (I[1] & load ) ;
      bit0 <= (bit15 &  l) | (I[0] & load ) ;
    end
endmodule



