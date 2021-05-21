`timescale 1ns / 1ps


module Simulation();
    /* CharDecoder 
    reg [7:0] char;
    wire [25:0] decodedChar;
    CharDecoder uut(char, decodedChar);
    
    initial begin
        char = 8'd65; #200;
        char = 8'd90; #200;
        char = 8'd75; #200;
        char = 8'd66; #200;
        char = 8'd84; #200;
    end
    */
    /* CharEncoder 
    reg [25:0] decodedChar;
    wire [7:0] char;
    CharEncoder uut(decodedChar, char);
    
    initial begin
        decodedChar = 26'h0000020; #200;
        decodedChar = 26'h0000400; #200;
        decodedChar = 26'h0020000; #200;
        decodedChar = 26'h2000000; #200;
        decodedChar = 26'h0000001; #200;
    end
    */
    
    /*  CircularRightShift  
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;
    CircularRightShift uut(data, shiftAmount, out);
    
    initial begin
        data = 26'h0000020; shiftAmount = 5'd10; #200;
        data = 26'h0000400; shiftAmount = 5'd3;  #200;
        data = 26'h0020000; shiftAmount = 5'd25; #200;
        data = 26'h2000000; shiftAmount = 5'd1;  #200;
        data = 26'h0000001; shiftAmount = 5'd31; #200;
    end
    */
    
    
    /*  CircularLeftShift 
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;
    CircularLeftShift uut(data, shiftAmount, out);
    
    initial begin
        data = 26'h0000020; shiftAmount = 5'd10; #200;
        data = 26'h0000400; shiftAmount = 5'd3;  #200;
        data = 26'h0020000; shiftAmount = 5'd25; #200;
        data = 26'h2000000; shiftAmount = 5'd1;  #200;
        data = 26'h0000001; shiftAmount = 5'd31; #200;
    end
    */
    
    /*  CaesarEncryption  
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    CaesarEncryption uut(plainChar, shiftCount, chipherChar);
    
    initial begin
        plainChar = 8'd65; shiftCount = 3; #200;
        plainChar = 8'd90; shiftCount = 10; #200;
        plainChar = 8'd75; shiftCount = 1; #200;
        plainChar = 8'd66; shiftCount = 15; #200;
        plainChar = 8'd84; shiftCount = 25; #200;
    end
    */
    
    
    /*  CaesarDecryption  
    reg [7:0] chipherChar;
    reg [4:0] shiftCount;
    wire [7:0] decryptedChar;
    CaesarDecryption uut(chipherChar, shiftCount, decryptedChar);
    
    initial begin
        chipherChar = 8'd65; shiftCount = 3; #200;
        chipherChar = 8'd90; shiftCount = 10; #200;
        chipherChar = 8'd75; shiftCount = 1; #200;
        chipherChar = 8'd66; shiftCount = 15; #200;
        chipherChar = 8'd84; shiftCount = 25; #200;
    end
    */
    
    /*  CaesarEnvironment  
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    CaesarEnvironment uut(plainChar, shiftCount, chipherChar, decryptedChar);
    
    initial begin
        plainChar = 8'd65; shiftCount = 3; #200;
        plainChar = 8'd90; shiftCount = 10; #200;
        plainChar = 8'd75; shiftCount = 1; #200;
        plainChar = 8'd66; shiftCount = 15; #200;
        plainChar = 8'd84; shiftCount = 25; #200;
    end
    */
    
    
    /*  VigenereEncryption  
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg load,clock;
    wire [7:0] chipherChar;
    
    VigenereEncryption uut(plainChar, keyInput, load, clock, chipherChar);

    initial begin
        keyInput = "KADIROZLEM";   
        load = 0; clock = 1; #25; load = ~load; #25; load = ~load; #25;
        plainChar = "I";   #50;
        plainChar = "S";   #50;
        plainChar = "T";   #50;
        plainChar = "A";   #50;
        plainChar = "N";   #50;
        plainChar = "B";   #50;
        plainChar = "U";   #50;
        plainChar = "L";   #50;
        plainChar = "T";   #50;
        plainChar = "E";   #50;
        plainChar = "C";   #50;
        plainChar = "H";   #50;
        plainChar = "N";   #50;
        plainChar = "I";   #50;
        plainChar = "C";   #50;
        plainChar = "A";   #50;
        plainChar = "L";   #50;
    end
    always begin
        clock = ~clock;  #25;
    end
    */
    
    /*  VigenereDecryption  
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg load,clock;
    wire [7:0] chipherChar;
    
    VigenereDecryption uut(plainChar, keyInput, 
                            load, clock, chipherChar);
    initial begin
        keyInput = "KADIROZLEM";   
        load = 0; clock = 1; #25; load = ~load; #25; load = ~load; #25;
        plainChar = "S";   #50;
        plainChar = "S";   #50;
        plainChar = "W";   #50;
        plainChar = "I";   #50;
        plainChar = "E";   #50;
        plainChar = "P";   #50;
        plainChar = "T";   #50;
        plainChar = "W";   #50;
        plainChar = "X";   #50;
        plainChar = "Q";   #50;
        plainChar = "M";   #50;
        plainChar = "H";   #50;
        plainChar = "Q";   #50;
        plainChar = "Q";   #50;
        plainChar = "T";   #50;
        plainChar = "A";   #50;
        plainChar = "L";   #50;
    end
    always begin
        clock = ~clock;  #25;
    end
    */
    
    
    
    /*  VigenereEnvironment  
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg load,clock;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    
    VigenereEnvironment uut(plainChar, keyInput, load, clock, 
                                chipherChar, decryptedChar);

    initial begin
        keyInput = "KADIROZLEM";   
        load = 0; clock = 1; #25; load = ~load; #25; load = ~load; #25;
        plainChar = "I";   #50;
        plainChar = "S";   #50;
        plainChar = "T";   #50;
        plainChar = "A";   #50;
        plainChar = "N";   #50;
        plainChar = "B";   #50;
        plainChar = "U";   #50;
        plainChar = "L";   #50;
        plainChar = "T";   #50;
        plainChar = "E";   #50;
        plainChar = "C";   #50;
        plainChar = "H";   #50;
        plainChar = "N";   #50;
        plainChar = "I";   #50;
        plainChar = "C";   #50;
        plainChar = "A";   #50;
        plainChar = "L";   #50;
    end
    always begin
        clock = ~clock;  #25;
    end
    */
    
    
    
    /*   PlugBoard   
    reg [25:0] charInput;
    reg [25:0] backwardInput;
    wire [25:0] forwardOutput;
    wire [25:0] backwardOutput;    
    
    PlugBoard uut(charInput, backwardInput, forwardOutput, backwardOutput);
    
    initial begin
        charInput = 26'h2000000; backwardInput=26'h2000000; #200;
        charInput = 26'h0080000; backwardInput=26'h0001000; #200;
        charInput = 26'h0002000; backwardInput=26'h0020000; #200;
        charInput = 26'h0000001; backwardInput=26'h0100000; #200;
        charInput = 26'h0000040; backwardInput=26'h0000800; #200;
    end
    */

    /*    Rotor1    
    reg [25:0] charInput;
    reg [25:0] backwardInput;
    reg [4:0] startPosition1;
    reg load, clock;
    wire clock1;
    wire [25:0] forwardOutput;
    wire [25:0] backwardOutput;    
    Rotor1 uut(charInput, backwardInput, startPosition1, load, clock, 
                                clock1, forwardOutput, backwardOutput);
    
    initial begin
        clock = 0; charInput = 26'h2000000; backwardInput = 26'h0000200;
        load = 1;  startPosition1 = 5'b00000; #200;
        load = 0;
        charInput = 26'h2000000; backwardInput = 26'h0000200;load = 0; #200;
        charInput = 26'h2000000; backwardInput = 26'h0000200; #200;
        charInput = 26'h2000000; backwardInput = 26'h0000200; #200;
        charInput = 26'h2000000; backwardInput = 26'h0000200; #200;
    end
    always begin
        clock = ~clock; #100;
    end
    */

    /*    Rotor2    
    reg [25:0] forwardInput;
    reg [25:0] backwardInput;
    reg [4:0] startPosition1;
    reg load, clock;
    wire clock1;
    wire [25:0] forwardOutput;
    wire [25:0] backwardOutput;    
    Rotor2 uut(forwardInput, backwardInput, startPosition1, load, clock, 
                                clock1, forwardOutput, backwardOutput);
    
    initial begin
        clock = 0; forwardInput = 26'h2000000; backwardInput = 26'h0000200;
        load = 1;  startPosition1 = 5'b00000; #200;
        load = 0;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200;load = 0; #200;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200; #200;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200; #200;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200; #200;
    end
    always begin
        clock = ~clock; #100;
    end
    */
    
    /*    Rotor3    
    reg [25:0] forwardInput;
    reg [25:0] backwardInput;
    reg [4:0] startPosition3;
    reg load, clock;
    wire [25:0] forwardOutput;
    wire [25:0] backwardOutput;    
    Rotor3 uut(forwardInput, backwardInput, startPosition3, load, clock, 
                                        forwardOutput, backwardOutput);
    
    initial begin
        clock = 0; forwardInput = 26'h2000000; backwardInput = 26'h0000200;
        load = 1;  startPosition3 = 5'b00000; #200;
        load = 0;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200;load = 0; #200;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200; #200;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200; #200;
        forwardInput = 26'h2000000; backwardInput = 26'h0000200; #200;
    end
    always begin
        clock = ~clock; #100;
    end
    */
    
    /*    Reflector    
    reg [25:0] inputConnection;
    wire [25:0] outputConnection;    
    Reflector uut(inputConnection,  outputConnection);
    
    initial begin
        inputConnection = 26'h2000000;  #200;
        inputConnection = 26'h0010000;  #200;
        inputConnection = 26'h000400;  #200;
        inputConnection = 26'h000080;  #200;
        inputConnection = 26'h000001;  #200;
    end
    */

    
    /*    EnigmaMachine    
    reg [7:0] char;
    reg [4:0] startPosition1, startPosition2, startPosition3;
    reg load, clock;
    wire [7:0] outChar;
    EnigmaMachine uut(char, startPosition1, startPosition2, 
                        startPosition3, load, clock, outChar);
    
    initial begin
        clock = 0; char = "A";
        load = 0;  startPosition1 = 5'b00000; 
        startPosition2 = 5'b00000; 
        startPosition3 = 5'b00000; #100;
        load = 1;   char = "N"; #100;
        char = "G"; load = 0; #100;
        char = "S"; #100;
        char = "W"; #100;
        char = "C"; #100;
        char = "W"; #100;
        char = "X"; #100;
        char = "S"; #100;
        char = "A"; #100;
    end
    always begin
        clock = ~clock; #50;
    end
    */
    
    
    /*    EnigmaCommunication    */
    reg [7:0] plainChar;
    reg [4:0] startPosition1, startPosition2, startPosition3;
    reg load, clock;
    wire [7:0] chipherChar, decryptedChar;
    EnigmaCommunication uut(plainChar, startPosition1, startPosition2, 
                startPosition3, load, clock, chipherChar, decryptedChar);
    
    initial begin
        clock = 0; plainChar = "A";
        load = 0;  startPosition1 = 5'b01010; 
        startPosition2 = 5'b00011; startPosition3 = 5'b00100; #100;
        load = 1; #100;
        load = 0; #100;
        plainChar = "S"; #100;
        plainChar = "A"; #100;
        plainChar = "X"; #100;
        plainChar = "E"; #100;
        plainChar = "L"; #100;
        plainChar = "R"; #100;
        plainChar = "W"; #100;
        plainChar = "L"; #100;
    end
    always begin
        clock = ~clock; #50;
    end
    
endmodule


















