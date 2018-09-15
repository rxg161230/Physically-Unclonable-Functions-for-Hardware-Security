`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:16 11/26/2016 
// Design Name: 
// Module Name:    mux2 
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
////////////////////////////////////////////////////////////////////////////////
module mux2 (input [3:0] sel2_i, input RO_1, RO_2, RO_3, RO_4, RO_5, RO_6,RO_7,RO_8, RO_9, RO_10, RO_11, RO_12, RO_13, 
RO_14,RO_15, RO_16, output puf_bit_o);
  
 assign puf_bit_o =(sel2_i==0)? RO_2:
  (sel2_i==1)? RO_1:
  (sel2_i==2)? RO_3:
  (sel2_i==3)? RO_4:
  (sel2_i==4)? RO_11:
  (sel2_i==5)? RO_6:
  (sel2_i==6)? RO_7:
  (sel2_i==7)? RO_8:
  (sel2_i==8)? RO_9:
  (sel2_i==9)? RO_15:
  (sel2_i==10)? RO_5:
  (sel2_i==11)? RO_12:
  (sel2_i==12)? RO_13:
  (sel2_i==13)? RO_14:
  (sel2_i==14)? RO_10 : RO_16;
  
endmodule

