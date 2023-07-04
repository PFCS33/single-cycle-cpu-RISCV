`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 17:21:52
// Design Name: 
// Module Name: cu
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


module cu(
    input [6:0] opcode,
    input [6:0] func7,
    input [2:0] func3,

    //跳转分支指令的选择信号,0表示不跳转,1表示jal,2表示beq,3表示blt
    output reg [`BRANCH_LEN-1:0] branch,   
    // ALU第二个操作数的选择信号,0表示第二个寄存器，1表示立即数
    output reg alu_src,         
    // 寄存器写回数据的选择信号, 0表示alu结果，1表示数据存储器，2表示 pc+4
    output reg [1:0] reg_src,   
    // 运算符的选择信号,0为+，1为-,2为|
    output reg [`ALU_LEN-1:0] alu_op,  
    // 存储器写使能
    output reg dmem_we,        
    // 寄存器堆写使能
    output reg reg_we           
    );

// 进行指令译码，并输出控制信号
always@(*) begin
    case(opcode) 
       `OPCODE_R: begin //add ,sub
            if(func7 == `FUNC7_ADD) alu_op = 0;
            else if(func7 == `FUNC7_SUB) alu_op = 1;
            branch = 0;
            reg_src = 0;
            alu_src = 0;
            reg_we = 1;
            dmem_we = 0;
        end
        `OPCODE_I1: begin //addi,ori
            if (func3==`FUNC3_ADDI) alu_op = 0;
            else if(func3==`FUNC3_ORI) alu_op=2;
            branch=0;
            reg_src=0;
            alu_src = 1;
            reg_we = 1;
            dmem_we = 0;
       end
       `OPCODE_I2: begin// lw
            alu_op = 0;
            branch=0;
            reg_src = 1;
            alu_src = 1;
            reg_we = 1;
            dmem_we = 0;
        end
       `OPCODE_S: begin// sw
            alu_op = 0;
            branch=0;
            reg_src = 0;
            alu_src = 1;
            reg_we = 0;
            dmem_we = 1;
        end
       `OPCODE_B: begin
           if(func3 == `FUNC3_BEQ) begin// beq
               alu_op = 1;
               branch=2;
               reg_src = 2;
               alu_src = 0;
               reg_we = 0;
               dmem_we = 0;
            end
            else if(func3 == `FUNC3_BLT) begin //blt
               alu_op = 1;
               branch=3;
               reg_src = 2;
               alu_src = 0;
               reg_we = 0;
               dmem_we = 0;
            end
       end
       7'b1101111: begin//jal
           alu_op = 0;
           branch=1;
           reg_src = 2;
           alu_src = 0;
           reg_we = 1;
           dmem_we = 0;
       end
    endcase
end                
endmodule
