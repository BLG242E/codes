/*
Serra BOZKURT 150190710 
Sule Beyza KARADAG 150180024
Ahmet Furkan KAVRAZ 150190024
*/

`timescale 1ns / 1ps

module Simulation();
    
    /* Buffer 
    reg [7:0] Input, enable;
    wire [7:0] Output;
    
    buffer uut(Input, enable, Output);
    
    initial begin
        Input = 8'd15;   enable = 0;   #100;
        Input = 8'd15;   enable = 1;   #100;
        Input = 8'd30;   enable = 0;   #100;
        Input = 8'd12;   enable = 1;   #100;
        Input = 8'd113;  enable = 1;   #100;
        Input = 8'd9;    enable = 0;   #100;
        Input = 8'd91;   enable = 1;   #100;
        Input = 8'd55;   enable = 0;   #100;
        Input = 8'd13;   enable = 1;   #100;
        Input = 8'd8;    enable = 0;   #100;
    end
    */
    
    /* part1     
    reg [7:0] Input1;
    reg [7:0] Input2;
    reg enable;
    wire [7:0] Output;
    
    part1 uut(Input1, Input2 , enable, Output);
    
    initial begin
        Input1 = 8'd15;   Input2 = 8'd12;   enable = 0;   #100;
        Input1 = 8'd15;   Input2 = 8'd53;   enable = 1;   #100;
        Input1 = 8'd30;   Input2 = 8'd12;   enable = 0;   #100;
        Input1 = 8'd12;   Input2 = 8'd113;  enable = 1;   #100;
        Input1 = 8'd113;  Input2 = 8'd22;   enable = 1;   #100;
        Input1 = 8'd9;    Input2 = 8'd10;   enable = 0;   #100;
        Input1 = 8'd91;   Input2 = 8'd5;    enable = 1;   #100;
        Input1 = 8'd55;   Input2 = 8'd51;   enable = 0;   #100;
        Input1 = 8'd13;   Input2 = 8'd23;   enable = 1;   #100;
        Input1 = 8'd8;    Input2 = 8'd11;   enable = 0;   #100;
    end
    */
    
    
    /*    part2   
    reg [7:0] Input1;
    reg [7:0] Input2;
    reg enable;
    wire [7:0] Output1;
    wire [7:0] Output2;
    
    part2 uut(Input1, Input2 , enable, Output1, Output2);
    
    initial begin
        Input1 = 8'd15;   Input2 = 8'd12;   enable = 0;   #100;
        Input1 = 8'd15;   Input2 = 8'd53;   enable = 1;   #100;
        Input1 = 8'd30;   Input2 = 8'd12;   enable = 0;   #100;
        Input1 = 8'd12;   Input2 = 8'd113;  enable = 1;   #100;
        Input1 = 8'd113;  Input2 = 8'd22;   enable = 1;   #100;
        Input1 = 8'd9;    Input2 = 8'd10;   enable = 0;   #100;
        Input1 = 8'd91;   Input2 = 8'd5;    enable = 1;   #100;
        Input1 = 8'd55;   Input2 = 8'd51;   enable = 0;   #100;
        Input1 = 8'd13;   Input2 = 8'd23;   enable = 1;   #100;
        Input1 = 8'd8;    Input2 = 8'd11;   enable = 0;   #100;
    end
    */

    /*    part3   
    reg [7:0] Input;
    reg reset,line_select, read_enable, write_enable, clock;
    wire [7:0] Output;
    
    part3 uut(Input, reset, line_select, read_enable, write_enable, clock, Output);
    
    initial begin
        clock = 0; reset = 0;
        Input = 8'd15;   read_enable = 0;   write_enable = 0;   line_select = 1;  #50;
        Input = 8'd15;   read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd30;   read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd12;   read_enable = 0;   write_enable = 1;   #50;
        Input = 8'd113;  read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd9;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd91;   read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd55;   read_enable = 0;   write_enable = 1;   #50;
        Input = 8'd13;   read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd8;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd15;   read_enable = 0;   write_enable = 0;   #50;
        Input = 8'd15;   read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd30;   read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd12;   read_enable = 0;   write_enable = 1;   #50;
        Input = 8'd113;  read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd9;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd91;   read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd55;   read_enable = 1;   write_enable = 0;   line_select = 0;  #50;
        Input = 8'd13;   read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd8;    read_enable = 1;   write_enable = 1;   #50;        
    end
    always begin
        clock = ~clock; #25;
    end
    always begin
        reset = ~reset; #250;
    end
    */



    /*  part4   
    reg [7:0] Input;
    reg [2:0] address;
    reg reset,chip_select, read_enable, write_enable, clock;
    wire [7:0] Output;
    part4 uut(Input, address, chip_select, reset, read_enable, write_enable, clock, Output);
    
    initial begin      
        clock = 1; reset = 0;
        Input = 8'd15;   address = 3'd0;    read_enable = 1;   write_enable = 1;   chip_select = 1;  #50;
        Input = 8'd9;    address = 3'd1;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd30;   address = 3'd2;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd12;   address = 3'd3;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd55;   address = 3'd4;    read_enable = 1;   write_enable = 1;   chip_select = 0;  #50;
        Input = 8'd113;  address = 3'd5;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd91;   address = 3'd6;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd11;   address = 3'd7;    read_enable = 1;   write_enable = 1;   chip_select = 1;  #50;
        Input = 8'd13;   address = 3'd0;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd8;    address = 3'd1;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd15;   address = 3'd2;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd15;   address = 3'd3;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd30;   address = 3'd4;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd12;   address = 3'd5;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd113;  address = 3'd6;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd9;    address = 3'd7;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd91;   address = 3'd0;    read_enable = 1;   write_enable = 0;   chip_select = 0;  #50;
        Input = 8'd55;   address = 3'd3;    read_enable = 1;   write_enable = 0;   #50;
        Input = 8'd13;   address = 3'd0;    read_enable = 1;   write_enable = 1;   #50;
        Input = 8'd8;    address = 3'd0;    read_enable = 1;   write_enable = 1;   #50;   
 
    end
    always begin
        clock = ~clock; #25;
    end
    always begin
        reset = ~reset; #750;
    end
   */
   
   
   
   
    /*  part5   
    reg [7:0] Input;
    reg [4:0] address;
    reg reset, read_enable, write_enable, clock;
    wire [7:0] Output;
    part5 uut(Input, address, reset, read_enable, write_enable, clock, Output);
    
    initial begin      
        Input = 8'd1;   address = 5'd3;    read_enable = 0;   write_enable = 0;   chip_select = 0; 
        clock = 1; reset = 1; #100;
        reset = 0; #100;
        Input = 8'd25;    address = 5'd30;    read_enable = 0;   write_enable = 1;   chip_select = 1;  #100;
        Input = 8'd15;    address = 5'd20;    read_enable = 0;   write_enable = 1;   #100;
        Input = 8'd0;     address = 5'd12;    read_enable = 1;   write_enable = 0;   #100;
        Input = 8'd18;    address = 5'd10;    read_enable = 0;   write_enable = 1;   #100;
        Input = 8'd0;     address = 5'd15;    read_enable = 1;   write_enable = 0;   #100;
        Input = 8'd0;     address = 5'd30;    read_enable = 1;   write_enable = 0;   #100;
        Input = 8'd0;     address = 5'd10;    read_enable = 1;   write_enable = 1;   #100;
    end
    always begin
        clock = ~clock; #50;
    end
    */
    
    /*  part6   
    reg [31:0] Input;
    reg [4:0] address;
    reg reset, read_enable, write_enable, clock;
    wire [31:0] Output;
    part6 uut(Input, address, reset, read_enable, write_enable, clock, Output);
    
    initial begin
        Input = 32'd1;   address = 5'd3;    read_enable = 0;   write_enable = 0;   chip_select = 0; 
        clock = 1; reset = 1; #100;
        reset = 0; #100;
        Input = 32'd25;    address = 5'd30;    read_enable = 0;   write_enable = 1;   chip_select = 1;  #100;
        Input = 32'd24;    address = 5'd40;    read_enable = 0;   write_enable = 1;   #100;
        Input = 32'd0;     address = 5'd12;    read_enable = 1;   write_enable = 0;   #100;
        Input = 32'd18;    address = 5'd10;    read_enable = 0;   write_enable = 1;   #100;
        Input = 32'd0;     address = 5'd15;    read_enable = 1;   write_enable = 0;   #100;
        Input = 32'd0;     address = 5'd30;    read_enable = 1;   write_enable = 0;   #100;
        Input = 32'd0;     address = 5'd40;    read_enable = 1;   write_enable = 1;   #100;
    end
    always begin
        clock = ~clock; #50;
    end
    */
    
endmodule






