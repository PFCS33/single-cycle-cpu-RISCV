// define macro value 

// 寄存器的初始值
`define DEFAULT_VAL 32'h0

// 指令存储器和数据存储器大小
`define IM_SIZE       1023
`define DM_SIZE       1023

// 跳转控制信号位数
`define BRANCH_LEN 2

// 符号选择信号位数
`define ALU_LEN 2

// 使用到的opcode字段值
`define OPCODE_R 7'b0110011    //add,sub
`define OPCODE_I1 7'b0010011    //addi,ori
`define OPCODE_I2 7'b0000011    //lw
`define OPCODE_S 7'b0100011     //sw
`define OPCODE_B 7'b1100011     //beq, blt
`define OPCODE_J 7'b1101111     //jal

// 使用到的func字段值
`define FUNC3_ADDSUB 3'b000     //add,sub
`define FUNC3_ADDI 3'b000       //addi
`define FUNC3_ORI 3'b110        //ori
`define FUNC7_ADD 7'b0000000    //add
`define FUNC7_SUB 7'b0100000    //sub
`define FUNC3_BEQ 3'b000        //beq
`define FUNC3_BLT 3'b100        //blt

