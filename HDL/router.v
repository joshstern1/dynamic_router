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



    
    

    endmodule
    
    

    

    
