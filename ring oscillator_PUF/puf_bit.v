`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:35 11/26/2016 
// Design Name: 
// Module Name:    puf_bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module puf_bit( clk_i, rst_i , sel1_i    ,sel2_i ,   finish_o	 ,
					puf_bit_o
    );

input clk_i;
input rst_i;

input [3 : 0] sel1_i;
input [3 : 0] sel2_i;
output finish_o;
output puf_bit_o;
wire clk_i;
wire rst_i;
wire [3 : 0] sel1_i;
wire [3 : 0] sel2_i;
wire finish_o;
wire puf_bit_o;
wire RO_1, RO_2, RO_3, RO_4, RO_5, RO_6,RO_7,RO_8, RO_9, RO_10, RO_11, RO_12, RO_13, RO_14,
RO_15, RO_16;

RO_Top ro (  .rst_i(rst_i),
             .RO_1(RO_1),
				 .RO_2(RO_2),
				 .RO_3(RO_3),
				 .RO_4(RO_4),
				 .RO_5(RO_5),
				 .RO_6(RO_6),
				 .RO_7(RO_7),
				 .RO_8(RO_8),
				 .RO_9(RO_9),
				 .RO_10(RO_10), 
				 .RO_11(RO_11), 
				 .RO_12(RO_12), 
				 .RO_13(RO_13), 
				 .RO_14(RO_14), 
				 .RO_15(RO_15), 
				 .RO_16(RO_16));
				 
mux1  mux ( .sel1_i(sel1_i),
             .RO_1(RO_1),
				 .RO_2(RO_2),
				 .RO_3(RO_3),
				 .RO_4(RO_4),
				 .RO_5(RO_5),
				 .RO_6(RO_6),
				 .RO_7(RO_7),
				 .RO_8(RO_8),
				 .RO_9(RO_9),
				 .RO_10(RO_10), 
				 .RO_11(RO_11),
				 .RO_12(RO_12),
				 .RO_13(RO_13), 
             .RO_14(RO_14),
				 .RO_15(RO_15), 
				 .RO_16(RO_16),
				 .finish_o(finish_o));

mux2 mux2 ( .sel2_i(sel2_i),
             .RO_2(RO_2),
				 .RO_1(RO_1),
				 .RO_3(RO_3),
				 .RO_4(RO_4),
				 .RO_5(RO_5),
				 .RO_6(RO_6),
				 .RO_7(RO_7),
				 .RO_8(RO_8),
				 .RO_9(RO_9),
				 .RO_10(RO_10), 
				 .RO_11(RO_11),
				 .RO_12(RO_12),
				 .RO_13(RO_13), 
             .RO_14(RO_14),
				 .RO_15(RO_15), 
				 .RO_16(RO_16),
				 .puf_bit_o(puf_bit_o));	
endmodule				 