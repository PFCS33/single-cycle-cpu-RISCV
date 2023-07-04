`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 14:49:40
// Design Name: 
// Module Name: pc
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


module pc(  
    input  clk, //时钟信号
    input  rst, //复位信号
    input [31:0] npc, // 下一个指令地址
    output reg [31:0] pc  //输出的pc值
    );

    always @(posedge clk, posedge rst) begin
        if (rst) 
            pc <= `DEFAULT_VAL; //如果复位信号置1，则pc设为默认值
        else 
            pc <= npc;  // 否则正常取下一个指令地址
    end
endmodule
