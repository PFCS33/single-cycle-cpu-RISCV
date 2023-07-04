`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 21:28:57
// Design Name: 
// Module Name: mux
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


module alu_mux(
    input alu_src,
    input [31:0] RD2,
    input [31:0] imm,
    output reg [31:0] res
    );

always @(*) begin
    case (alu_src)
        0: res=RD2;
        1: res=imm;
    endcase
end
endmodule


module reg_mux(
    input [1:0] reg_src,
    input [31:0] op_res,
    input [31:0] dmem,
    input [31:0] pc,
    output reg [31:0] res
);

always @(*) begin
    case (reg_src)
        0: res = op_res;
        1: res = dmem;
        2: res = pc;
    endcase
end
endmodule