`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 17:22:33
// Design Name: 
// Module Name: rf
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


module rf(
    input clk,  
    input rst,
    input we,           //写使能
    input [4:0] RA1,    //读地址1 (寄存器数组的下标)
    input [4:0] RA2,    //读地址2
    input [4:0] WA,     //写地址
    input [31:0] WD,    //写数据

    output [31:0] RD1,  //读出的数据1
    output [31:0] RD2,  //读出的数据2
    output [31:0] debug_reg1,
    output [31:0] debug_reg2,
    output [31:0] debug_reg3
    
    );

reg [31:0] regFiles [0:31];     //寄存器堆

always @(posedge clk) begin //时钟上升沿写数据
    if(rst==0 && we && WA>0 ) begin   //写使能置1且非0号寄存器
        regFiles[WA] <= WD;
    end
end

// 读寄存器数据
assign RD1=(RA1==0)? `DEFAULT_VAL: regFiles[RA1];
assign RD2=(RA2==0)? `DEFAULT_VAL: regFiles[RA2];
assign debug_reg1=regFiles[1];
assign debug_reg2=regFiles[2];
assign debug_reg3=regFiles[3];
endmodule
