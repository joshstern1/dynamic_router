`include "parameter.v" 
`ifdef OUTPUT_BUFFERING


//the dateline exist between the id from XW - 1 and 0, when the packet come across the dateline from XW - 1 to 0, the VC set number goes from 0 to 1, when the packet come across the dateline from 0 to XW - 1 the VC set number goese from 1 to 0
module VC_allocator#(
)
(
    input clk,
    input rst,
    input [VC_NUM - 1 : 0] full_xpos, // the full signal for xpos VCs
    input [VC_NUM - 1 : 0] full_ypos, // the full signal for ypos VCs
    input [VC_NUM - 1 : 0] full_zpos, // the full signal for zpos VCs
    input [VC_NUM - 1 : 0] full_xneg, // the full signal for xneg VCs
    input [VC_NUM - 1 : 0] full_yneg, // the full signal for yneg VCs
    input [VC_NUM - 1 : 0] full_zneg, // the full signal for zneg VCs
    input [VC_NUM - 1 : 0] idle_xpos,
    input [VC_NUM - 1 : 0] idle_ypos,
    input [VC_NUM - 1 : 0] idle_zpos,
    input [VC_NUM - 1 : 0] idle_xneg,
    input [VC_NUM - 1 : 0] idle_yneg,
    input [VC_NUM - 1 : 0] idle_zneg,
    input [PORT_NUM - 1 : 0] port_valid, //xpos 0th bit, ypos 1st bit, zpos 2nd bit, xneg 3rd bit, yneg 4th bit, zneg 5th bit
    input [ROUTE_LEN - 1 : 0] route_in_xpos,
    input [ROUTE_LEN - 1 : 0] route_in_ypos,
    input [ROUTE_LEN - 1 : 0] route_in_zpos,
    input [ROUTE_LEN - 1 : 0] route_in_xneg,
    input [ROUTE_LEN - 1 : 0] route_in_yneg,
    input [ROUTE_LEN - 1 : 0] route_in_zneg,
    
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

`ifdef INPUT_BUFFERING

    wire VC_class_xpos;
    wire VC_class_ypos;
    wire VC_class_zpos;
    wire VC_class_xneg;
    wire VC_class_yneg;
    wire VC_class_zneg;

    assign VC_class_xpos = flit_xpos[VC_CLASS_POS];
    assign VC_class_ypos = flit_ypos[VC_CLASS_POS];
    assign VC_class_zpos = flit_zpos[VC_CLASS_POS];
    assign VC_class_xneg = flit_xneg[VC_CLASS_POS];
    assign VC_class_yneg = flit_yneg[VC_CLASS_POS];
    assign VC_class_zneg = flit_zneg[VC_CLASS_POS];

    always@(*) begin
        if(~VC_class_xpos) begin
            if(idle_xpos[route_in_xpos]) begin
                stall_xpos = full_xpos[route_in_xpos];
                    grant_xpos = (1 << route_in_xpos);
            end
            else begin
                stall_xpos = 1;
                grant_xpos = 0;
            end
        end
        else begin
            if(idle_xpos[route_in_xpos + VC_NUM / 2]) begin
                stall_xpos = full_xpos[route_in_xpos + VC_NUM / 2];
                grant_xpos = (1 << (route_in_xpos + VC_NUM / 2));
            end
            else begin
                stall_xpos = 1;
                grant_xpos = 0;
            end
        end
    end


    always@(*) begin
        if(~VC_class_ypos) begin
            if(idle_ypos[route_in_ypos]) begin
                stall_ypos = full_ypos[route_in_ypos];
                grant_ypos = (1 << route_in_ypos);
            end
            else begin
                stall_ypos = 1;
                grant_ypos = 0;
            end
        end
        else begin
            if(idle_ypos[route_in_ypos + VC_NUM / 2]) begin
                stall_ypos = full_ypos[route_in_ypos + VC_NUM / 2];
                grant_ypos = (1 << (route_in_ypos + VC_NUM / 2));
            end
            else begin
                stall_ypos = 1;
                grant_ypos = 0;
            end
        end
    end

    always@(*) begin
        if(~VC_class_zpos) begin
            if(idle_zpos[route_in_zpos]) begin
                stall_zpos = full_zpos[route_in_zpos];
                grant_zpos = (1 << route_in_zpos);
            end
            else begin
                stall_zpos = 1;
                grant_zpos = 0;
            end
        end
        else begin
            if(idle_zpos[route_in_zpos + VC_NUM / 2]) begin
                stall_zpos = full_zpos[route_in_zpos + VC_NUM / 2];
                grant_zpos = (1 << (route_in_zpos + VC_NUM / 2));
            end
            else begin
                stall_zpos = 1;
                grant_zpos = 0;
            end
        end
    end

    always@(*) begin
        if(~VC_class_xneg) begin
            if(idle_xneg[route_in_xneg]) begin
                stall_xneg = full_xneg[route_in_xneg];
                grant_xneg = (1 << route_in_xneg);
            end
            else begin
                stall_xneg = 1;
                grant_xneg = 0;
            end
        end
        else begin
            if(idle_xneg[route_in_xneg + VC_NUM / 2]) begin
                stall_xneg = full_xneg[route_in_xneg + VC_NUM / 2];
                grant_xneg = (1 << (route_in_xneg + VC_NUM / 2));
            end
            else begin
                stall_xneg = 1;
                grant_xneg = 0;
            end
        end
    end

    always@(*) begin
        if(~VC_class_yneg) begin
            if(idle_yneg[route_in_yneg]) begin
                stall_yneg = full_yneg[route_in_yneg];
                grant_yneg = (1 << route_in_yneg);
            end
            else begin
                stall_yneg = 1;
                grant_yneg = 0;
            end
        end
        else begin
            if(idle_yneg[route_in_yneg + VC_NUM / 2]) begin
                stall_yneg = full_yneg[route_in_yneg + VC_NUM / 2];
                grant_yneg = (1 << (route_in_yneg + VC_NUM / 2));
            end
            else begin
                stall_yneg = 1;
                grant_yneg = 0;
            end
        end
    end

    always@(*) begin
        if(~VC_class_zneg) begin
            if(idle_zneg[route_in_zneg]) begin
                stall_zneg = full_zneg[route_in_zneg];
                grant_zneg = (1 << route_in_zneg);
            end
            else begin
                stall_zneg = 1;
                grant_zneg = 0;
            end
        end
        else begin
            if(idle_zneg[route_in_zneg + VC_NUM / 2]) begin
                stall_zneg = full_zneg[route_in_zneg + VC_NUM / 2];
                grant_zneg = (1 << (route_in_zneg + VC_NUM / 2));
            end
            else begin
                stall_zneg = 1;
                grant_zneg = 0;
            end
        end
    end

`else

    reg [VC_NUM - 1 : 0] pre_grant_xpos; // a one-hot coding grant
    reg [VC_NUM - 1 : 0] pre_grant_ypos;
    reg [VC_NUM - 1 : 0] pre_grant_zpos;
    reg [VC_NUM - 1 : 0] pre_grant_xneg;
    reg [VC_NUM - 1 : 0] pre_grant_yneg;
    reg [VC_NUM - 1 : 0] pre_grant_zneg;

    reg [VC_NUM - 1 : 0] nxt_grant_xpos;
    reg [VC_NUM - 1 : 0] nxt_grant_ypos;
    reg [VC_NUM - 1 : 0] nxt_grant_zpos;
    reg [VC_NUM - 1 : 0] nxt_grant_xneg;
    reg [VC_NUM - 1 : 0] nxt_grant_yneg;
    reg [VC_NUM - 1 : 0] nxt_grant_zneg;

    reg [VC_NUM - 1 : 0] cur_grant_xpos;
    reg [VC_NUM - 1 : 0] cur_grant_ypos;
    reg [VC_NUM - 1 : 0] cur_grant_zpos;
    reg [VC_NUM - 1 : 0] cur_grant_xneg;
    reg [VC_NUM - 1 : 0] cur_grant_yneg;
    reg [VC_NUM - 1 : 0] cur_grant_zneg;


    wire [VC_NUM - 1 : 0] cur_idle_xpos;
    wire [VC_NUM - 1 : 0] cur_idle_ypos;
    wire [VC_NUM - 1 : 0] cur_idle_zpos;
    wire [VC_NUM - 1 : 0] cur_idle_xneg;
    wire [VC_NUM - 1 : 0] cur_idle_yneg;
    wire [VC_NUM - 1 : 0] cur_idle_zneg;


    wire VC_class_xpos;
    wire VC_class_ypos;
    wire VC_class_zpos;
    wire VC_class_xneg;
    wire VC_class_yneg;
    wire VC_class_zneg;

    wire VA_stall_xpos;
    wire VA_stall_ypos;
    wire VA_stall_zpos;
    wire VA_stall_xneg;
    wire VA_stall_yneg;
    wire VA_stall_zneg;

    assign VC_class_xpos = flit_xpos[VC_CLASS_POS];
    assign VC_class_ypos = flit_ypos[VC_CLASS_POS];
    assign VC_class_zpos = flit_zpos[VC_CLASS_POS];
    assign VC_class_xneg = flit_xneg[VC_CLASS_POS];
    assign VC_class_yneg = flit_yneg[VC_CLASS_POS];
    assign VC_class_zneg = flit_zneg[VC_CLASS_POS];




    always@(*) begin
        if(~VC_class_xpos) begin //low class allocate to VC_NUM - 2 : 0
            if(idle_xpos[VC_NUM - 2 : 0] == 0) begin 
                VA_stall_xpos = 1;
                nxt_grant_xpos = 0;
            end
            else begin
                VA_stall_xpos = 0;
                nxt_grant_xpos = {1'b0, idle_xpos[VC_NUM - 2 : 0] & (~idle_xpos[VC_NUM - 2 : 0] + 1)};
            end
        end
        else begin
            if(idle_xpos[VC_NUM - 1 : 1] == 0) begin
                VA_stall_xpos = 1;
                nxt_grant_xpos = 0;
            end
            else begin
                VA_stall_xpos = 0;
                nxt_grant_xpos = {idle_xpos[VC_NUM - 1 : 1] & (~idle_xpos[VC_NUM - 1 : 1] + 1), 1'b0};
            end
        end
    end


   always@(*) begin
        if(~VC_class_ypos) begin //low class allocate to VC_NUM - 2 : 0
            if(idle_ypos[VC_NUM - 2 : 0] == 0) begin 
                VA_stall_ypos = 1;
                nxt_grant_ypos = 0;
            end
            else begin
                VA_stall_ypos = 0;
                nxt_grant_ypos = {1'b0, idle_ypos[VC_NUM - 2 : 0] & (~idle_ypos[VC_NUM - 2 : 0] + 1)};
            end
        end
        else begin
            if(idle_ypos[VC_NUM - 1 : 1] == 0) begin
                VA_stall_ypos = 1;
                nxt_grant_ypos = 0;
            end
            else begin
                VA_stall_ypos = 0;
                nxt_grant_ypos = {idle_ypos[VC_NUM - 1 : 1] & (~idle_ypos[VC_NUM - 1 : 1] + 1), 1'b0};
            end
        end
    end


    always@(*) begin
        if(~VC_class_zpos) begin //low class allocate to VC_NUM - 2 : 0
            if(idle_zpos[VC_NUM - 2 : 0] == 0) begin 
                VA_stall_zpos = 1;
                nxt_grant_zpos = 0;
            end
            else begin
                VA_stall_zpos = 0;
                nxt_grant_zpos = {1'b0, idle_zpos[VC_NUM - 2 : 0] & (~idle_zpos[VC_NUM - 2 : 0] + 1)};
            end
        end
        else begin
            if(idle_zpos[VC_NUM - 1 : 1] == 0) begin
                VA_stall_zpos = 1;
                nxt_grant_zpos = 0;
            end
            else begin
                VA_stall_zpos = 0;
                nxt_grant_zpos = {idle_zpos[VC_NUM - 1 : 1] & (~idle_zpos[VC_NUM - 1 : 1] + 1), 1'b0};
            end
        end
    end


    always@(*) begin
        if(~VC_class_xneg) begin //low class allocate to VC_NUM - 2 : 0
            if(idle_xneg[VC_NUM - 2 : 0] == 0) begin 
                VA_stall_xneg = 1;
                nxt_grant_xneg = 0;
            end
            else begin
                VA_stall_xneg = 0;
                nxt_grant_xneg = {1'b0, idle_xneg[VC_NUM - 2 : 0] & (~idle_xneg[VC_NUM - 2 : 0] + 1)};
            end
        end
        else begin
            if(idle_xneg[VC_NUM - 1 : 1] == 0) begin
                VA_stall_xneg = 1;
                nxt_grant_xneg = 0;
            end
            else begin
                VA_stall_xneg = 0;
                nxt_grant_xneg = {idle_xneg[VC_NUM - 1 : 1] & (~idle_xneg[VC_NUM - 1 : 1] + 1), 1'b0};
            end
        end
    end


    always@(*) begin
        if(~VC_class_yneg) begin //low class allocate to VC_NUM - 2 : 0
            if(idle_yneg[VC_NUM - 2 : 0] == 0) begin 
                VA_stall_yneg = 1;
                nxt_grant_yneg = 0;
            end
            else begin
                VA_stall_yneg = 0;
                nxt_grant_yneg = {1'b0, idle_yneg[VC_NUM - 2 : 0] & (~idle_yneg[VC_NUM - 2 : 0] + 1)};
            end
        end
        else begin
            if(idle_yneg[VC_NUM - 1 : 1] == 0) begin
                VA_stall_yneg = 1;
                nxt_grant_yneg = 0;
            end
            else begin
                VA_stall_yneg = 0;
                nxt_grant_yneg = {idle_yneg[VC_NUM - 1 : 1] & (~idle_yneg[VC_NUM - 1 : 1] + 1), 1'b0};
            end
        end
    end


    always@(*) begin
        if(~VC_class_zneg) begin //low class allocate to VC_NUM - 2 : 0
            if(idle_zneg[VC_NUM - 2 : 0] == 0) begin 
                VA_stall_zneg = 1;
                nxt_grant_zneg = 0;
            end
            else begin
                VA_stall_zneg = 0;
                nxt_grant_zneg = {1'b0, idle_zneg[VC_NUM - 2 : 0] & (~idle_zneg[VC_NUM - 2 : 0] + 1)};
            end
        end
        else begin
            if(idle_zneg[VC_NUM - 1 : 1] == 0) begin
                VA_stall_zneg = 1;
                nxt_grant_zneg = 0;
            end
            else begin
                VA_stall_zneg = 0;
                nxt_grant_zneg = {idle_zneg[VC_NUM - 1 : 1] & (~idle_zneg[VC_NUM - 1 : 1] + 1), 1'b0};
            end
        end
    end

    

    always@(posedge clk) begin
        pre_grant_xpos <= cur_grant_xpos;
        pre_grant_ypos <= cur_grant_ypos;
        pre_grant_zpos <= cur_grant_zpos;
        pre_grant_xneg <= cur_grant_xneg;
        pre_grant_yneg <= cur_grant_yneg;
        pre_grant_zneg <= cur_grant_zneg;
    end


    


    // associate VCs to input ports
    //generate grant_xpos
    always@(*) begin
        if(rst) begin
            grant_xpos = 0; 
        end
        else if(port_valid[0]) begin
            if(flit_xpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_xpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_xpos is a valid head flit
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

    always@(*) begin
        if(rst) begin
            grant_ypos = 0; 
        end
        else if(port_valid[1]) begin
            if(flit_ypos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_ypos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_ypos is a valid head flit
                grant_ypos = nxt_grant_ypos;
            end
            else begin
                grant_ypos = pre_grant_ypos;
            end     
        end
        else begin
            grant_ypos = 0;
        end
    end

    always@(*) begin
        if(rst) begin
            grant_zpos = 0; 
        end
        else if(port_valid[2]) begin
            if(flit_zpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_zpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_zpos is a valid head flit
                grant_zpos = nxt_grant_zpos;
            end
            else begin
                grant_zpos = pre_grant_zpos;
            end     
        end
        else begin
            grant_zpos = 0;
        end
    end

    always@(*) begin
        if(rst) begin
            grant_xneg = 0; 
        end
        else if(port_valid[3]) begin
            if(flit_xneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_xneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_xneg is a valid head flit
                grant_xneg = nxt_grant_xneg;
            end
            else begin
                grant_xneg = pre_grant_xneg;
            end     
        end
        else begin
            grant_xneg = 0;
        end
    end

    always@(*) begin
        if(rst) begin
            grant_yneg = 0; 
        end
        else if(port_valid[4]) begin
            if(flit_yneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_yneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_yneg is a valid head flit
                grant_yneg = nxt_grant_yneg;
            end
            else begin
                grant_yneg = pre_grant_yneg;
            end     
        end
        else begin
            grant_yneg = 0;
        end
    end

    always@(*) begin
        if(rst) begin
            grant_zneg = 0; 
        end
        else if(port_valid[5]) begin
            if(flit_zneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_zneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) begin // the flit_zneg is a valid head flit
                grant_zneg = nxt_grant_zneg;
            end
            else begin
                grant_zneg = pre_grant_zneg;
            end     
        end
        else begin
            grant_zneg = 0;
        end
    end

    
    assign stall_xpos = VA_stall_xpos || ((full_xpos & grant_xpos) != 0);
    assign stall_ypos = VA_stall_ypos || ((full_ypos & grant_ypos) != 0);
    assign stall_zpos = VA_stall_zpos || ((full_zpos & grant_zpos) != 0);
    assign stall_xneg = VA_stall_xneg || ((full_xneg & grant_xneg) != 0);
    assign stall_yneg = VA_stall_yneg || ((full_yneg & grant_yneg) != 0);
    assign stall_zneg = VA_stall_zneg || ((full_zneg & grant_zneg) != 0);


`endif
endmodule
    


    
