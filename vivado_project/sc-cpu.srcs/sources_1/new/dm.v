`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 21:42:38
// Design Name: 
// Module Name: dm
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


module dm(
    input clk,
    input rst,
    input we,
    input [11:2] addr,
    input [31:0] WD,
    output [31:0] RD,
    //debug
    output [31:0] data1,
    output [31:0] data2,
    output [31:0] data3,
    output [31:0] data4,
    output [31:0] data5
    );
// 存储器
reg[31:0] dmem[`DM_SIZE:0];

assign RD=dmem[addr];

// debug
assign data1=dmem[1];
assign data2=dmem[2];
assign data3=dmem[3];
assign data4=dmem[4];
assign data5=dmem[5];

always @(posedge clk) begin
    if (rst==0 && we ) begin
        dmem[addr] <= WD;
    end
end

endmodule
