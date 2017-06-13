`include "para.v"
module route_comp
#(
)(
    input clk,
    input rst,
    input [FLIT_SIZE - 1 : 0] flit_before_RC, 
    input stall,
    input [XW - 1 : 0] dst_x,
    input [YW - 1 : 0] dst_y,
    input [ZW - 1 : 0] dst_z,
    input [XW - 1 : 0] cur_x,
    input [YW - 1 : 0] cur_y,
    input [ZW - 1 : 0] cur_z,
    output reg [FLIT_SIZE - 1 : 0] flit_after_RC,
    output reg [2 : 0] dir_out //this is going to hold until next head
);

    reg [2:0] dir;

    always@(posedge clk) begin
        if(rst) begin
            dir_out<=0;
        end
        else if(flit_before_RC[FLIT_SIZE -1 : FLIT_SIZE - 2] == HEAD_FLIT && ~stall) begin
            flit_after_RC <= flit_before_RC;
            dir_out<=dir;
        end
    end

    //for simplicity start with xyz routing first
    always@(*) begin
        if(cur_x != dst_x) begin
            if(cur_x > dst_x) begin
                if(cur_x - dst_x >= XSIZE/2) begin
                    dir = DIR_XPOS;
                end
                else begin
                    dir = DIR_XNEG;
                end
            end
            else begin
                if(dst_x - cur_x <= XSIZE/2) begin
                    dir = DIR_XPOS;
                end
                else begin
                    dir = DIR_XNEG;
                end
            end
        end
        else if(cur_y != dst_y) begin
            if(cur_y > dst_y) begin
                if(cur_y - dst_y >= YSIZE/2) begin
                    dir = DIR_YPOS;
                end
                else begin
                    dir = DIR_YNEG;
                end
            end
            else begin
                if(dst_y - cur_y) <= YSIZE/2) begin
                    dir = DIR_YPOS;
                end
                else begin
                    dir = DIR_YNEG;
                end
            end
        end
        else if(cur_z != dst_z) begin
            if(cur_z > dst_z) begin
                if(cur_z - dst_z >= ZSIZE/2) begin
                    dir = DIR_ZPOS;
                end
                else begin
                    dir = DIR_ZNEG;
                end
            end
            else begin
                if(dst_z - cur_z) <= ZSIZE/2) begin
                    dir = DIR_ZPOS;
                end 
                else begin
                    dir = DIR_ZNEG;
                end
            end
        end
        else begin
            dir = DIR_INJECT;
        end
    end
endmodule
        
