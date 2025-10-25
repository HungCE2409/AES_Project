`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 07:13:23 PM
// Design Name: 
// Module Name: addRoundKey_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module addRoundKey_tb;

    reg [127:0] in;
    reg [127:0] key;
    wire [127:0] out;	
    
    addRoundKey m (in, key, out);
    initial begin
        $monitor("input= %H, key = %h, output= %h", in, key, out);
        in  = 128'h046681e5_e0cb199a_48f8d37a_2806264c;
        key = 128'ha0fafe17_88542cb1_23a33939_2a6c7605;
        #1000 $finish;
    end

endmodule
