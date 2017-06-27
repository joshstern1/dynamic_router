module router#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0
)(
    input clk,
    input rst,

    //interface from 6 MGTs
    input [FLIT_SIZE - 1 : 0] in_xpos,
    input [FLIT_SIZE - 1 : 0] in_ypos,
    input [FLIT_SIZE - 1 : 0] in_zpos,
    input [FLIT_SIZE - 1 : 0] in_xneg,
    input [FLIT_SIZE - 1 : 0] in_yneg,
    input [FLIT_SIZE - 1 : 0] in_zneg,
    input in_xpos_valid,
    input in_ypos_valid,
    input in_zpos_valid,
    input in_xneg_valid,
    input in_yneg_valid,
    input in_zneg_valid,
    //interface to 6 MGTs
    output [FLIT_SIZE - 1 : 0] out_xpos,
    output [FLIT_SIZE - 1 : 0] out_ypos,
    output [FLIT_SIZE - 1 : 0] out_zpos,
    output [FLIT_SIZE - 1 : 0] out_xneg,
    output [FLIT_SIZE - 1 : 0] out_yneg,
    output [FLIT_SIZE - 1 : 0] out_zneg,
    output out_xpos_valid,
    output out_ypos_valid,
    output out_zpos_valid,
    output out_xneg_valid,
    output out_yneg_valid,
    output out_zneg_valid,
    //interface to application kernel
    //inputs 
    output [FLIT_SIZE - 1 : 0] eject_xpos,
    output [FLIT_SIZE - 1 : 0] eject_ypos,
    output [FLIT_SIZE - 1 : 0] eject_zpos,
    output [FLIT_SIZE - 1 : 0] eject_xneg,
    output [FLIT_SIZE - 1 : 0] eject_yneg,
    output [FLIT_SIZE - 1 : 0] eject_zneg,
    output eject_xpos_valid,
    output eject_ypos_valid,
    output eject_zpos_valid,
    output eject_xneg_valid,
    output eject_yneg_valid,
    output eject_zneg_valid,

    input [FLIT_SIZE - 1 : 0] inject_xpos,
    input [FLIT_SIZE - 1 : 0] inject_ypos,
    input [FLIT_SIZE - 1 : 0] inject_zpos,
    input [FLIT_SIZE - 1 : 0] inject_xneg,
    input [FLIT_SIZE - 1 : 0] inject_yneg,
    input [FLIT_SIZE - 1 : 0] inject_zneg,
    input inject_xpos_valid,
    input inject_ypos_valid,
    input inject_zpos_valid,
    input inject_xneg_valid,
    input inject_yneg_valid,
    input inject_zneg_valid
);
    
    //instantiate route computation components
    //
    wire in_xpos_is_credit;
    wire in_ypos_is_credit;
    wire in_zpos_is_credit;
    wire in_xneg_is_credit;
    wire in_yneg_is_credit;
    wire in_zneg_is_credit;

    wire [FLIT_SIZE - 1 : 0] flit_xpos_VA;
    wire [FLIT_SIZE - 1 : 0] flit_ypos_VA;
    wire [FLIT_SIZE - 1 : 0] flit_zpos_VA;
    wire [FLIT_SIZE - 1 : 0] flit_xneg_VA;
    wire [FLIT_SIZE - 1 : 0] flit_yneg_VA;
    wire [FLIT_SIZE - 1 : 0] flit_zneg_VA;

    wire flit_xpos_VA_valid;
    wire flit_ypos_VA_valid;
    wire flit_zpos_VA_valid;
    wire flit_xneg_VA_valid;
    wire flit_yneg_VA_valid;
    wire flit_zneg_VA_valid;
 
    wire [ROUTE_LEN - 1 : 0] flit_xpos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_ypos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zpos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zneg_VA_route;



    assign in_xpos_is_credit = in_xpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_ypos_is_credit = in_ypos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_zpos_is_credit = in_zpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_xneg_is_credit = in_xneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_yneg_is_credit = in_yneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_zneg_is_credit = in_zneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )xpos_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_xpos_valid && (~in_xpos_is_credit)),
        .flit_before_RC(in_xpos_valid),
        .stall(),
        .dir_in(DIR_XPOS),
        .flit_after_RC(flit_xpos_VA),
        .flit_valid_out(flit_xpos_valid),
        .dir_out(flit_xpos_VA_route)
    );

    
    

    endmodule
    
    

    

    
