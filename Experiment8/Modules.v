`timescale 1ns / 1ps

/*    Part1    */

module CharDecoder(
    input wire [7:0] char,
    output wire [25:0] decodedChar
    );
    wire [7:0] new;
    reg [25:0] decoded;
    
    assign new = char - 8'd65;
   
    
    integer i;
    integer x;
    integer y;
    always @(*) begin
        decoded = 26'd0;
        x = 0;
        y = 1;
        for (i=0; i < 8; i = i+1) begin
            x = x + new[i] * y; 
            y = y*2;
        end
        decoded[x] = 1;
    end
    assign decodedChar = decoded;
    
endmodule


module CharEncoder(
    input wire [25:0] decodedChar,
    output wire [7:0] char
    );
    reg [7:0] new;
    
    integer i;
    integer x;
    always @(*) begin
        i = 0;
        new = 8'd0;
        
        for (i=0; i < 26; i = i+1) begin
            if (decodedChar[i] == 1) begin
                x = i;
            end
        end
        i = 0;
        while (x != 0) begin
            if (x%2 == 1) begin
                new[i] = 1;
            end
            i = i+ 1; 
            x = x/2;
        end
        
        
    end
    assign char = new + 8'd65;
    
endmodule



module CircularRightShift(
    input wire [25:0] data,
    input wire [4:0] shiftAmount,
    output wire [25:0] out
    );
    reg [7:0] x;
    wire [7:0] preData;
    
    CharEncoder enc(data, preData);
    
    always @(*) begin
        x = preData;
        x = x - shiftAmount;
        
        while (x < 65) begin
            x = x+26;
        end
        
    end
        
    CharDecoder dec(x, out);
    
endmodule



module CircularLeftShift(
    input wire [25:0] data,
    input wire [4:0] shiftAmount,
    output wire [25:0] out
    );
    reg [7:0] x;
    wire [7:0] preData;
    
    CharEncoder enc(data, preData);
    
    always @(*) begin
        x = preData;
        x = x + shiftAmount;
        
        while (x > 90) begin
            x = x-26;
        end
        
    end
        
    CharDecoder dec(x, out);
endmodule


/*   PART2   */
module CaesarEncryption(
    input wire [7:0] plainChar,
    input wire [4:0] shiftCount,
    output wire [7:0] chipherChar    
    );
    wire [25:0] decoderOut;
    wire [25:0] encoderIn;
    CharDecoder decoder(plainChar, decoderOut);
    CircularLeftShift shifter(decoderOut, shiftCount, encoderIn);
    CharEncoder encoder(encoderIn, chipherChar);
endmodule


module CaesarDecryption(
    input wire [7:0] chipherChar,
    input wire [4:0] shiftCount,
    output wire [7:0] decryptedChar    
    );
    wire [25:0] decoderOut;
    wire [25:0] encoderIn;
    CharDecoder decoder(chipherChar, decoderOut);
    CircularRightShift shifter(decoderOut, shiftCount, encoderIn);
    CharEncoder encoder(encoderIn, decryptedChar);
endmodule


module CaesarEnvironment(
    input wire [7:0] plainChar,
    input wire [4:0] shiftCount,
    output wire [7:0] chipherChar,
    output wire [7:0] decryptedChar
    );
    CaesarEncryption enc(plainChar, shiftCount, chipherChar);
    CaesarDecryption dec(chipherChar, shiftCount, decryptedChar);
endmodule


/*   PART3   */
module VigenereEncryption(
    input wire [7:0] plainChar,
    input wire [79:0] keyInput,
    input wire load,
    input wire clock,
    output wire [7:0] chipherChar
    );
    reg [79:0] keyRegister;
    reg [7:0] key;
    integer i = 0;
    
    assign keyO = key + 8'd65;
    
    always @(posedge load) begin
        keyRegister = keyInput;
        i = 0;
    end
    always @(posedge clock) begin
        if (load == 0) begin
            if (i > 9) begin
                i = 0;
            end
            key = keyRegister[72-8*i+:8];
            key = key - 8'd65;
            i = i + 1;
        end
    end
    CaesarEncryption enc(plainChar, key, chipherChar);
endmodule


module VigenereDecryption(
    input wire [7:0] chipherChar,
    input wire [79:0] keyInput,
    input wire load,
    input wire clock,
    output wire [7:0] decryptedChar
    );
    reg [79:0] keyRegister;
    reg [7:0] key;
    integer i = 0;
    
    always @(posedge load) begin
        keyRegister = keyInput;
        i = 0;
    end
    always @(posedge clock) begin
        if (load == 0) begin
            if (i > 9) begin
                i = 0;
            end
            key = keyRegister[72-8*i+:8];
            key = key - 8'd65;
            i = i + 1;
        end
    end    
    CaesarDecryption enc(chipherChar, key, decryptedChar);
endmodule


module VigenereEnvironment(
    input wire [7:0] plainChar,
    input wire [79:0] keyInput,
    input wire load,
    input wire clock,
    output wire [7:0] chipherChar,
    output wire [7:0] decryptedChar
    );
    VigenereEncryption enc(plainChar, keyInput, 
                    load, clock, chipherChar);
    VigenereDecryption dec(chipherChar, keyInput, 
                    load, clock, decryptedChar);
endmodule



/*   PART4   */
module PlugBoard(
    input wire [25:0] charInput,
    input wire [25:0] backwardInput,
    output wire [25:0] forwardOutput,
    output wire [25:0] backwardOutput
);
    reg [25:0] forwardO;
    reg [25:0] backwardO;
    
    always @(*) begin
        forwardO = 26'd0;
        if (charInput[0]) begin  forwardO[7] = 1; end
        else if (charInput[1]) begin  forwardO[9] = 1; end
        else if (charInput[2]) begin  forwardO[11] = 1; end
        else if (charInput[3]) begin  forwardO[19] = 1; end
        else if (charInput[4]) begin  forwardO[13] = 1; end
        else if (charInput[5]) begin  forwardO[16] = 1; end
        else if (charInput[6]) begin  forwardO[18] = 1; end
        else if (charInput[7]) begin  forwardO[2] = 1; end
        else if (charInput[8]) begin  forwardO[8] = 1; end
        else if (charInput[9]) begin  forwardO[12] = 1; end
        else if (charInput[10]) begin  forwardO[14] = 1; end
        else if (charInput[11]) begin  forwardO[17] = 1; end
        else if (charInput[12]) begin  forwardO[15] = 1; end
        else if (charInput[13]) begin  forwardO[23] = 1; end
        else if (charInput[14]) begin  forwardO[25] = 1; end
        else if (charInput[15]) begin  forwardO[6] = 1; end
        else if (charInput[16]) begin  forwardO[20] = 1; end
        else if (charInput[17]) begin  forwardO[10] = 1; end
        else if (charInput[18]) begin  forwardO[5] = 1; end
        else if (charInput[19]) begin  forwardO[24] = 1; end
        else if (charInput[20]) begin  forwardO[4] = 1; end
        else if (charInput[21]) begin  forwardO[21] = 1; end
        else if (charInput[22]) begin  forwardO[4] = 1; end
        else if (charInput[23]) begin  forwardO[3] = 1; end
        else if (charInput[24]) begin  forwardO[1] = 1; end
        else if (charInput[25]) begin  forwardO[22] = 1; end
        backwardO = 26'd0;
        if (backwardInput[0]) begin  backwardO[4] = 1; end
        else if (backwardInput[1]) begin  backwardO[10] = 1; end
        else if (backwardInput[2]) begin  backwardO[12] = 1; end
        else if (backwardInput[3]) begin  backwardO[5] = 1; end
        else if (backwardInput[4]) begin  backwardO[11] = 1; end
        else if (backwardInput[5]) begin  backwardO[6] = 1; end
        else if (backwardInput[6]) begin  backwardO[3] = 1; end
        else if (backwardInput[7]) begin  backwardO[16] = 1; end
        else if (backwardInput[8]) begin  backwardO[21] = 1; end
        else if (backwardInput[9]) begin  backwardO[25] = 1; end
        else if (backwardInput[10]) begin  backwardO[13] = 1; end
        else if (backwardInput[11]) begin  backwardO[19] = 1; end
        else if (backwardInput[12]) begin  backwardO[14] = 1; end
        else if (backwardInput[13]) begin  backwardO[22] = 1; end
        else if (backwardInput[14]) begin  backwardO[24] = 1; end
        else if (backwardInput[15]) begin  backwardO[7] = 1; end
        else if (backwardInput[16]) begin  backwardO[23] = 1; end
        else if (backwardInput[17]) begin  backwardO[20] = 1; end
        else if (backwardInput[18]) begin  backwardO[18] = 1; end
        else if (backwardInput[19]) begin  backwardO[15] = 1; end
        else if (backwardInput[20]) begin  backwardO[0] = 1; end
        else if (backwardInput[21]) begin  backwardO[8] = 1; end
        else if (backwardInput[22]) begin  backwardO[1] = 1; end
        else if (backwardInput[23]) begin  backwardO[17] = 1; end
        else if (backwardInput[24]) begin  backwardO[2] = 1; end
        else if (backwardInput[25]) begin  backwardO[9] = 1; end
    end
    assign forwardOutput = forwardO;
    assign backwardOutput = backwardO;
    
endmodule


module Rotor1(
    input wire [25:0] forwardInput,
    input wire [25:0] backwardInput,
    input wire [4:0] startPosition,
    input wire load,
    input wire clockIn,
    output wire clockOut,
    output wire [25:0] forwardOutput,
    output wire [25:0] backwardOutput
);
    wire [25:0] shiftForwardInput;
    wire [25:0] shiftBackwardInput;

    reg [4:0] positionCounter;

    reg [25:0] forwardO;
    reg [25:0] backwardO;
    integer i = 0;
    
    CircularRightShift shifter1(forwardInput, positionCounter, shiftForwardInput);
    CircularRightShift shifter2(backwardInput, positionCounter, shiftBackwardInput);


    always @(*) begin
        forwardO = 26'd0;
        if (shiftForwardInput[0]) begin  forwardO[17] = 1; end
        else if (shiftForwardInput[1]) begin  forwardO[12] = 1; end
        else if (shiftForwardInput[2]) begin  forwardO[18] = 1; end
        else if (shiftForwardInput[3]) begin  forwardO[0] = 1; end
        else if (shiftForwardInput[4]) begin  forwardO[5] = 1; end
        else if (shiftForwardInput[5]) begin  forwardO[8] = 1; end
        else if (shiftForwardInput[6]) begin  forwardO[7] = 1; end
        else if (shiftForwardInput[7]) begin  forwardO[13] = 1; end
        else if (shiftForwardInput[8]) begin  forwardO[4] = 1; end
        else if (shiftForwardInput[9]) begin  forwardO[23] = 1; end
        else if (shiftForwardInput[10]) begin  forwardO[6] = 1; end
        else if (shiftForwardInput[11]) begin  forwardO[3] = 1; end
        else if (shiftForwardInput[12]) begin  forwardO[14] = 1; end
        else if (shiftForwardInput[13]) begin  forwardO[2] = 1; end
        else if (shiftForwardInput[14]) begin  forwardO[1] = 1; end
        else if (shiftForwardInput[15]) begin  forwardO[25] = 1; end
        else if (shiftForwardInput[16]) begin  forwardO[10] = 1; end
        else if (shiftForwardInput[17]) begin  forwardO[16] = 1; end
        else if (shiftForwardInput[18]) begin  forwardO[22] = 1; end
        else if (shiftForwardInput[19]) begin  forwardO[9] = 1; end
        else if (shiftForwardInput[20]) begin  forwardO[20] = 1; end
        else if (shiftForwardInput[21]) begin  forwardO[15] = 1; end
        else if (shiftForwardInput[22]) begin  forwardO[19] = 1; end
        else if (shiftForwardInput[23]) begin  forwardO[21] = 1; end
        else if (shiftForwardInput[24]) begin  forwardO[11] = 1; end
        else if (shiftForwardInput[25]) begin  forwardO[24] = 1; end
        backwardO = 26'd0;
        if (shiftBackwardInput[0]) begin  backwardO[7] = 1; end
        else if (shiftBackwardInput[1]) begin  backwardO[12] = 1; end
        else if (shiftBackwardInput[2]) begin  backwardO[21] = 1; end
        else if (shiftBackwardInput[3]) begin  backwardO[17] = 1; end
        else if (shiftBackwardInput[4]) begin  backwardO[0] = 1; end
        else if (shiftBackwardInput[5]) begin  backwardO[2] = 1; end
        else if (shiftBackwardInput[6]) begin  backwardO[22] = 1; end
        else if (shiftBackwardInput[7]) begin  backwardO[20] = 1; end
        else if (shiftBackwardInput[8]) begin  backwardO[23] = 1; end
        else if (shiftBackwardInput[9]) begin  backwardO[18] = 1; end
        else if (shiftBackwardInput[10]) begin  backwardO[9] = 1; end
        else if (shiftBackwardInput[11]) begin  backwardO[25] = 1; end
        else if (shiftBackwardInput[12]) begin  backwardO[15] = 1; end
        else if (shiftBackwardInput[13]) begin  backwardO[3] = 1; end
        else if (shiftBackwardInput[14]) begin  backwardO[14] = 1; end
        else if (shiftBackwardInput[15]) begin  backwardO[13] = 1; end
        else if (shiftBackwardInput[16]) begin  backwardO[11] = 1; end
        else if (shiftBackwardInput[17]) begin  backwardO[8] = 1; end
        else if (shiftBackwardInput[18]) begin  backwardO[4] = 1; end
        else if (shiftBackwardInput[19]) begin  backwardO[10] = 1; end
        else if (shiftBackwardInput[20]) begin  backwardO[6] = 1; end
        else if (shiftBackwardInput[21]) begin  backwardO[5] = 1; end
        else if (shiftBackwardInput[22]) begin  backwardO[19] = 1; end
        else if (shiftBackwardInput[23]) begin  backwardO[16] = 1; end
        else if (shiftBackwardInput[24]) begin  backwardO[24] = 1; end
        else if (shiftBackwardInput[25]) begin  backwardO[1] = 1; end
    end
    
    

    always @(posedge clockIn) begin
        if (load == 0) begin
            positionCounter = positionCounter + 1;
            if (positionCounter > 5'd25) begin
                positionCounter = 5'd0;
            end
        end
        i = i+1;
        if (i > 25) begin
            i = 0;
        end
    end
    always @(posedge load) begin
        positionCounter = startPosition;
    end
    
    assign clockOut = (i == 0) ? 1 : 0;
    
    CircularLeftShift shifter3(forwardO, positionCounter, forwardOutput);
    CircularLeftShift shifter4(backwardO, positionCounter, backwardOutput);

endmodule





module Rotor2(
    input wire [25:0] forwardInput,
    input wire [25:0] backwardInput,
    input wire [4:0] startPosition,
    input wire load,
    input wire clockIn,
    output wire clockOut,
    output wire [25:0] forwardOutput,
    output wire [25:0] backwardOutput
);
    wire [25:0] shiftForwardInput;
    wire [25:0] shiftBackwardInput;

    reg [25:0] forwardO;
    reg [25:0] backwardO;

    reg [4:0] positionCounter;

    integer i = 0;
    
    CircularRightShift shifter1(forwardInput, positionCounter, shiftForwardInput);
    CircularRightShift shifter2(backwardInput, positionCounter, shiftBackwardInput);


    always @(*) begin
        forwardO = 26'd0;
        if (shiftForwardInput[0]) begin  forwardO[22] = 1; end
        else if (shiftForwardInput[1]) begin  forwardO[23] = 1; end
        else if (shiftForwardInput[2]) begin  forwardO[21] = 1; end
        else if (shiftForwardInput[3]) begin  forwardO[7] = 1; end
        else if (shiftForwardInput[4]) begin  forwardO[14] = 1; end
        else if (shiftForwardInput[5]) begin  forwardO[20] = 1; end
        else if (shiftForwardInput[6]) begin  forwardO[16] = 1; end
        else if (shiftForwardInput[7]) begin  forwardO[15] = 1; end
        else if (shiftForwardInput[8]) begin  forwardO[19] = 1; end
        else if (shiftForwardInput[9]) begin  forwardO[0] = 1; end
        else if (shiftForwardInput[10]) begin  forwardO[8] = 1; end
        else if (shiftForwardInput[11]) begin  forwardO[11] = 1; end
        else if (shiftForwardInput[12]) begin  forwardO[17] = 1; end
        else if (shiftForwardInput[13]) begin  forwardO[6] = 1; end
        else if (shiftForwardInput[14]) begin  forwardO[1] = 1; end
        else if (shiftForwardInput[15]) begin  forwardO[5] = 1; end
        else if (shiftForwardInput[16]) begin  forwardO[10] = 1; end
        else if (shiftForwardInput[17]) begin  forwardO[18] = 1; end
        else if (shiftForwardInput[18]) begin  forwardO[4] = 1; end
        else if (shiftForwardInput[19]) begin  forwardO[13] = 1; end
        else if (shiftForwardInput[20]) begin  forwardO[24] = 1; end
        else if (shiftForwardInput[21]) begin  forwardO[9] = 1; end
        else if (shiftForwardInput[22]) begin  forwardO[2] = 1; end
        else if (shiftForwardInput[23]) begin  forwardO[12] = 1; end
        else if (shiftForwardInput[24]) begin  forwardO[3] = 1; end
        else if (shiftForwardInput[25]) begin  forwardO[25] = 1; end
        backwardO = 26'd0;
        if (shiftBackwardInput[0]) begin  backwardO[19] = 1; end
        else if (shiftBackwardInput[1]) begin  backwardO[4] = 1; end
        else if (shiftBackwardInput[2]) begin  backwardO[7] = 1; end
        else if (shiftBackwardInput[3]) begin  backwardO[6] = 1; end
        else if (shiftBackwardInput[4]) begin  backwardO[12] = 1; end
        else if (shiftBackwardInput[5]) begin  backwardO[17] = 1; end
        else if (shiftBackwardInput[6]) begin  backwardO[8] = 1; end
        else if (shiftBackwardInput[7]) begin  backwardO[5] = 1; end
        else if (shiftBackwardInput[8]) begin  backwardO[2] = 1; end
        else if (shiftBackwardInput[9]) begin  backwardO[0] = 1; end
        else if (shiftBackwardInput[10]) begin  backwardO[1] = 1; end
        else if (shiftBackwardInput[11]) begin  backwardO[20] = 1; end
        else if (shiftBackwardInput[12]) begin  backwardO[25] = 1; end
        else if (shiftBackwardInput[13]) begin  backwardO[9] = 1; end
        else if (shiftBackwardInput[14]) begin  backwardO[14] = 1; end
        else if (shiftBackwardInput[15]) begin  backwardO[22] = 1; end
        else if (shiftBackwardInput[16]) begin  backwardO[24] = 1; end
        else if (shiftBackwardInput[17]) begin  backwardO[18] = 1; end
        else if (shiftBackwardInput[18]) begin  backwardO[15] = 1; end
        else if (shiftBackwardInput[19]) begin  backwardO[13] = 1; end
        else if (shiftBackwardInput[20]) begin  backwardO[3] = 1; end
        else if (shiftBackwardInput[21]) begin  backwardO[10] = 1; end
        else if (shiftBackwardInput[22]) begin  backwardO[21] = 1; end
        else if (shiftBackwardInput[23]) begin  backwardO[16] = 1; end
        else if (shiftBackwardInput[24]) begin  backwardO[11] = 1; end
        else if (shiftBackwardInput[25]) begin  backwardO[23] = 1; end
    end

    always @(posedge clockIn) begin
        if (load == 0) begin
            positionCounter = positionCounter + 1;
            if (positionCounter > 5'd25) begin
                positionCounter = 5'd0;
            end
        end
        i = i+1;
        if (i > 25) begin
            i = 0;
        end
    end
    always @(posedge load) begin
        positionCounter = startPosition;
    end
    
    assign clockOut = (i == 0) ? 1 : 0;
    
    CircularLeftShift shifter3(forwardO, positionCounter, forwardOutput);
    CircularLeftShift shifter4(backwardO, positionCounter, backwardOutput);

endmodule



module Rotor3(
    input wire [25:0] forwardInput,
    input wire [25:0] backwardInput,
    input wire [4:0] startPosition,
    input wire load,
    input wire clockIn,
    output wire [25:0] forwardOutput,
    output wire [25:0] backwardOutput
);
    wire [25:0] shiftForwardInput;
    wire [25:0] shiftBackwardInput;

    reg [25:0] forwardO;
    reg [25:0] backwardO;

    reg [4:0] positionCounter;
    
    CircularRightShift shifter1(forwardInput, positionCounter, shiftForwardInput);
    CircularRightShift shifter2(backwardInput, positionCounter, shiftBackwardInput);

    always @(*) begin
        forwardO = 26'd0;
        if (shiftForwardInput[0]) begin  forwardO[14] = 1; end
        else if (shiftForwardInput[1]) begin  forwardO[16] = 1; end
        else if (shiftForwardInput[2]) begin  forwardO[18] = 1; end
        else if (shiftForwardInput[3]) begin  forwardO[20] = 1; end
        else if (shiftForwardInput[4]) begin  forwardO[22] = 1; end
        else if (shiftForwardInput[5]) begin  forwardO[24] = 1; end
        else if (shiftForwardInput[6]) begin  forwardO[15] = 1; end
        else if (shiftForwardInput[7]) begin  forwardO[2] = 1; end
        else if (shiftForwardInput[8]) begin  forwardO[4] = 1; end
        else if (shiftForwardInput[9]) begin  forwardO[6] = 1; end
        else if (shiftForwardInput[10]) begin  forwardO[10] = 1; end
        else if (shiftForwardInput[11]) begin  forwardO[8] = 1; end
        else if (shiftForwardInput[12]) begin  forwardO[12] = 1; end
        else if (shiftForwardInput[13]) begin  forwardO[0] = 1; end
        else if (shiftForwardInput[14]) begin  forwardO[11] = 1; end
        else if (shiftForwardInput[15]) begin  forwardO[17] = 1; end
        else if (shiftForwardInput[16]) begin  forwardO[21] = 1; end
        else if (shiftForwardInput[17]) begin  forwardO[9] = 1; end
        else if (shiftForwardInput[18]) begin  forwardO[19] = 1; end
        else if (shiftForwardInput[19]) begin  forwardO[13] = 1; end
        else if (shiftForwardInput[20]) begin  forwardO[23] = 1; end
        else if (shiftForwardInput[21]) begin  forwardO[25] = 1; end
        else if (shiftForwardInput[22]) begin  forwardO[7] = 1; end
        else if (shiftForwardInput[23]) begin  forwardO[5] = 1; end
        else if (shiftForwardInput[24]) begin  forwardO[3] = 1; end
        else if (shiftForwardInput[25]) begin  forwardO[1] = 1; end
        backwardO = 26'd0;
        if (shiftBackwardInput[0]) begin  backwardO[19] = 1; end
        else if (shiftBackwardInput[1]) begin  backwardO[0] = 1; end
        else if (shiftBackwardInput[2]) begin  backwardO[6] = 1; end
        else if (shiftBackwardInput[3]) begin  backwardO[1] = 1; end
        else if (shiftBackwardInput[4]) begin  backwardO[15] = 1; end
        else if (shiftBackwardInput[5]) begin  backwardO[2] = 1; end
        else if (shiftBackwardInput[6]) begin  backwardO[18] = 1; end
        else if (shiftBackwardInput[7]) begin  backwardO[3] = 1; end
        else if (shiftBackwardInput[8]) begin  backwardO[16] = 1; end
        else if (shiftBackwardInput[9]) begin  backwardO[4] = 1; end
        else if (shiftBackwardInput[10]) begin  backwardO[20] = 1; end
        else if (shiftBackwardInput[11]) begin  backwardO[5] = 1; end
        else if (shiftBackwardInput[12]) begin  backwardO[21] = 1; end
        else if (shiftBackwardInput[13]) begin  backwardO[13] = 1; end
        else if (shiftBackwardInput[14]) begin  backwardO[25] = 1; end
        else if (shiftBackwardInput[15]) begin  backwardO[7] = 1; end
        else if (shiftBackwardInput[16]) begin  backwardO[24] = 1; end
        else if (shiftBackwardInput[17]) begin  backwardO[8] = 1; end
        else if (shiftBackwardInput[18]) begin  backwardO[23] = 1; end
        else if (shiftBackwardInput[19]) begin  backwardO[9] = 1; end
        else if (shiftBackwardInput[20]) begin  backwardO[22] = 1; end
        else if (shiftBackwardInput[21]) begin  backwardO[11] = 1; end
        else if (shiftBackwardInput[22]) begin  backwardO[17] = 1; end
        else if (shiftBackwardInput[23]) begin  backwardO[10] = 1; end
        else if (shiftBackwardInput[24]) begin  backwardO[14] = 1; end
        else if (shiftBackwardInput[25]) begin  backwardO[12] = 1; end
    end

    always @(posedge clockIn) begin
        if (load == 0) begin
            positionCounter = positionCounter + 1;
            if (positionCounter > 5'd25) begin
                positionCounter = 5'd0;
            end
        end
    end
    always @(posedge load) begin
        positionCounter = startPosition;
    end
        
    CircularLeftShift shifter3(forwardO, positionCounter, forwardOutput);
    CircularLeftShift shifter4(backwardO, positionCounter, backwardOutput);

endmodule


module Reflector(
    input wire [25:0] inputConnection,
    output wire [25:0] outputConnection
);
    reg [25:0] out;

     always @(*) begin
        out = 26'd0;
        if (inputConnection[0]) begin  out[24] = 1; end
        else if (inputConnection[1]) begin  out[17] = 1; end
        else if (inputConnection[2]) begin  out[20] = 1; end
        else if (inputConnection[3]) begin  out[7] = 1; end
        else if (inputConnection[4]) begin  out[16] = 1; end
        else if (inputConnection[5]) begin  out[18] = 1; end
        else if (inputConnection[6]) begin  out[11] = 1; end
        else if (inputConnection[7]) begin  out[3] = 1; end
        else if (inputConnection[8]) begin  out[15] = 1; end
        else if (inputConnection[9]) begin  out[23] = 1; end
        else if (inputConnection[10]) begin  out[13] = 1; end
        else if (inputConnection[11]) begin  out[6] = 1; end
        else if (inputConnection[12]) begin  out[14] = 1; end
        else if (inputConnection[13]) begin  out[10] = 1; end
        else if (inputConnection[14]) begin  out[12] = 1; end
        else if (inputConnection[15]) begin  out[8] = 1; end
        else if (inputConnection[16]) begin  out[4] = 1; end
        else if (inputConnection[17]) begin  out[1] = 1; end
        else if (inputConnection[18]) begin  out[5] = 1; end
        else if (inputConnection[19]) begin  out[25] = 1; end
        else if (inputConnection[20]) begin  out[2] = 1; end
        else if (inputConnection[21]) begin  out[22] = 1; end
        else if (inputConnection[22]) begin  out[21] = 1; end
        else if (inputConnection[23]) begin  out[9] = 1; end
        else if (inputConnection[24]) begin  out[0] = 1; end
        else if (inputConnection[25]) begin  out[19] = 1; end
     end
    assign outputConnection = out;
endmodule


module EnigmaMachine(
    input wire [7:0] char,
    input wire [4:0] startPosition1,
    input wire [4:0] startPosition2,
    input wire [4:0] startPosition3,
    input wire load,
    input wire clock,
    output wire [7:0] outChar
);
    wire clock1, clock2;
    wire [25:0] forwardData1, backward1;
    wire [25:0] forwardData2, backward2;
    wire [25:0] forwardData3, backward3;
    wire [25:0] forwardData4, backward4;
    wire [25:0] forwardData5, backward5;
    
    CharDecoder dec(char, forwardData1);
    PlugBoard p1(forwardData1, backward4 ,forwardData2, backward5);
    Rotor1 r1(forwardData2, backward3, startPosition1, load, clock, clock1, forwardData3, backward4);
    Rotor2 r2(forwardData3, backward2, startPosition2, load, clock1, clock2, forwardData4, backward3);
    Rotor3 r3(forwardData4, backward1, startPosition3, load, clock2, forwardData5, backward2);
    Reflector r4(forwardData5, backward1);
    CharEncoder enc(backward5, outChar);
    
endmodule


module EnigmaCommunication(
    input wire [7:0] plainChar,
    input wire [4:0] startPosition1,
    input wire [4:0] startPosition2,
    input wire [4:0] startPosition3,
    input wire load,
    input wire clock,
    output wire [7:0] chipherChar,
    output wire [7:0] decryptedChar
);
    EnigmaMachine machine1(plainChar, startPosition1, startPosition2, startPosition3, load, clock, chipherChar);
    EnigmaMachine machine2(chipherChar, startPosition1, startPosition2, startPosition3, load, clock, decryptedChar);
endmodule



