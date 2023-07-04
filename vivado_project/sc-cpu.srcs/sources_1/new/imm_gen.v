`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 20:38:03
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(
    input [31:0] inst,
    output reg [31:0] imm
    );

always@(*) begin
    case(inst[6:0])
       `OPCODE_I1,          // addi
       `OPCODE_I2: begin    // lw
        // 12位立即数符号拓展
           if(inst[31] == 1)
               imm = {20'hfffff,inst[31:20]};
           else imm =  {20'h0,inst[31:20]};
       end
       `OPCODE_S: begin     //sw
           if(inst[31] == 1)
               imm = {20'hfffff,inst[31:25],inst[11:7]};
           else imm = {20'h0,inst[31:25],inst[11:7]};
       end
       `OPCODE_B: begin     //beq,blt
           if(inst[31] == 1) imm[31:13] = 19'h7ffff;
           else imm[31:13] = 19'h0;
           imm[12:0] = {inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
       end
       `OPCODE_J: begin     //jal
           if(inst[31] == 1) 
                imm = {11'h7ff,inst[31],inst[19:12],inst[20],inst[30:21],1'h0};
           else imm = {11'h0,inst[31],inst[19:12],inst[20],inst[30:21],1'h0};
       end      
    endcase
end      
endmodule
