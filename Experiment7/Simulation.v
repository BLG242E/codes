`timescale 1ns / 1ps



module Simulation();
    

         
    /* PART1  -- Simulation of Register Line 
    reg [15:0] Input;
    reg line_select, clock, reset;
    wire [15:0] Output;
    
    register_line_module uut( Input, line_select, clock, reset, Output);
    
    initial begin
        clock = 1; reset = 0;
        Input = 16'd1512;   line_select = 0;   #50;
        Input = 16'd751;    line_select = 1;   #50;
        Input = 16'd30;     line_select = 1;   #50;
        Input = 16'd112;    line_select = 0;   #50;
        Input = 16'd113;    line_select = 1;   #50;
        Input = 16'd9145;   line_select = 1;   #50;
        Input = 16'd9112;   line_select = 1;   #50;
        Input = 16'd551;    line_select = 0;   #50;
        Input = 16'd13;     line_select = 1;   #50;
        Input = 16'd1;      line_select = 1;   #50;
        Input = 16'd11525;  line_select = 0;   #50;
        Input = 16'd151;    line_select = 1;   #50;
        Input = 16'd320;    line_select = 1;   #50;
        Input = 16'd1222;   line_select = 0;   #50;
        Input = 16'd113;    line_select = 1;   #50;
        Input = 16'd98;     line_select = 1;   #50;
        Input = 16'd91;     line_select = 1;   #50;
        Input = 16'd5554;   line_select = 1;   #50;
        Input = 16'd13;     line_select = 1;   #50;
        Input = 16'd8;      line_select = 1;   #50;        
    end
    always begin
        clock = ~clock; #25;
    end
    always begin
        reset = ~reset; #250;
    end
    */
    
    /* PART2 -- Simulation of Register File Module  
    
    reg [3:0] selA, selB, selWrite;
    reg [15:0] dataIn;
    reg reset, writeEnable, clock;
    wire [15:0] dataA;
    wire [15:0] dataB;
    
    register_file_module uut(selA, selB, selWrite, dataIn, reset, writeEnable, clock, dataA, dataB);
    initial begin
        clock = 1; reset = 0;
        dataIn = 16'd1512;    selA = 4'd1;   selB = 4'd1;   selWrite = 4'd1;   writeEnable = 1;   #50;
        dataIn = 16'd751;     selA = 4'd3;   selB = 4'd1;   selWrite = 4'd5;   writeEnable = 1;   #50;
        dataIn = 16'd30;      selA = 4'd1;   selB = 4'd5;   selWrite = 4'd12;  writeEnable = 1;   #50;
        dataIn = 16'd112;     selA = 4'd5;   selB = 4'd12;  selWrite = 4'd1;   writeEnable = 0;   #50;
        dataIn = 16'd113;     selA = 4'd1;   selB = 4'd3;   selWrite = 4'd3;   writeEnable = 1;   #50;
        dataIn = 16'd9145;    selA = 4'd1;   selB = 4'd5;   selWrite = 4'd6;   writeEnable = 1;   #50;
        dataIn = 16'd9112;    selA = 4'd1;   selB = 4'd6;   selWrite = 4'd7;   writeEnable = 1;   #50;
        dataIn = 16'd551;     selA = 4'd7;   selB = 4'd13;  selWrite = 4'd2;   writeEnable = 0;   #50;
        dataIn = 16'd13;      selA = 4'd3;   selB = 4'd2;   selWrite = 4'd13;  writeEnable = 1;   #50;
        dataIn = 16'd1;       selA = 4'd15;  selB = 4'd7;   selWrite = 4'd15;  writeEnable = 1;   #50;
        dataIn = 16'd11525;   selA = 4'd1;   selB = 4'd7;   selWrite = 4'd1;   writeEnable = 0;   #50;
        dataIn = 16'd151;     selA = 4'd2;   selB = 4'd11;  selWrite = 4'd2;   writeEnable = 1;   #50;
        dataIn = 16'd320;     selA = 4'd13;  selB = 4'd1;   selWrite = 4'd10;  writeEnable = 1;   #50;
        dataIn = 16'd1222;    selA = 4'd12;  selB = 4'd15;  selWrite = 4'd9;   writeEnable = 0;   #50;
        dataIn = 16'd113;     selA = 4'd13;  selB = 4'd3;   selWrite = 4'd7;   writeEnable = 1;   #50;
        dataIn = 16'd98;      selA = 4'd5;   selB = 4'd0;   selWrite = 4'd6;   writeEnable = 1;   #50;
        dataIn = 16'd91;      selA = 4'd10;  selB = 4'd10;  selWrite = 4'd10;  writeEnable = 1;   #50;
        dataIn = 16'd5554;    selA = 4'd5;   selB = 4'd11;  selWrite = 4'd11;  writeEnable = 1;   #50;
        dataIn = 16'd13;      selA = 4'd7;   selB = 4'd12;  selWrite = 4'd15;  writeEnable = 1;   #50;
        dataIn = 16'd8;       selA = 4'd9;   selB = 4'd3;   selWrite = 4'd13;  writeEnable = 1;   #50;    
    end
    always begin
        clock = ~clock; #25;
    end
    always begin
        reset = ~reset; #750;
    end
    */
    
    
    /* PART3 -- Simulation of ALU 
    reg [15:0] srcA, srcB;
    reg [2:0] Op;
    reg clock, reset;
    wire [15:0] dst;
    wire zeroFlag;    
    
    ALU uut(srcA, srcB, dst, Op, clock, reset, zeroFlag);
    
    initial begin
        clock = 1; reset = 0;
        srcA = 16'd12;    srcB = 16'd312;   Op = 3'd0;   #100;
        srcA = 16'd113;   srcB = 16'd12;    Op = 3'd1;   #100;
        srcA = 16'd151;   srcB = 16'd113;   Op = 3'd2;   #100;
        srcA = 16'd84;    srcB = 16'd84;    Op = 3'd3;   #100;
        srcA = 16'd95;    srcB = 16'd86;    Op = 3'd4;   #100;
        srcA = 16'd6;     srcB = 16'd62;    Op = 3'd5;   #100;
        srcA = 16'd56;    srcB = 16'd162;   Op = 3'd6;   #100;
        srcA = 16'd566;   srcB = 16'd8;     Op = 3'd7;   #100;
        srcA = 16'd32;    srcB = 16'd5163;  Op = 3'd3;   #100;
        srcA = 16'd5;     srcB = 16'd66;    Op = 3'd4;   #100;
        srcA = 16'd6411;  srcB = 16'd335;   Op = 3'd0;   #100;
    end
    always begin
        clock = ~clock;  #50;
    end
    always begin
        reset = ~reset;  #250;
    end
    */
    
    /* PART4 -- Simulation of Instruction Decoder 
    reg [15:0] instruction;
    wire [3:0] opcode, selWrite, selA, selB;
    wire [15:0] fourBitImmediate, eightBitImmediate;
    wire writeEnable, isLoad, isImmediate, isBranch;
    wire isBranchNotEqual,isBranchEqual;
    
    instruction_decoder uut(instruction, opcode, selWrite, 
        selA, selB, 
        fourBitImmediate, eightBitImmediate,
        writeEnable, isLoad, isImmediate, isBranch, 
        isBranchNotEqual, isBranchEqual);
    
    initial begin
        instruction = 16'b0000101110001001; #50;
        instruction = 16'b0001100100001101; #50;
        instruction = 16'b0010011110100011; #50;
        instruction = 16'b0011111101010101; #50;
        instruction = 16'b0100100110101010; #50;
        instruction = 16'b0101101011000111; #50;
        instruction = 16'b0110110010110000; #50;
        instruction = 16'b0111100101110000; #50;
        
        instruction = 16'b1000101010101000; #50;
        instruction = 16'b1001100101101110; #50;
        instruction = 16'b1010001010101101; #50;
        instruction = 16'b1011101010111111; #50;
        instruction = 16'b1100101011110100; #50;
        instruction = 16'b1101000111010101; #50;
        instruction = 16'b1110001010101011; #50;
        instruction = 16'b1111101111110010; #50;
        instruction = 16'b0000000000000000; #50;
    end
    */
    
    
    
    
    /* PART5 -- Simulation of Program Counter  */
    reg reset, clock;
    reg zeroFlag, isBranch, isBranchNotEqual, isBranchEqual;
    reg [7:0] immediate_address;
    wire [7:0] PC;
    
    program_counter uut(reset, clock, zeroFlag, isBranch, isBranchNotEqual, isBranchEqual, immediate_address, PC);
    
    initial begin
        clock = 1; reset = 0;
        zeroFlag = 0; isBranch = 0; isBranchNotEqual = 0; isBranchEqual = 0; immediate_address = 8'd0;   #100;
        zeroFlag = 0; isBranch = 0; isBranchNotEqual = 0; isBranchEqual = 0; immediate_address = 8'd13;  #100;
        zeroFlag = 0; isBranch = 1; isBranchNotEqual = 0; isBranchEqual = 0; immediate_address = 8'd86;  #100;
        zeroFlag = 0; isBranch = 1; isBranchNotEqual = 1; isBranchEqual = 1; immediate_address = 8'd9;   #100;
        zeroFlag = 1; isBranch = 1; isBranchNotEqual = 1; isBranchEqual = 1; immediate_address = 8'd100; #100;        
        zeroFlag = 0; isBranch = 1; isBranchNotEqual = 0; isBranchEqual = 0; immediate_address = 8'd56;  #100;
        zeroFlag = 0; isBranch = 0; isBranchNotEqual = 1; isBranchEqual = 0; immediate_address = 8'd15;  #100;
        zeroFlag = 0; isBranch = 1; isBranchNotEqual = 0; isBranchEqual = 0; immediate_address = 8'd86;  #100;
        zeroFlag = 0; isBranch = 1; isBranchNotEqual = 0; isBranchEqual = 1; immediate_address = 8'd13;  #100;
        zeroFlag = 1; isBranch = 1; isBranchNotEqual = 1; isBranchEqual = 1; immediate_address = 8'd51;  #100;
    
    end
    always begin
    clock = ~clock; #40;
    end
    always begin
    reset = ~reset; #400;
    end    
   
    
    
    /*    Part6    
    
    reg clock, reset;
    wire [15:0] INSTRUCTION, DATAA, DATAB, DST, SRCB;
    wire [7:0] PC;
    
    minicomputer uut( clock, reset, INSTRUCTION, DATAA, DATAB, DST, PC, SRCB);
    
    initial begin 
        clock = 1; reset = 0;
    end
    always begin 
        clock = ~clock; #100;
    end
    always begin
        reset = ~reset; #400;
    end
    */
endmodule








