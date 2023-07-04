`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 15:26:10
// Design Name: 
// Module Name: im
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


module im(
    input [11:2] addr, // 指令存储器由32位寄存器数组表示,直接取到数组的下标；11由IM_SIZE而来
    output [31:0] inst
    );

reg[31:0] imem[`IM_SIZE:0];
assign inst=imem[addr];   //到对应位置取指令

endmodule
