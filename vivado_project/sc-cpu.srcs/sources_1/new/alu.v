`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 14:27:26
// Design Name: 
// Module Name: alu
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


module alu(
    input [`ALU_LEN-1:0] op,
    input [31:0] in1,
    input [31:0] in2,
    output ZF,
    output SF,
    output reg [31:0] res
    );
    assign ZF=(res==0)?1:0;
    assign SF=res[31];

    always @(*) begin
        case (op)
            0: res=in1+in2;
            1: res=in1-in2;
            2: res=in1 | in2;
        endcase        
    end
endmodule
