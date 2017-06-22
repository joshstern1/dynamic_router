`include "para.v"


//the packet format:
//head flit   |type|VC class|dst|cmp|payload| 
//body flits  |type|                 payload|
//tail flit   |type|                 payload|
//
//the |cmp| field will be the priority field for the switch allocation
//if the SA policy is farthest first, this will be the distance from the destination node to the current node, if the SA policy is the oldest first, this will be the time stamp when this packet is sent

module route_comp
#(
)(
    input clk,
    input rst,
    input [FLIT_SIZE - 1 : 0] flit_before_RC, 
    input stall,
    input [2 : 0] dir_in,
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

    reg new_VC_class; 
    wire old_VC_class;

    reg turn;


    assign old_VC_class = flit_before_RC[FLIT_SIZE -  HEADER_LEN];

    //the VC_class needs to be changed when either crossing the dateline or changing dimension

    always@(*) begin
        if(dir_in != dir_out + 3 && dir_out != dir_in + 3) begin
            if(dir_out == DIR_XPOS || dir_out == DIR_YPOS || dir_out == DIR_ZPOS) begin
                new_VC_class = 0;
            end
            else begin 
                new_VC_class = 1;
            end
        end
        else begin 
            case(dir_out)
                DIR_XPOS: begin
                    if(cur_x == 0) begin
                        new_VC_class = 1;
                    end
                    else begin
                        new_VC_class = old_VC_class;
                    end
                end
                CIR_XNEG: begin
                    if(cur_x == XSIZE - 1) begin
                        new_VC_class = 0;
                    end
                    else begin
                        new_VC_class = old_VC_class;
                    end
                
                end
                DIR_YPOS: begin
                    if(cur_y == 0) begin
                        new_VC_class = 1;
                    end
                    else begin
                        new_VC_class = old_VC_class;
                    end
                end
                CIR_YNEG: begin
                    if(cur_y == YSIZE - 1) begin
                        new_VC_class = 0;
                    end
                    else begin
                        new_VC_class = old_VC_class;
                    end
                
                end
                DIR_ZPOS: begin
                    if(cur_z == 0) begin
                        new_VC_class = 1;
                    end
                    else begin
                        new_VC_class = old_VC_class;
                    end
                end
                CIR_ZNEG: begin
                    if(cur_z == ZSIZE - 1) begin
                        new_VC_class = 0;
                    end
                    else begin
                        new_VC_class = old_VC_class;
                    end
                
                end
                default:
                    new_VC_class = old_VC_class;


                
            endcase
        end
    end


    

    always@(posedge clk) begin
        if(rst) begin
            dir_out<=0;
        end
        else if(~ stall) begin
            flit_after_RC <= {flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN],new_VC_class,flit_before_RC[FLIT_SIZE - HEADER_LEN - 1  : 0]};
            if((flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT) || (flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT))begin
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
        
