`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:35:42 PM
// Design Name: 
// Module Name: AES
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


module AES(enable, e128, d128, e192, d192, e256, d256);
    output wire e128;
    output wire d128;
    output wire e192;
    output wire d192;
    output wire e256;
    output wire d256;
    input enable;

// Plain text dung lam input
wire[127:0] in = 128'h00112233445566778899aabbccddeeff;

// Cac khoa khac nhau dung kiem thu, moi loai 1 khoa
wire[127:0] key128 = 128'h000102030405060708090a0b0c0d0e0f;
wire[191:0] key192 = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
wire[255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

// Expected outpur tu module ma hoa
wire[127:0] expected128 = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
wire[127:0] expected192 = 128'hdda97ca4864cdfe06eaf70a0ec0d7191;
wire[127:0] expected256 = 128'h8ea2b7ca516745bfeafc49904b496089;

//Ket qua module ma hoa cho tung loai khoa
wire[127:0] encrypted128;
wire[127:0] encrypted192;
wire[127:0] encrypted256;

assign e128 = (encrypted128 == expected128 && enable) ? 1'b1 : 1'b0;
assign e192 = (encrypted192 == expected192 && enable) ? 1'b1 : 1'b0;
assign e256 = (encrypted256 == expected256 && enable) ? 1'b1 : 1'b0;

// Ket qua cua module giai ma
wire[127:0] decrypted128;
wire[127:0] decrypted192;
wire[127:0] decrypted256;

AES_Encrypt a(in,key128,encrypted128);
AES_Encrypt #(192,12,6) b(in,key192,encrypted192);
AES_Encrypt #(256,14,8) c(in,key256,encrypted256);

AES_Decrypt a2(encrypted128,key128,decrypted128);
AES_Decrypt #(192,12,6) b2(encrypted192,key192,decrypted192);
AES_Decrypt #(256,14,8) c2(encrypted256,key256,decrypted256);

assign d128 = (decrypted128 == in && enable) ? 1'b1 : 1'b0;
assign d192 = (decrypted192 == in && enable) ? 1'b1 : 1'b0;
assign d256 = (decrypted256 == in && enable) ? 1'b1 : 1'b0;

endmodule