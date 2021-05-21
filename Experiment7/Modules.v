`timescale 1ns / 1ps


/*          part1          */
module not_gate(
    input wire a,
    output wire not_a
    );
    assign not_a = ~a;
endmodule
module and_gate_4input(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire o
    );
    assign o = a && b && c && d;
endmodule


module decoder_4input(
    input wire [3:0] s,
    output wire [15:0] O
    );
    wire not_s0, not_s1, not_s2, not_s3;
    
    not_gate not0(s[0], not_s0);
    not_gate not1(s[1], not_s1);
    not_gate not2(s[2], not_s2);
    not_gate not3(s[3], not_s3);

    and_gate_4input and0(not_s3, not_s2, not_s1, not_s0, O[0]); // 0000
    and_gate_4input and1(not_s3, not_s2, not_s1, s[0]  , O[1]); // 0001
    and_gate_4input and2(not_s3, not_s2, s[1]  , not_s0, O[2]); // 0010
    and_gate_4input and3(not_s3, not_s2, s[1]  , s[0]  , O[3]); // 0011
    and_gate_4input and4(not_s3, s[2]  , not_s1, not_s0, O[4]); // 0100
    and_gate_4input and5(not_s3, s[2]  , not_s1, s[0]  , O[5]); // 0101
    and_gate_4input and6(not_s3, s[2]  , s[1]  , not_s0, O[6]); // 0110
    and_gate_4input and7(not_s3, s[2]  , s[1]  , s[0]  , O[7]); // 0111
    and_gate_4input and10(s[3], not_s2, not_s1, not_s0, O[8]); // 1000
    and_gate_4input and11(s[3], not_s2, not_s1, s[0]  , O[9]); // 1001
    and_gate_4input and12(s[3], not_s2, s[1]  , not_s0, O[10]); // 1010
    and_gate_4input and13(s[3], not_s2, s[1]  , s[0]  , O[11]); // 1011
    and_gate_4input and14(s[3], s[2]  , not_s1, not_s0, O[12]); // 1100
    and_gate_4input and15(s[3], s[2]  , not_s1, s[0]  , O[13]); // 1101
    and_gate_4input and16(s[3], s[2]  , s[1]  , not_s0, O[14]); // 1110
    and_gate_4input and17(s[3], s[2]  , s[1]  , s[0]  , O[15]); // 1111
endmodule


module register_line_module(
    input wire [15:0] Input,
    input wire line_select,
    input wire clock,
    input wire reset,
    output wire [15:0] Output
    );
    reg [15:0] O;
    
    initial begin O = 16'dZ; end
    always @(posedge clock) begin
      if (line_select) begin
          O = Input;
      end
    end    
    
    always @(negedge reset) begin
        O = 16'dZ;
    end
    
    assign Output = O;
    
endmodule


/*         Part2         */
module buffer(
    input wire [15:0] Input,
    input wire enable,
    output wire [15:0] Output
    );
   assign Output = enable ? Input : 16'bZ;
   
endmodule

module  register_file_module(
    input wire [3:0] selA,    
    input wire [3:0] selB,
    input wire [3:0] selWrite,
    input wire [15:0] dataIn,
    input wire reset, 
    input wire writeEnable, 
    input wire clock,
    output wire [15:0] dataA,  
    output wire [15:0] dataB
);
    wire [15:0] writeLines, AselectLines, BselectLines;
    
    decoder_4input dec0(selWrite, writeLines);
    decoder_4input dec1(selA, AselectLines);
    decoder_4input dec2(selB, BselectLines);
    
    wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;
    wire [15:0] out8, out9, out10, out11, out12, out13, out14, out15;
    register_line_module reg0(dataIn, writeLines[0] && writeEnable, clock, reset, out0);
    register_line_module reg1(dataIn, writeLines[1] && writeEnable, clock, reset, out1);
    register_line_module reg2(dataIn, writeLines[2] && writeEnable, clock, reset, out2);
    register_line_module reg3(dataIn, writeLines[3] && writeEnable, clock, reset, out3);
    register_line_module reg4(dataIn, writeLines[4] && writeEnable, clock, reset, out4);
    register_line_module reg5(dataIn, writeLines[5] && writeEnable, clock, reset, out5);
    register_line_module reg6(dataIn, writeLines[6] && writeEnable, clock, reset, out6);
    register_line_module reg7(dataIn, writeLines[7] && writeEnable, clock, reset, out7);
    register_line_module reg8(dataIn, writeLines[8] && writeEnable, clock, reset, out8);
    register_line_module reg9(dataIn, writeLines[9] && writeEnable, clock, reset, out9);
    register_line_module regg10(dataIn, writeLines[10] && writeEnable, clock, reset, out10);
    register_line_module regg11(dataIn, writeLines[11] && writeEnable, clock, reset, out11);
    register_line_module regg12(dataIn, writeLines[12] && writeEnable, clock, reset, out12);
    register_line_module regg13(dataIn, writeLines[13] && writeEnable, clock, reset, out13);
    register_line_module regg14(dataIn, writeLines[14] && writeEnable, clock, reset, out14);
    register_line_module regg15(dataIn, writeLines[15] && writeEnable, clock, reset, out15);
   
    
    buffer b0(out0, AselectLines[0], dataA);
    buffer b1(out1, AselectLines[1], dataA);
    buffer b2(out2, AselectLines[2], dataA);
    buffer b3(out3, AselectLines[3], dataA);
    buffer b4(out4, AselectLines[4], dataA);
    buffer b5(out5, AselectLines[5], dataA);
    buffer b6(out6, AselectLines[6], dataA);
    buffer b7(out7, AselectLines[7], dataA);
    buffer b8(out8, AselectLines[8], dataA);
    buffer b9(out9, AselectLines[9], dataA);
    buffer b10(out10, AselectLines[10], dataA);
    buffer b11(out11, AselectLines[11], dataA);
    buffer b12(out12, AselectLines[12], dataA);
    buffer b13(out13, AselectLines[13], dataA);
    buffer b14(out14, AselectLines[14], dataA);
    buffer b15(out15, AselectLines[15], dataA);

    buffer b16(out0, BselectLines[0], dataB);
    buffer b17(out1, BselectLines[1], dataB);
    buffer b18(out2, BselectLines[2], dataB);
    buffer b19(out3, BselectLines[3], dataB);
    buffer b20(out4, BselectLines[4], dataB);
    buffer b21(out5, BselectLines[5], dataB);
    buffer b22(out6, BselectLines[6], dataB);
    buffer b23(out7, BselectLines[7], dataB);
    buffer b24(out8, BselectLines[8], dataB);
    buffer b25(out9, BselectLines[9], dataB);
    buffer b26(out10, BselectLines[10], dataB);
    buffer b27(out11, BselectLines[11], dataB);
    buffer b28(out12, BselectLines[12], dataB);
    buffer b29(out13, BselectLines[13], dataB);
    buffer b30(out14, BselectLines[14], dataB);
    buffer b31(out15, BselectLines[15], dataB);
    
endmodule




/*      Part3      */
module ALU(
    input wire [15:0] srcA, 
    input wire [15:0] srcB,
    output wire [15:0] dst,
    input wire [2:0] Op,
    input wire clock,
    input wire reset,
    output wire zeroFlag
    );
    reg [15:0] ALU_Result;
    reg zero, update;
    
    initial begin zero = 0; end
    always @(*)
    begin
      update = 0;
      case(Op)
        3'b000: // AND
           ALU_Result = srcA & srcB;
        3'b001: // OR
           ALU_Result = srcA | srcB;
        3'b010: // ADD
           ALU_Result = srcA + srcB ; 
        3'b011: // SUB
           ALU_Result = srcA - srcB ;
        3'b100: // XOR
           ALU_Result = srcA^srcB;
        3'b101: // LSR
           ALU_Result = srcA >> srcB;
        3'b110: // LSL
           ALU_Result = srcA<<srcB;
        3'b111: // LD
           ALU_Result = srcB;
         
        endcase
        case(Op)
        3'b010: // ADD
           update = 1; 
        3'b011: // SUB
           update = 1;         
        endcase    
    end
    
    always @(posedge clock)
    begin
      if(ALU_Result == 16'd0 && update)
        zero = 1;
    end
    always @(negedge reset)
    begin
        zero = 0;
    end      
     
    assign zeroFlag = zero;
    assign dst = ALU_Result;

endmodule



/*       Part4      */
module instruction_decoder(
    input wire [15:0] instruction,
    output wire [3:0] opcode,
    output wire [3:0] selWrite,
    output wire [3:0] selA,
    output wire [3:0] selB,
    output wire [15:0] fourBitImmediate,
    output wire [15:0] eightBitImmediate,
    output wire writeEnable,
    output wire isLoad,
    output wire isImmediate,
    output wire isBranch,    
    output wire isBranchNotEqual,    
    output wire isBranchEqual
    );
    reg [3:0] opcode_reg, selA_reg, selB_reg, selWrite_reg;
    reg [15:0] fourBitImmediate_reg, eightBitImmediate_reg;
    reg writeEnable_reg, isLoad_reg, isImmediate_reg;
    reg isBranch_reg, isBranchNotEqual_reg, isBranchEqual_reg;


    assign opcode = opcode_reg;
    assign selWrite = selWrite_reg;
    assign selA = selA_reg;
    assign selB = selB_reg;
    assign fourBitImmediate = fourBitImmediate_reg;
    assign eightBitImmediate = eightBitImmediate_reg;
    assign writeEnable = writeEnable_reg;
    assign isLoad = isLoad_reg;
    assign isImmediate = isImmediate_reg;
    assign isBranch = isBranch_reg;
    assign isBranchNotEqual = isBranchNotEqual_reg;
    assign isBranchEqual = isBranchEqual_reg;


    always @(*) begin
        opcode_reg = instruction[15:12]; 

        // register
        if ((opcode_reg[3] == 0 & opcode_reg != 4'b0111) || opcode_reg == 4'b1011) begin 
            fourBitImmediate_reg = 16'bZ;
            eightBitImmediate_reg = 16'bZ;
            isLoad_reg = 0; 
            isImmediate_reg = 0; 
            isBranch_reg = 0; 
            isBranchNotEqual_reg = 0; 
            isBranchEqual_reg = 0;
            
            selB_reg = instruction[3:0];
            selA_reg = instruction[7:4];
            selWrite_reg = instruction[11:8];
            writeEnable_reg = 1;
        end

        //load
        else if (opcode_reg == 4'b0111) begin
            selA_reg = 4'dZ; 
            selB_reg = 4'dZ; 
            fourBitImmediate_reg = 16'bZ;
            isLoad_reg = 0; 
            isImmediate_reg = 0; 
            isBranchNotEqual_reg = 0; 
            isBranchEqual_reg = 0;
            
            isBranch_reg = 1;
            eightBitImmediate_reg = 16'd0;
            eightBitImmediate_reg[7:0] = instruction[7:0];
            selWrite_reg = instruction[11:8];
            writeEnable_reg = 1;

        end

        //Immediate
        else if (opcode_reg[3:1] == 3'b100 || opcode_reg == 4'b1010) begin
            selB_reg = 4'dZ; 
            eightBitImmediate_reg = 16'bZ;
            isLoad_reg = 0; 
            isBranch_reg = 0; 
            isBranchNotEqual_reg = 0; 
            isBranchEqual_reg = 0;
            
            isImmediate_reg = 1;
            fourBitImmediate_reg = 16'd0;
            fourBitImmediate_reg[3:0] = instruction[3:0];
            selA_reg = instruction[7:4];
            selWrite_reg = instruction[11:8];
            writeEnable_reg = 1;
            
        end

        //Branch
        else if (opcode_reg[3:1] == 3'b111 || opcode_reg == 4'b1101) begin
            selA_reg = 4'dZ; 
            selB_reg = 4'dZ; 
            selWrite_reg = 4'dZ;
            fourBitImmediate_reg = 16'bZ;
            writeEnable_reg = 0; 
            isLoad_reg = 0; 
            isImmediate_reg = 0; 
            
            isBranch_reg = 1;
            eightBitImmediate_reg = 16'd0;
            eightBitImmediate_reg[7:0] = instruction[7:0];
            if (opcode_reg == 4'd14) begin
                isBranchNotEqual_reg = 1;
                isBranchEqual_reg = 0;
            end
            else if (opcode_reg == 4'd15) begin
                isBranchEqual_reg = 1;
                isBranchNotEqual_reg = 0; 
            end
        end
        
        //NOOP
        else if (opcode_reg == 4'd12) begin 
            selA_reg = 4'dZ; 
            selB_reg = 4'dZ; 
            selWrite_reg = 4'dZ;
            fourBitImmediate_reg = 16'bZ;
            writeEnable_reg = 0; 
            isLoad_reg = 0; 
            isImmediate_reg = 0; 
            
            isBranch_reg = 0;
            eightBitImmediate_reg = 16'dZ;
            isBranchNotEqual_reg = 0;
            isBranchEqual_reg = 0;
        end
    end
endmodule


/*   Part5    */
module program_counter(
    input wire reset,
    input wire clock,
    input wire zeroFlag,
    input wire isBranch,
    input wire isBranchNotEqual,
    input wire isBranchEqual,
    input wire [7:0] immediate_address,
    output wire [7:0] PC
);
    reg [7:0] pc_reg;
    
    assign PC = pc_reg;

    always @(posedge clock) begin
        if (isBranch) begin 
            if (!isBranchEqual && !isBranchNotEqual) begin
                pc_reg = immediate_address;
            end

            else if (isBranchNotEqual && zeroFlag) begin
                pc_reg = pc_reg + immediate_address;
            end

            else if (isBranchEqual && !zeroFlag) begin
                pc_reg = pc_reg + immediate_address;
            end
       end
       else begin
           pc_reg = pc_reg +8'd1;
       end 
    end
    always @(negedge reset) begin
        pc_reg = 8'd0;
    end
endmodule


/*    Part6     */
module ProgramMemory(
    input wire[7:0] address,
    output wire [15:0] out
    );
    //Declaration of the ROM area
    reg [15:0] ROM_Data [0:255];
    reg [15:0] instruction;
    assign out = instruction;
    //Read ROM data from the file
    initial $readmemh("ROM.mem", ROM_Data);
    //Read the selected data from ROM
    always @(*) begin
        instruction <= ROM_Data[address];
    end
endmodule


module minicomputer(
    input wire clock,
    input wire reset,
    output wire [15:0] instruction,
    output wire [15:0] dataA,
    output wire [15:0] dataB,
    output wire [15:0] dst,
    output wire [7:0] pc,
    output wire [15:0] srcB
);

    wire [3:0] opcode, selWrite, selA, selB;
    wire [15:0] fourBitImmediate, eightBitImmediate;
    wire writeEnable, isLoad, isImmediate, isBranch, isBranchNotEqual, isBranchEqual, zeroFlag;

    ProgramMemory f0(pc, instruction);
    
    instruction_decoder f1(instruction, opcode, selWrite, selA, selB, fourBitImmediate,
        eightBitImmediate, writeEnable, isLoad, isImmediate, isBranch, isBranchNotEqual, isBranchEqual);

    register_file_module f2(selA, selB, selWrite, dst, reset, writeEnable, clock, dataA, dataB);
    
    assign srcB = (isLoad | isBranch) ? eightBitImmediate: (isImmediate)? fourBitImmediate:((opcode < 4'd7) | (opcode == 4'd11))? dataB:4'dZ;

    ALU f3(dataA, srcB, dst, opcode[2:0], clock, reset, zeroFlag);
        
    program_counter f4(reset, clock, zeroFlag, isBranch, isBranchNotEqual, isBranchEqual, eightBitImmediate[7:0], pc);
    program_counter f5(reset, clock, zeroFlag, isBranch, isBranchNotEqual, isBranchEqual, fourBitImmediate[7:0], pc);
    
    
    
endmodule



