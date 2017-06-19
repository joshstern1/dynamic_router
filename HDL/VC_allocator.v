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
    input [VC_NUM - 1 : 0] full_xpos, // the full signal for xpos 
    input [VC_NUM - 1 : 0] full_ypos, // the full signal for ypos
    input [VC_NUM - 1 : 0] full_zpos, // the full signal for zpos
    input [VC_NUM - 1 : 0] full_xneg, // the full signal for xneg
    input [VC_NUM - 1 : 0] full_yneg, // the full signal for yneg
    input [VC_NUM - 1 : 0] full_zneg, // the full signal for zneg
    input [VC_NUM - 1 : 0] idle_xpos,
    input [VC_NUM - 1 : 0] idle_ypos,
    input [VC_NUM - 1 : 0] idle_zpos,
    input [VC_NUM - 1 : 0] idle_xneg,
    input [VC_NUM - 1 : 0] idle_yneg,
    input [VC_NUM - 1 : 0] idle_zneg,
    input [PORT_NUM - 1 : 0] port_valid, //xpos 0th bit, ypos 1st bit, zpos 2nd bit, xneg 3rd bit, yneg 4th bit, zneg 5th bit
    input [FLIT_SIZE - 1 : 0] flit_xpos,
    input [FLIT_SIZE - 1 : 0] flit_ypos,
    input [FLIT_SIZE - 1 : 0] flit_zpos,
    input [FLIT_SIZE - 1 : 0] flit_xneg,
    input [FLIT_SIZE - 1 : 0] flit_yneg,
    input [FLIT_SIZE - 1 : 0] flit_zneg,
    output reg [VC_NUM - 1 : 0] grant_xpos, // a one-hot coding grant
    output reg [VC_NUM - 1 : 0] grant_ypos,
    output reg [VC_NUM - 1 : 0] grant_zpos,
    output reg [VC_NUM - 1 : 0] grant_xneg,
    output reg [VC_NUM - 1 : 0] grant_yneg,
    output reg [VC_NUM - 1 : 0] grant_zneg,
    output stall_xpos,
    output stall_ypos,
    output stall_zpos,
    output stall_xneg,
    output stall_yneg,
    output stall_zneg
);

    reg [VC_NUM / 2 - 1 : 0] pre_grant_xpos; // a one-hot coding grant
    reg [VC_NUM / 2 - 1 : 0] pre_grant_ypos;
    reg [VC_NUM / 2 - 1 : 0] pre_grant_zpos;
    reg [VC_NUM / 2 - 1 : 0] pre_grant_xneg;
    reg [VC_NUM / 2 - 1 : 0] pre_grant_yneg;
    reg [VC_NUM / 2 - 1 : 0] pre_grant_zneg;

    reg [VC_NUM / 2 - 1 : 0] nxt_grant_xpos;
    reg [VC_NUM / 2 - 1 : 0] nxt_grant_ypos;
    reg [VC_NUM / 2 - 1 : 0] nxt_grant_zpos;
    reg [VC_NUM / 2 - 1 : 0] nxt_grant_xneg;
    reg [VC_NUM / 2 - 1 : 0] nxt_grant_yneg;
    reg [VC_NUM / 2 - 1 : 0] nxt_grant_zneg;

    reg [VC_NUM / 2 - 1 : 0] cur_grant_xpos;
    reg [VC_NUM / 2 - 1 : 0] cur_grant_ypos;
    reg [VC_NUM / 2 - 1 : 0] cur_grant_zpos;
    reg [VC_NUM / 2 - 1 : 0] cur_grant_xneg;
    reg [VC_NUM / 2 - 1 : 0] cur_grant_yneg;
    reg [VC_NUM / 2 - 1 : 0] cur_grant_zneg;


    wire [VC_NUM / 2 - 1 : 0] cur_idle_xpos;
    wire [VC_NUM / 2 - 1 : 0] cur_idle_ypos;
    wire [VC_NUM / 2 - 1 : 0] cur_idle_zpos;
    wire [VC_NUM / 2 - 1 : 0] cur_idle_xneg;
    wire [VC_NUM / 2 - 1 : 0] cur_idle_yneg;
    wire [VC_NUM / 2 - 1 : 0] cur_idle_zneg;


    
//  based on src and dst and cur, we can tell the vc set number
    
    wire [1 : 0] vcset_xpos; //0 means the only set 0, 1 means the only set 1, 2 means both set 0 and 1 are fine
    wire [1 : 0] vcset_ypos;
    wire [1 : 0] vcset_zpos;
    wire [1 : 0] vcset_xneg;
    wire [1 : 0] vcset_yneg;
    wire [1 : 0] vcset_zneg;
    

    always@(posedge clk) begin
        pre_grant_xpos <= cur_grant_xpos;
        pre_grant_ypos <= cur_grant_ypos;
        pre_grant_zpos <= cur_grant_zpos;
        pre_grant_xneg <= cur_grant_xneg;
        pre_grant_yneg <= cur_grant_yneg;
        pre_grant_zneg <= cur_grant_zneg;
    end

    assign cur_idle_xpos = (cur_x == 0) ? idle_xpos[VC_NUM - 1 : VC_NUM / 2] : i



    always@(*) begin
        if(cur_x == 0) begin //cross the dateline, the VC set should raise by 1 
            grant_xpos = {cur_grant_xpos, {(VC_NUM / 2){1'b0}}};
        end
        else begin
            grant_xpos = {{(VC_NUM / 2){1'b0}}, cur_grant_xpos};
        end
        if(cur_x == XSIZE - 1) begin
            grant_xneg = {{(VC_NUM / 2){1'b0}}, cur_grant_xneg};
        end
        else begin
            grant_xneg = {cur_grant_xneg, {(VC_NUM / 2){1'b0}}};
        end
        if(cur_y == 0) begin //cross the dateline, the VC set should raise by 1 
            grant_ypos = {cur_grant_ypos, {(VC_NUM / 2){1'b0}}};
        end
        else begin
            grant_ypos = {{(VC_NUM / 2){1'b0}}, cur_grant_ypos};
        end
        if(cur_y == YSIZE - 1) begin
            grant_yneg = {{(VC_NUM / 2){1'b0}}, cur_grant_yneg};
        end
        else begin
            grant_yneg = {cur_grant_yneg, {(VC_NUM / 2){1'b0}}};
        end
        if(cur_z == 0) begin //cross the dateline, the VC set should raise by 1 
            grant_zpos = {cur_grant_zpos, {(VC_NUM / 2){1'b0}}};
        end
        else begin
            grant_zpos = {{(VC_NUM / 2){1'b0}}, cur_grant_zpos};
        end
        if(cur_z == ZSIZE - 1) begin
            grant_zneg = {{(VC_NUM / 2){1'b0}}, cur_grant_zneg};
        end
        else begin
            grant_zneg = {cur_grant_zneg, {(VC_NUM / 2){1'b0}}};
        end
        
    end

    always@(posedge clk) begin
        nxt_grant_xpos
    end



    


    // associate VCs to input ports
    //generate grant_xpos
    always@(*) begin
        if(rst) begin
            grant_xpos = 0; 
        end
        else if(port_valid[0]) begin
            if(flit_xpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_xpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_xpos is a valid heady flit
                grant_xpos = nxt_grant_xpos;
            end
            else begin
                grant_xpos = pre_grant_xpos;
            end
            
            
        end
        else begin
            grant_xpos = 0;
        end
    end

    
    assign stall_xpos = full_xpos & grant_xpos;
    assign stall_ypos = full_ypos & grant_ypos;
    assign stall_zpos = full_zpos & grant_zpos;
    assign stall_xneg = full_xneg & grant_xneg;
    assign stall_yneg = full_yneg & grant_yneg;
    assign stall_zneg = full_zneg & grant_zneg;

endmodule
    


    
