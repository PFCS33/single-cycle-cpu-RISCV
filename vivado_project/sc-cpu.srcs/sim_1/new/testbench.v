`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/29 10:21:23
// Design Name: 
// Module Name: testbench
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


module testbench();
reg clk;
reg rst;

// wire [31:0] debug_reg1;
// wire [31:0] debug_reg2;
// wire [31:0] debug_reg3;
wire [31:0] pc;
wire [31:0] inst_d;
wire [31:0] data1;
wire [31:0] data2;
wire [31:0] data3;
wire [31:0] data4;
wire [31:0] data5;
// wire [31:0] res_d;
// wire [31:0] imm_d;
// wire alu_src_d;
// wire [31:0] RD22_d;

top_cpu top1(
.clk(clk), 
.rst(rst),
//debug
// .debug_reg1(debug_reg1),
// .debug_reg2(debug_reg2),
// .debug_reg3(debug_reg3),
.nowpc(pc),
.inst_d(inst_d),
.data1(data1),
.data2(data2),
.data3(data3),
.data4(data4),
.data5(data5)
);

initial begin
    // Load instructions
    $readmemh("D:/VivadoProject/sc-cpu/test/instructions.txt", top1.im1.imem);
    // Load register initial values
    $readmemh("D:/VivadoProject/sc-cpu/test/register.txt", top1.rf1.regFiles);
    // Load memory data initial values
    $readmemh("D:/VivadoProject/sc-cpu/test/data_memory.txt", top1.dm1.dmem);
    $display("value: %h",top1.im1.imem[0]);
    rst = 1;
    clk = 0;
    #30 rst = 0; // 30ns 时刻 CPU 开始运行
end

always
    #20 clk = ~clk; // 每隔 20ns 时钟信号 clk 翻转一次
endmodule
