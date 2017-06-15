`include "parameter.v" 

//the dateline exist between the id from XW - 1 and 0, when the packet come across the dateline from XW - 1 to 0, the VC set number goes from 0 to 1, when the packet come across the dateline from 0 to XW - 1 the VC set number goese from 1 to 0
module VC_allocator#(
)
(
    input clk,
    input rst,
    input [XW - 1 : 0] cur_x,
    input [YW - 1 : 0] cur_y,
    input [ZW - 1 : 0] cur_z,
    input [VC_NUM * 3 - 1 : 0] G_xpos, // the G states for xpos 
    input [VC_NUM * 3 - 1 : 0] G_ypos, // the G states for ypos
    input [VC_NUM * 3 - 1 : 0] G_zpos, // the G states for zpos
    input [VC_NUM * 3 - 1 : 0] G_xneg, // the G states for xneg
    input [VC_NUM * 3 - 1 : 0] G_yneg, // the G states for yneg
    input [VC_NUM * 3 - 1 : 0] G_zneg, // the G states for zneg
    input [PORT_NUM - 1 : 0] port_valid, //xpos 0, ypos 1, zpos 2, xneg 3, yneg 4, zneg 5
    input [FLIT_SIZE - 1 : 0] flit_xpos,
    input [FLIT_SIZE - 1 : 0] flit_ypos,
    input [FLIT_SIZE - 1 : 0] flit_zpos,
    input [FLIT_SIZE - 1 : 0] flit_xneg,
    input [FLIT_SIZE - 1 : 0] flit_yneg,
    input [FLIT_SIZE - 1 : 0] flit_zneg,
    output reg [VC_NUM - 1 : 0] grant_xpos, //
    output reg [VC_NUM - 1 : 0] grant_ypos,
    output reg [VC_NUM - 1 : 0] grant_zpos,
    output reg [VC_NUM - 1 : 0] grant_xneg,
    output reg [VC_NUM - 1 : 0] grant_yneg,
    output reg [VC_NUM - 1 : 0] grant_zneg
)
    
    
