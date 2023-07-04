`timescale 1ns / 1ps
`include "macro.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 14:26:48
// Design Name: 
// Module Name: top_cpu
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


module top_cpu(
    input clk,
    input rst,

    // debug
    output [31:0] data1,
    output [31:0] data2,
    output [31:0] data3,
    output [31:0] data4,
    output [31:0] data5,
    output [31:0] debug_reg1,
    output [31:0] debug_reg2,
    output [31:0] debug_reg3,
    output [31:0] nowpc,
    output [31:0] inst_d,
    output [31:0] res_d,
    output [31:0] imm_d,
    output alu_src_d,
    output [31:0] RD22_d
    );

wire [31:0] pc, npc, pc_4;
wire [31:0] inst;

wire [`BRANCH_LEN-1:0] branch;
wire [`ALU_LEN-1:0] alu_op;
wire [1:0] reg_src;
wire alu_src;
wire ZF,SF;
wire dmem_we,reg_we;
reg jump;

wire [31:0] RD1,RD2,WD;
wire [31:0] imm;    //immgen
wire [31:0] res;    // 计算结果
wire [31:0] RD22;    //alu mux

wire [31:0] RD;

wire [31:0] RF_RB;  // reg mux

// debug
assign nowpc=pc;
assign inst_d=inst;
assign res_d=res;
assign imm_d=imm;
assign alu_src_d=alu_src;
assign RD22_d=RD22;

always @(*) begin
    case (branch)
        0:  jump=0;
        1:  jump=1;
        2:  jump=ZF?1:0;
        3:  jump=SF?1:0;
    endcase
end

pc pc1(.clk(clk),
    .rst(rst),
    .npc(npc),
    .pc(pc));

npc npc1(
    .imm(imm),
    .jump(jump),
    .pc(pc),
    .npc(npc),
    .pc_4(pc_4)
);

im im1(
    .addr(pc[11:2]),
    .inst(inst)
);

cu cu1(
    .opcode(inst[6:0]),
    .func7(inst[31:25]),
    .func3(inst[14:12]),
    .branch(branch),
    .alu_src(alu_src),
    .reg_src(reg_src),
    .alu_op(alu_op),
    .dmem_we(dmem_we),
    .reg_we(reg_we)
);

rf rf1(
    .clk(clk),
    .rst(rst),
    .we(reg_we),
    .RA1(inst[19:15]),
    .RA2(inst[24:20]),
    .WA(inst[11:7]),
    .WD(RF_RB),
    .RD1(RD1),
    .RD2(RD2),
    .debug_reg1(debug_reg1),
    .debug_reg2(debug_reg2),
    .debug_reg3(debug_reg3)
);

imm_gen imm_gen1(
    .inst(inst),
    .imm(imm)
);

alu_mux alu_mux1(
    .alu_src(alu_src),
    .RD2(RD2),
    .imm(imm),
    .res(RD22)
);

alu alu1(
    .op(alu_op),
    .in1(RD1),
    .in2(RD22),
    .ZF(ZF),
    .SF(SF),
    .res(res)
);

dm dm1(
    .clk(clk),    
    .rst(rst),
    .we(dmem_we),
    .addr(res[11:2]),
    .WD(RD2),
    .RD(RD),
    
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .data4(data4),
    .data5(data5)
);

reg_mux reg_mux1(
    .reg_src(reg_src),
    .op_res(res),
    .dmem(RD),
    .pc(pc_4),
    .res(RF_RB)
);


endmodule
