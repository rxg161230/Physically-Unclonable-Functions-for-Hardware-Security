`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:00 11/26/2016 
// Design Name: 
// Module Name:    mux1 
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
/////////////////////////////////////////////////////////////////////////////////
module mux1 (input [3:0]sel1_i, input RO_1, RO_2, RO_3, RO_4, RO_5, RO_6,RO_7,RO_8, RO_9, RO_10, RO_11, RO_12, RO_13, 
RO_14,RO_15, RO_16, output finish_o);
  
 assign finish_o =(sel1_i==0)? RO_1:
  (sel1_i==1)? RO_2:
  (sel1_i==2)? RO_3:
  (sel1_i==3)? RO_4:
  (sel1_i==4)? RO_5:
  (sel1_i==5)? RO_6:
  (sel1_i==6)? RO_7:
  (sel1_i==7)? RO_8:
  (sel1_i==8)? RO_9:
  (sel1_i==9)? RO_10:
  (sel1_i==10)? RO_11:
  (sel1_i==11)? RO_12:
  (sel1_i==12)? RO_13:
  (sel1_i==13)? RO_14:
  (sel1_i==14)? RO_15 : RO_16;
  
endmodule

