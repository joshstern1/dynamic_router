
`include "para.sv"
`define NEAREST_NEIGHBOR

module local_unit#(
    parameter cur_x = 3'd0,
    parameter cur_y = 3'd0
    parameter cur_z = 3'd0
(
    input clk,
    input rst,
    input [FLIT_SIZE - 1 : 0] eject_xpos,
    input eject_xpos_valid,
    input [FLIT_SIZE - 1 : 0] eject_ypos,
    input eject_ypos_valid,
    input [FLIT_SIZE - 1 : 0] eject_zpos,
    input eject_zpos_valid,
    input [FLIT_SIZE - 1 : 0] eject_xneg,
    input eject_xneg_valid,
    input [FLIT_SIZE - 1 : 0] eject_yneg,
    input eject_yneg_valid,
    input [FLIT_SIZE - 1 : 0] eject_zneg,
    input eject_zneg_valid,

    output  [FLIT_SIZE - 1 : 0] inject_xpos,
    output inject_xpos_valid,
    output [FLIT_SIZE - 1 : 0] inject_ypos,
    output inject_ypos_valid,
    output [FLIT_SIZE - 1 : 0] inject_zpos,
    output inject_zpos_valid,
    output [FLIT_SIZE - 1 : 0] inject_xneg,
    output inject_xneg_valid,
    output [FLIT_SIZE - 1 : 0] inject_yneg,
    output inject_yneg_valid,
    output [FLIT_SIZE - 1 : 0] inject_zneg,
    output inject_zneg_valid,
    input inject_xpos_avail,
    input inject_ypos_avail,
    input inject_zpos_avail,
    input inject_xneg_avail,
    input inject_yneg_avail,
    input inject_zneg_avail

);

    parameter injection_rate=10'd30; //injection rate means inject one packet per injection_rate cycles

    parameter packet_size = 16; //16 flit in one packet
    
    parameter packet_num = 10;

    reg [15 : 0] packet_counter; 


    reg [9:0] injection_control_counter;
    reg [9 : 0 ] flit_counter;

    wire injection_enable;

    reg [FLIT_SIZE - 1 : 0] app_xpos_inject;
    reg [FLIT_SIZE - 1 : 0] app_ypos_inject;
    reg [FLIT_SIZE - 1 : 0] app_zpos_inject;
    reg [FLIT_SIZE - 1 : 0] app_xneg_inject;
    reg [FLIT_SIZE - 1 : 0] app_yneg_inject;
    reg [FLIT_SIZE - 1 : 0] app_zneg_inject;

    reg app_xpos_inject_valid;
    reg app_ypos_inject_valid;
    reg app_zpos_inject_valid;
    reg app_xneg_inject_valid;
    reg app_yneg_inject_valid;
    reg app_zneg_inject_valid;

`ifdef NEAREST_NEIGHBOR
    //packet generater
    always@(posedge clk) begin
        if(injection_enable) begin
            


    //packet checker
    //
    


    always@(posedge clk) begin
        if(rst) begin
            packet_counter <= 0;
        end
        else begin
            if(injection_enable) begin
                packet_counter <= (packet_counter < packet_num) ? packet_counter + 1 : 0;
            end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            flit_counter <= 0;
        end
        else begin
            if(flit_counter == 0) begin
                if(injection_enable) begin
                    flit_counter < = 1;
                end
            end
            else begin
                flit_counter <= flit_counter < packet_size ? flit_counter + 1 : 0;
            end
        end
    end


    always@(posedge clk) begin
        if(rst) begin
            injection_control_counter <= 0;
        end
        else begin
            injection_control_counter <= (injection_control_counter == injection_rate - 1) ? 0 : injection_control_counter + 1;
        end
    end

    assign injection_enable = (injection_control_counter == injection_rate - 1) && packet_counter < packet_num;


    assign app_xpos_inject - injection_enable;
    assign app_ypos_inject - injection_enable;
    assign app_zpos_inject - injection_enable;
    assign app_xneg_inject - injection_enable;
    assign app_yneg_inject - injection_enable;
    assign app_zneg_inject - injection_enable;


    wire [2 : 0] nxt_x;
    wire [2 : 0] pre_x;
    wire [2 : 0] nxt_y;
    wire [2 : 0] pre_y;
    wire [2 : 0] nxt_y;
    wire [2 : 0] pre_z;
    wire [2 : 0] nxt_z;

    assign nxt_x = cur_x != XSIZE - 1 ? cur_x + 1 : 0;
    assign nxt_y = cur_y != YSIZE - 1 ? cur_y + 1 : 0;
    assign nxt_z = cur_z != ZSIZE - 1 ? cur_z + 1 : 0;
    assign pre_x = cur_x != 0 ? cur_x - 1 : XSIZE - 1;
    assign pre_y = cur_y != 0 ? cur_y - 1 : XSIZE - 1;
    assign pre_z = cur_z != 0 ? cur_z - 1 : XSIZE - 1;


    always@(*) begin
        if(flit_counter == 1) begin
            app_xpos_inject = {HEAD_FLIT, 1'b1, cur_z, cur_y, nxt_x, 4'd0, 108'hEAD};
        end
        else if(flit_counter == packet_num - 1) begin
            app_xpos_inject = {TAIL_FLIT, 1'b1, cur_z, cur_y, nxt_x, 4'd0, 108'hEAD};
        end
        else begin
            app_xpos_inject = {BODY_FLIT, 1'b1, cur_z, cur_y, nxt_x, 4'd0, 108'hD};
        end
    end 
    always@(*) begin
        if(flit_counter == 1) begin
            app_ypos_inject = {HEAD_FLIT, 1'b1, cur_z, nxt_y, cur_x, 4'd0, 108'hEAD};
        end
        else if(flit_counter == packet_num - 1) begin
            app_ypos_inject = {TAIL_FLIT, 1'b1, cur_z, nxt_y, nxt_x, 4'd0, 108'hEAD};
        end
        else begin
            app_ypos_inject = {BODY_FLIT, 1'b1, cur_z, nxt_y, nxt_x, 4'd0, 108'hD};
        end
    end
    always@(*) begin
        if(flit_counter == 1) begin
            app_zpos_inject = {HEAD_FLIT, 1'b1, nxt_z, cur_y, cur_x, 4'd0, 108'hEAD};
        end
        else if(flit_counter == packet_num - 1) begin
            app_zpos_inject = {TAIL_FLIT, 1'b1, nxt_z, cur_y, nxt_x, 4'd0, 108'hEAD};
        end
        else begin
            app_zpos_inject = {BODY_FLIT, 1'b1, nxt_z, cur_y, nxt_x, 4'd0, 108'hD};
        end
    end

    always@(*) begin
        if(flit_counter == 1) begin
            app_xneg_inject = {HEAD_FLIT, 1'b1, cur_z, cur_y, pre_x, 4'd1, 108'hEAD};
        end
        else if(flit_counter == packet_num - 1) begin
            app_xneg_inject = {TAIL_FLIT, 1'b1, cur_z, cur_y, pre_x, 4'd1, 108'hEAD};
        end
        else begin
            app_xneg_inject = {BODY_FLIT, 1'b1, cur_z, cur_y, nxt_x, 4'd1, 108'hD};
        end
    end 
    always@(*) begin
        if(flit_counter == 1) begin
            app_yneg_inject = {HEAD_FLIT, 1'b1, cur_z, pre_y, cur_x, 4'd1, 108'hEAD};
        end
        else if(flit_counter == packet_num - 1) begin
            app_yneg_inject = {TAIL_FLIT, 1'b1, cur_z, pre_y, cur_x, 4'd1, 108'hEAD};
        end
        else begin
            app_yneg_inject = {BODY_FLIT, 1'b1, cur_z, pre_y, cur_x, 4'd1, 108'hD};
        end
    end 
    always@(*) begin
        if(flit_counter == 1) begin
            app_zneg_inject = {HEAD_FLIT, 1'b1, pre_z, cur_y, cur_x, 4'd1, 108'hEAD};
        end
        else if(flit_counter == packet_num - 1) begin
            app_zneg_inject = {TAIL_FLIT, 1'b1, pre_z, cur_y, cur_x, 4'd1, 108'hEAD};
        end
        else begin
            app_zneg_inject = {BODY_FLIT, 1'b1, pre_z, cur_y, cur_x, 4'd1, 108'hD};
        end
    end 


    //instantiate 6 inject buffers

    buffer#(
        .buffer_depth(64),
        .buffer_width(FLIT_SIZE)
    )xpos_inject_buffer(
        .clk(clk),
        .rst(rst),
        .in(app_xpos_inject),
        .produce(app_xpos_inject_valid),
        .consume(inject_xpos_avail),
        .full(),
        .empty(),
        .out(inject_xpos),
        .usedw()
    );

    buffer#(
        .buffer_depth(64),
        .buffer_width(FLIT_SIZE)
    )ypos_inject_buffer(
        .clk(clk),
        .rst(rst),
        .in(app_ypos_inject),
        .produce(app_ypos_inject_valid),
        .consume(inject_ypos_avail),
        .full(),
        .empty(),
        .out(inject_ypos),
        .usedw()
    );
    buffer#(
        .buffer_depth(64),
        .buffer_width(FLIT_SIZE)
    )zpos_inject_buffer(
        .clk(clk),
        .rst(rst),
        .in(app_zpos_inject),
        .produce(app_zpos_inject_valid),
        .consume(inject_zpos_avail),
        .full(),
        .empty(),
        .out(inject_zpos),
        .usedw()
    );
    buffer#(
        .buffer_depth(64),
        .buffer_width(FLIT_SIZE)
    )xneg_inject_buffer(
        .clk(clk),
        .rst(rst),
        .in(app_xneg_inject),
        .produce(app_xneg_inject_valid),
        .consume(inject_xneg_avail),
        .full(),
        .empty(),
        .out(inject_xneg),
        .usedw()
    );
    buffer#(
        .buffer_depth(64),
        .buffer_width(FLIT_SIZE)
    )yneg_inject_buffer(
        .clk(clk),
        .rst(rst),
        .in(app_yneg_inject),
        .produce(app_yneg_inject_valid),
        .consume(inject_yneg_avail),
        .full(),
        .empty(),
        .out(inject_yneg),
        .usedw()
    );
     buffer#(
        .buffer_depth(64),
        .buffer_width(FLIT_SIZE)
    )zneg_inject_buffer(
        .clk(clk),
        .rst(rst),
        .in(app_zneg_inject),
        .produce(app_zneg_inject_valid),
        .consume(inject_zneg_avail),
        .full(),
        .empty(),
        .out(inject_zneg),
        .usedw()
    );


endmodule

    

	 

    
    
