`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 14:48:41
// Design Name: 
// Module Name: npc
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


module npc(
    input [31: 0] imm,  // 跳转的pc offset
    input jump,   //是否需要跳转
    input  [31:0] pc,
    output [31:0] npc,
    output [31:0] pc_4
    );
assign pc_4=pc+4;
    
assign npc = jump==0 ?  pc+4 : pc+imm ;

endmodule
