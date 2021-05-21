/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/
`timescale 1ns / 1ps


module not_gate(
    input wire a,
    output wire not_a
    );
    assign not_a = ~a;
endmodule
module and_gate_2input(
    input wire a,
    input wire b,
    output wire o
    );
    assign o = a && b;
endmodule

module and_gate_3input(
    input wire a,
    input wire b,
    input wire c,
    output wire o
    );
    assign o = a && b && c;
endmodule

module decoder_3input(
    input wire [2:0] s,
    output wire [7:0] O
    );
    wire not_s0, not_s1, not_s2;
    
    not_gate not0(s[0], not_s0);
    not_gate not1(s[1], not_s1);
    not_gate not2(s[2], not_s2);

    and_gate_3input and0(not_s2, not_s1, not_s0, O[0]); // 000
    and_gate_3input and1(not_s2, not_s1, s[0]  , O[1]); // 001
    and_gate_3input and2(not_s2, s[1]  , not_s0, O[2]); // 010
    and_gate_3input and3(not_s2, s[1]  , s[0]  , O[3]); // 011
    and_gate_3input and4(s[2]  , not_s1, not_s0, O[4]); // 100
    and_gate_3input and5(s[2]  , not_s1, s[0]  , O[5]); // 101
    and_gate_3input and6(s[2]  , s[1]  , not_s0, O[6]); // 110
    and_gate_3input and7(s[2]  , s[1]  , s[0]  , O[7]); // 111
endmodule

module decoder_2input(
    input wire [1:0] s,
    output wire [3:0] O
    );
    wire not_s0, not_s1;
    
    not_gate not0(s[0], not_s0);
    not_gate not1(s[1], not_s1);

    and_gate_2input and0(not_s1, not_s0, O[0]); // 00
    and_gate_2input and1(not_s1, s[0]  , O[1]); // 01
    and_gate_2input and2(s[1]  , not_s0, O[2]); // 10
    and_gate_2input and3(s[1]  , s[0]  , O[3]); // 11
endmodule



/*      Buffer      */
module buffer(
    input wire [7:0] Input,
    input wire enable,
    output wire [7:0] Output
    );
   assign Output = enable ? Input : 8'bZ;
   
endmodule


/*          part1          */
module part1(
    input wire [7:0] Input1,
    input wire [7:0] Input2,
    input wire enable,
    output wire [7:0] Output
    );
    wire o1, o2;
    buffer b0(Input1, ~enable, Output);
    buffer b1(Input2, enable, Output);
   
endmodule



/*          part2          */
module part2(
    input wire [7:0] Input1,
    input wire [7:0] Input2,
    input wire enable,
    output wire [7:0] Output1,
    output wire [7:0] Output2
    );
    
    wire [7:0] o;
    buffer b0(Input1, ~enable, o);
    buffer b1(Input2, enable, o);
   
    buffer b2(o, ~enable, Output1);
    buffer b3(o, enable, Output2);
   
endmodule




/*          part3          */
module part3(
    input wire [7:0] Input,
    input wire reset,
    input wire line_select,
    input wire read_enable,
    input wire write_enable,
    input wire clock,
    output wire [7:0] Output
    );
    reg [7:0] O;
    
    initial begin O = 8'dZ; end
    always @(posedge clock) begin
      if (write_enable && line_select) begin
          O <= Input;
      end
    end    
    
    always @(negedge reset) begin
        O = 8'dZ;
    end
    assign Output = (read_enable && line_select) ? O : 8'dZ;
    
endmodule



/*          part4           */
module part4(
    input wire [7:0] Input,
    input wire [2:0] address,
    input wire chip_select,
    input wire reset,
    input wire read_enable,
    input wire write_enable,
    input wire clock,
    output wire [7:0] Output
    );
    wire [7:0] line_select;
    decoder_3input d(address, line_select);
    
    wire [7:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7 ;
    
    part3 p0(Input, reset, chip_select && line_select[0], read_enable, write_enable, clock, temp0);
    part3 p1(Input, reset, chip_select && line_select[1], read_enable, write_enable, clock, temp1);
    part3 p2(Input, reset, chip_select && line_select[2], read_enable, write_enable, clock, temp2);
    part3 p3(Input, reset, chip_select && line_select[3], read_enable, write_enable, clock, temp3);
    part3 p4(Input, reset, chip_select && line_select[4], read_enable, write_enable, clock, temp4);
    part3 p5(Input, reset, chip_select && line_select[5], read_enable, write_enable, clock, temp5);
    part3 p6(Input, reset, chip_select && line_select[6], read_enable, write_enable, clock, temp6);
    part3 p7(Input, reset, chip_select && line_select[7], read_enable, write_enable, clock, temp7);

    buffer b0(temp0, line_select[0], Output);
    buffer b1(temp1, line_select[1], Output);
    buffer b2(temp2, line_select[2], Output);
    buffer b3(temp3, line_select[3], Output);
    buffer b4(temp4, line_select[4], Output);
    buffer b5(temp5, line_select[5], Output);
    buffer b6(temp6, line_select[6], Output);
    buffer b7(temp7, line_select[7], Output);
   
endmodule



/*          part5           */
module part5(
    input wire [7:0] Input,
    input wire [4:0] address,
    input wire chip_select,
    input wire reset,
    input wire read_enable,
    input wire write_enable,
    input wire clock,
    output wire [7:0] Output
    );
    wire [3:0] line_select;
    decoder_2input d(address[4:3], line_select);
    
    wire [7:0] temp0, temp1, temp2, temp3;
    
    part4 p0(Input, address[2:0], chip_select && line_select[0], reset, read_enable, write_enable, clock, temp0);
    part4 p1(Input, address[2:0], chip_select && line_select[1], reset, read_enable, write_enable, clock, temp1);
    part4 p2(Input, address[2:0], chip_select && line_select[2], reset, read_enable, write_enable, clock, temp2);
    part4 p3(Input, address[2:0], chip_select && line_select[3], reset, read_enable, write_enable, clock, temp3);

    buffer b0(temp0, line_select[0], Output);
    buffer b1(temp1, line_select[1], Output);
    buffer b2(temp2, line_select[2], Output);
    buffer b3(temp3, line_select[3], Output);
   
endmodule



/*          part6           */
module part6(
    input wire [7:0] Input,
    input wire [4:0] address,
    input wire reset,
    input wire read_enable,
    input wire write_enable,
    input wire clock,
    output wire [7:0] Output
    );
    wire [3:0] line_select;
    decoder_2input d(address[6:5], line_select);
    
    wire [7:0] temp0, temp1, temp2, temp3;
    
    part5 p0(Input[7:0], address[4:0], line_select[0], reset, read_enable, write_enable, clock, temp0);
    part5 p1(Input[7:0], address[4:0], line_select[1], reset, read_enable, write_enable, clock, temp1);
    part5 p2(Input[7:0], address[4:0], line_select[2], reset, read_enable, write_enable, clock, temp2);
    part5 p3(Input[7:0], address[4:0], line_select[3], reset, read_enable, write_enable, clock, temp3);

    buffer b0(temp0, line_select[0], Output);
    buffer b1(temp1, line_select[1], Output);
    buffer b2(temp2, line_select[2], Output);
    buffer b3(temp3, line_select[3], Output);
   
endmodule









