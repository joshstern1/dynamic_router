`include "para.v"
module route_comp
#(
)(
    input clk,
    input rst,
    input is_head,
    input [XW-1:0] dst_x,
    input [YW-1:0] dst_y,
    input [ZW-1:0] dst_z,
    input [XW-1:0] cur_x,
    input [YW-1:0] cur_y,
    input [ZW-1:0] cur_z,
    output reg [2:0] dir //this is going to hold until next head
);

    //for simplicity start with xyz routing first
    always@(*) begin
        if(cur_x!=dst_x) begin
        
