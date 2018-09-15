`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:38 11/26/2016 
// Design Name: 
// Module Name:    RO_Top 
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
module RO_Top(rst_i, RO_1,RO_2, RO_3, RO_4, RO_5, RO_6, RO_7, RO_8, RO_9, RO_10, RO_11, RO_12, RO_13, RO_14, RO_15, RO_16);

input rst_i;
output RO_1,RO_2, RO_3, RO_4, RO_5, RO_6, RO_7, RO_8, RO_9, RO_10, RO_11, RO_12, RO_13, RO_14, RO_15, RO_16;
wire RO_1,RO_2, RO_3, RO_4, RO_5, RO_6, RO_7, RO_8, RO_9, RO_10, RO_11, RO_12, RO_13, RO_14, RO_15, RO_16;

ring_oscilator u1( .rst_i(rst_i),
        .ro_o(RO_1) 
           );
ring_oscilator u2( .rst_i(rst_i),
        .ro_o(RO_2)
           );
ring_oscilator u3( .rst_i(rst_i),
        .ro_o(RO_3)
           );
ring_oscilator u4( .rst_i(rst_i),
        .ro_o(RO_4)
           );
ring_oscilator u5( .rst_i(rst_i),
        .ro_o(RO_5)
           );
ring_oscilator u6( .rst_i(rst_i),
        .ro_o(RO_6)
           );
ring_oscilator u7( .rst_i(rst_i),
        .ro_o(RO_7)
           );
ring_oscilator u8( .rst_i(rst_i),
        .ro_o(RO_8)
           );
ring_oscilator u9( .rst_i(rst_i),
        .ro_o(RO_9)
           );
ring_oscilator u10( .rst_i(rst_i),
        .ro_o(RO_10)
           );
ring_oscilator u11(   .rst_i(rst_i),      .ro_o(RO_11)
           );
ring_oscilator u12( .rst_i(rst_i),
        .ro_o(RO_12)
           );
ring_oscilator u13( .rst_i(rst_i),
        .ro_o(RO_13)
           );
ring_oscilator u14( .rst_i(rst_i),
        .ro_o(RO_14)
           );
ring_oscilator u15( .rst_i(rst_i),
        .ro_o(RO_15)
           );
ring_oscilator u16( .rst_i(rst_i),
        .ro_o(RO_16)
           );
			  
			  

endmodule
