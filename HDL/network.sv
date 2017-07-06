`include "para.sv"
    module network(
    input clk,
    input rst
);
	reg[15:0] xpos_link_sum, xneg_link_sum, ypos_link_sum, yneg_link_sum, zpos_link_sum, zneg_link_sum;
	reg[15:0] xpos_ClockwiseUtil_sum, xneg_ClockwiseUtil_sum, ypos_ClockwiseUtil_sum, yneg_ClockwiseUtil_sum, zpos_ClockwiseUtil_sum, zneg_ClockwiseUtil_sum;
	reg[15:0] xpos_CounterClockwiseUtil_sum, xneg_CounterClockwiseUtil_sum, ypos_CounterClockwiseUtil_sum, yneg_CounterClockwiseUtil_sum, zpos_CounterClockwiseUtil_sum, zneg_CounterClockwiseUtil_sum;
	reg[15:0] xpos_InjectUtil_sum, xneg_InjectUtil_sum, ypos_InjectUtil_sum, yneg_InjectUtil_sum, zpos_InjectUtil_sum, zneg_InjectUtil_sum;
	reg[15:0] link_sum,Clockwise_sum,CounterClockwise_sum,Inject_sum,port_sum;
	reg[15:0] counter, time_counter;
	wire[FLIT_SIZE : 0] in_xpos_ser_0_0_0, out_xpos_ser_0_0_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_0_0, out_xneg_ser_0_0_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_0_0, out_ypos_ser_0_0_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_0_0, out_yneg_ser_0_0_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_0_0, out_zpos_ser_0_0_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_0_0, out_zneg_ser_0_0_0;
	wire[7:0] xpos_ClockwiseUtil_0_0_0,xpos_CounterClockwiseUtil_0_0_0,xpos_InjectUtil_0_0_0;
	wire[7:0] xneg_ClockwiseUtil_0_0_0,xneg_CounterClockwiseUtil_0_0_0,xneg_InjectUtil_0_0_0;
	wire[7:0] ypos_ClockwiseUtil_0_0_0,ypos_CounterClockwiseUtil_0_0_0,ypos_InjectUtil_0_0_0;
	wire[7:0] yneg_ClockwiseUtil_0_0_0,yneg_CounterClockwiseUtil_0_0_0,yneg_InjectUtil_0_0_0;
	wire[7:0] zpos_ClockwiseUtil_0_0_0,zpos_CounterClockwiseUtil_0_0_0,zpos_InjectUtil_0_0_0;
	wire[7:0] zneg_ClockwiseUtil_0_0_0,zneg_CounterClockwiseUtil_0_0_0,zneg_InjectUtil_0_0_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_0_1, out_xpos_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_0_1, out_xneg_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_0_1, out_ypos_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_0_1, out_yneg_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_0_1, out_zpos_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_0_1, out_zneg_ser_0_0_1;
	wire[7:0] xpos_ClockwiseUtil_0_0_1,xpos_CounterClockwiseUtil_0_0_1,xpos_InjectUtil_0_0_1;
	wire[7:0] xneg_ClockwiseUtil_0_0_1,xneg_CounterClockwiseUtil_0_0_1,xneg_InjectUtil_0_0_1;
	wire[7:0] ypos_ClockwiseUtil_0_0_1,ypos_CounterClockwiseUtil_0_0_1,ypos_InjectUtil_0_0_1;
	wire[7:0] yneg_ClockwiseUtil_0_0_1,yneg_CounterClockwiseUtil_0_0_1,yneg_InjectUtil_0_0_1;
	wire[7:0] zpos_ClockwiseUtil_0_0_1,zpos_CounterClockwiseUtil_0_0_1,zpos_InjectUtil_0_0_1;
	wire[7:0] zneg_ClockwiseUtil_0_0_1,zneg_CounterClockwiseUtil_0_0_1,zneg_InjectUtil_0_0_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_0_2, out_xpos_ser_0_0_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_0_2, out_xneg_ser_0_0_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_0_2, out_ypos_ser_0_0_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_0_2, out_yneg_ser_0_0_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_0_2, out_zpos_ser_0_0_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_0_2, out_zneg_ser_0_0_2;
	wire[7:0] xpos_ClockwiseUtil_0_0_2,xpos_CounterClockwiseUtil_0_0_2,xpos_InjectUtil_0_0_2;
	wire[7:0] xneg_ClockwiseUtil_0_0_2,xneg_CounterClockwiseUtil_0_0_2,xneg_InjectUtil_0_0_2;
	wire[7:0] ypos_ClockwiseUtil_0_0_2,ypos_CounterClockwiseUtil_0_0_2,ypos_InjectUtil_0_0_2;
	wire[7:0] yneg_ClockwiseUtil_0_0_2,yneg_CounterClockwiseUtil_0_0_2,yneg_InjectUtil_0_0_2;
	wire[7:0] zpos_ClockwiseUtil_0_0_2,zpos_CounterClockwiseUtil_0_0_2,zpos_InjectUtil_0_0_2;
	wire[7:0] zneg_ClockwiseUtil_0_0_2,zneg_CounterClockwiseUtil_0_0_2,zneg_InjectUtil_0_0_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_0_3, out_xpos_ser_0_0_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_0_3, out_xneg_ser_0_0_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_0_3, out_ypos_ser_0_0_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_0_3, out_yneg_ser_0_0_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_0_3, out_zpos_ser_0_0_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_0_3, out_zneg_ser_0_0_3;
	wire[7:0] xpos_ClockwiseUtil_0_0_3,xpos_CounterClockwiseUtil_0_0_3,xpos_InjectUtil_0_0_3;
	wire[7:0] xneg_ClockwiseUtil_0_0_3,xneg_CounterClockwiseUtil_0_0_3,xneg_InjectUtil_0_0_3;
	wire[7:0] ypos_ClockwiseUtil_0_0_3,ypos_CounterClockwiseUtil_0_0_3,ypos_InjectUtil_0_0_3;
	wire[7:0] yneg_ClockwiseUtil_0_0_3,yneg_CounterClockwiseUtil_0_0_3,yneg_InjectUtil_0_0_3;
	wire[7:0] zpos_ClockwiseUtil_0_0_3,zpos_CounterClockwiseUtil_0_0_3,zpos_InjectUtil_0_0_3;
	wire[7:0] zneg_ClockwiseUtil_0_0_3,zneg_CounterClockwiseUtil_0_0_3,zneg_InjectUtil_0_0_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_1_0, out_xpos_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_1_0, out_xneg_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_1_0, out_ypos_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_1_0, out_yneg_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_1_0, out_zpos_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_1_0, out_zneg_ser_0_1_0;
	wire[7:0] xpos_ClockwiseUtil_0_1_0,xpos_CounterClockwiseUtil_0_1_0,xpos_InjectUtil_0_1_0;
	wire[7:0] xneg_ClockwiseUtil_0_1_0,xneg_CounterClockwiseUtil_0_1_0,xneg_InjectUtil_0_1_0;
	wire[7:0] ypos_ClockwiseUtil_0_1_0,ypos_CounterClockwiseUtil_0_1_0,ypos_InjectUtil_0_1_0;
	wire[7:0] yneg_ClockwiseUtil_0_1_0,yneg_CounterClockwiseUtil_0_1_0,yneg_InjectUtil_0_1_0;
	wire[7:0] zpos_ClockwiseUtil_0_1_0,zpos_CounterClockwiseUtil_0_1_0,zpos_InjectUtil_0_1_0;
	wire[7:0] zneg_ClockwiseUtil_0_1_0,zneg_CounterClockwiseUtil_0_1_0,zneg_InjectUtil_0_1_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_1_1, out_xpos_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_1_1, out_xneg_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_1_1, out_ypos_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_1_1, out_yneg_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_1_1, out_zpos_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_1_1, out_zneg_ser_0_1_1;
	wire[7:0] xpos_ClockwiseUtil_0_1_1,xpos_CounterClockwiseUtil_0_1_1,xpos_InjectUtil_0_1_1;
	wire[7:0] xneg_ClockwiseUtil_0_1_1,xneg_CounterClockwiseUtil_0_1_1,xneg_InjectUtil_0_1_1;
	wire[7:0] ypos_ClockwiseUtil_0_1_1,ypos_CounterClockwiseUtil_0_1_1,ypos_InjectUtil_0_1_1;
	wire[7:0] yneg_ClockwiseUtil_0_1_1,yneg_CounterClockwiseUtil_0_1_1,yneg_InjectUtil_0_1_1;
	wire[7:0] zpos_ClockwiseUtil_0_1_1,zpos_CounterClockwiseUtil_0_1_1,zpos_InjectUtil_0_1_1;
	wire[7:0] zneg_ClockwiseUtil_0_1_1,zneg_CounterClockwiseUtil_0_1_1,zneg_InjectUtil_0_1_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_1_2, out_xpos_ser_0_1_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_1_2, out_xneg_ser_0_1_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_1_2, out_ypos_ser_0_1_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_1_2, out_yneg_ser_0_1_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_1_2, out_zpos_ser_0_1_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_1_2, out_zneg_ser_0_1_2;
	wire[7:0] xpos_ClockwiseUtil_0_1_2,xpos_CounterClockwiseUtil_0_1_2,xpos_InjectUtil_0_1_2;
	wire[7:0] xneg_ClockwiseUtil_0_1_2,xneg_CounterClockwiseUtil_0_1_2,xneg_InjectUtil_0_1_2;
	wire[7:0] ypos_ClockwiseUtil_0_1_2,ypos_CounterClockwiseUtil_0_1_2,ypos_InjectUtil_0_1_2;
	wire[7:0] yneg_ClockwiseUtil_0_1_2,yneg_CounterClockwiseUtil_0_1_2,yneg_InjectUtil_0_1_2;
	wire[7:0] zpos_ClockwiseUtil_0_1_2,zpos_CounterClockwiseUtil_0_1_2,zpos_InjectUtil_0_1_2;
	wire[7:0] zneg_ClockwiseUtil_0_1_2,zneg_CounterClockwiseUtil_0_1_2,zneg_InjectUtil_0_1_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_1_3, out_xpos_ser_0_1_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_1_3, out_xneg_ser_0_1_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_1_3, out_ypos_ser_0_1_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_1_3, out_yneg_ser_0_1_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_1_3, out_zpos_ser_0_1_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_1_3, out_zneg_ser_0_1_3;
	wire[7:0] xpos_ClockwiseUtil_0_1_3,xpos_CounterClockwiseUtil_0_1_3,xpos_InjectUtil_0_1_3;
	wire[7:0] xneg_ClockwiseUtil_0_1_3,xneg_CounterClockwiseUtil_0_1_3,xneg_InjectUtil_0_1_3;
	wire[7:0] ypos_ClockwiseUtil_0_1_3,ypos_CounterClockwiseUtil_0_1_3,ypos_InjectUtil_0_1_3;
	wire[7:0] yneg_ClockwiseUtil_0_1_3,yneg_CounterClockwiseUtil_0_1_3,yneg_InjectUtil_0_1_3;
	wire[7:0] zpos_ClockwiseUtil_0_1_3,zpos_CounterClockwiseUtil_0_1_3,zpos_InjectUtil_0_1_3;
	wire[7:0] zneg_ClockwiseUtil_0_1_3,zneg_CounterClockwiseUtil_0_1_3,zneg_InjectUtil_0_1_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_2_0, out_xpos_ser_0_2_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_2_0, out_xneg_ser_0_2_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_2_0, out_ypos_ser_0_2_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_2_0, out_yneg_ser_0_2_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_2_0, out_zpos_ser_0_2_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_2_0, out_zneg_ser_0_2_0;
	wire[7:0] xpos_ClockwiseUtil_0_2_0,xpos_CounterClockwiseUtil_0_2_0,xpos_InjectUtil_0_2_0;
	wire[7:0] xneg_ClockwiseUtil_0_2_0,xneg_CounterClockwiseUtil_0_2_0,xneg_InjectUtil_0_2_0;
	wire[7:0] ypos_ClockwiseUtil_0_2_0,ypos_CounterClockwiseUtil_0_2_0,ypos_InjectUtil_0_2_0;
	wire[7:0] yneg_ClockwiseUtil_0_2_0,yneg_CounterClockwiseUtil_0_2_0,yneg_InjectUtil_0_2_0;
	wire[7:0] zpos_ClockwiseUtil_0_2_0,zpos_CounterClockwiseUtil_0_2_0,zpos_InjectUtil_0_2_0;
	wire[7:0] zneg_ClockwiseUtil_0_2_0,zneg_CounterClockwiseUtil_0_2_0,zneg_InjectUtil_0_2_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_2_1, out_xpos_ser_0_2_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_2_1, out_xneg_ser_0_2_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_2_1, out_ypos_ser_0_2_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_2_1, out_yneg_ser_0_2_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_2_1, out_zpos_ser_0_2_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_2_1, out_zneg_ser_0_2_1;
	wire[7:0] xpos_ClockwiseUtil_0_2_1,xpos_CounterClockwiseUtil_0_2_1,xpos_InjectUtil_0_2_1;
	wire[7:0] xneg_ClockwiseUtil_0_2_1,xneg_CounterClockwiseUtil_0_2_1,xneg_InjectUtil_0_2_1;
	wire[7:0] ypos_ClockwiseUtil_0_2_1,ypos_CounterClockwiseUtil_0_2_1,ypos_InjectUtil_0_2_1;
	wire[7:0] yneg_ClockwiseUtil_0_2_1,yneg_CounterClockwiseUtil_0_2_1,yneg_InjectUtil_0_2_1;
	wire[7:0] zpos_ClockwiseUtil_0_2_1,zpos_CounterClockwiseUtil_0_2_1,zpos_InjectUtil_0_2_1;
	wire[7:0] zneg_ClockwiseUtil_0_2_1,zneg_CounterClockwiseUtil_0_2_1,zneg_InjectUtil_0_2_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_2_2, out_xpos_ser_0_2_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_2_2, out_xneg_ser_0_2_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_2_2, out_ypos_ser_0_2_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_2_2, out_yneg_ser_0_2_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_2_2, out_zpos_ser_0_2_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_2_2, out_zneg_ser_0_2_2;
	wire[7:0] xpos_ClockwiseUtil_0_2_2,xpos_CounterClockwiseUtil_0_2_2,xpos_InjectUtil_0_2_2;
	wire[7:0] xneg_ClockwiseUtil_0_2_2,xneg_CounterClockwiseUtil_0_2_2,xneg_InjectUtil_0_2_2;
	wire[7:0] ypos_ClockwiseUtil_0_2_2,ypos_CounterClockwiseUtil_0_2_2,ypos_InjectUtil_0_2_2;
	wire[7:0] yneg_ClockwiseUtil_0_2_2,yneg_CounterClockwiseUtil_0_2_2,yneg_InjectUtil_0_2_2;
	wire[7:0] zpos_ClockwiseUtil_0_2_2,zpos_CounterClockwiseUtil_0_2_2,zpos_InjectUtil_0_2_2;
	wire[7:0] zneg_ClockwiseUtil_0_2_2,zneg_CounterClockwiseUtil_0_2_2,zneg_InjectUtil_0_2_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_2_3, out_xpos_ser_0_2_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_2_3, out_xneg_ser_0_2_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_2_3, out_ypos_ser_0_2_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_2_3, out_yneg_ser_0_2_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_2_3, out_zpos_ser_0_2_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_2_3, out_zneg_ser_0_2_3;
	wire[7:0] xpos_ClockwiseUtil_0_2_3,xpos_CounterClockwiseUtil_0_2_3,xpos_InjectUtil_0_2_3;
	wire[7:0] xneg_ClockwiseUtil_0_2_3,xneg_CounterClockwiseUtil_0_2_3,xneg_InjectUtil_0_2_3;
	wire[7:0] ypos_ClockwiseUtil_0_2_3,ypos_CounterClockwiseUtil_0_2_3,ypos_InjectUtil_0_2_3;
	wire[7:0] yneg_ClockwiseUtil_0_2_3,yneg_CounterClockwiseUtil_0_2_3,yneg_InjectUtil_0_2_3;
	wire[7:0] zpos_ClockwiseUtil_0_2_3,zpos_CounterClockwiseUtil_0_2_3,zpos_InjectUtil_0_2_3;
	wire[7:0] zneg_ClockwiseUtil_0_2_3,zneg_CounterClockwiseUtil_0_2_3,zneg_InjectUtil_0_2_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_3_0, out_xpos_ser_0_3_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_3_0, out_xneg_ser_0_3_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_3_0, out_ypos_ser_0_3_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_3_0, out_yneg_ser_0_3_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_3_0, out_zpos_ser_0_3_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_3_0, out_zneg_ser_0_3_0;
	wire[7:0] xpos_ClockwiseUtil_0_3_0,xpos_CounterClockwiseUtil_0_3_0,xpos_InjectUtil_0_3_0;
	wire[7:0] xneg_ClockwiseUtil_0_3_0,xneg_CounterClockwiseUtil_0_3_0,xneg_InjectUtil_0_3_0;
	wire[7:0] ypos_ClockwiseUtil_0_3_0,ypos_CounterClockwiseUtil_0_3_0,ypos_InjectUtil_0_3_0;
	wire[7:0] yneg_ClockwiseUtil_0_3_0,yneg_CounterClockwiseUtil_0_3_0,yneg_InjectUtil_0_3_0;
	wire[7:0] zpos_ClockwiseUtil_0_3_0,zpos_CounterClockwiseUtil_0_3_0,zpos_InjectUtil_0_3_0;
	wire[7:0] zneg_ClockwiseUtil_0_3_0,zneg_CounterClockwiseUtil_0_3_0,zneg_InjectUtil_0_3_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_3_1, out_xpos_ser_0_3_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_3_1, out_xneg_ser_0_3_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_3_1, out_ypos_ser_0_3_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_3_1, out_yneg_ser_0_3_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_3_1, out_zpos_ser_0_3_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_3_1, out_zneg_ser_0_3_1;
	wire[7:0] xpos_ClockwiseUtil_0_3_1,xpos_CounterClockwiseUtil_0_3_1,xpos_InjectUtil_0_3_1;
	wire[7:0] xneg_ClockwiseUtil_0_3_1,xneg_CounterClockwiseUtil_0_3_1,xneg_InjectUtil_0_3_1;
	wire[7:0] ypos_ClockwiseUtil_0_3_1,ypos_CounterClockwiseUtil_0_3_1,ypos_InjectUtil_0_3_1;
	wire[7:0] yneg_ClockwiseUtil_0_3_1,yneg_CounterClockwiseUtil_0_3_1,yneg_InjectUtil_0_3_1;
	wire[7:0] zpos_ClockwiseUtil_0_3_1,zpos_CounterClockwiseUtil_0_3_1,zpos_InjectUtil_0_3_1;
	wire[7:0] zneg_ClockwiseUtil_0_3_1,zneg_CounterClockwiseUtil_0_3_1,zneg_InjectUtil_0_3_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_3_2, out_xpos_ser_0_3_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_3_2, out_xneg_ser_0_3_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_3_2, out_ypos_ser_0_3_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_3_2, out_yneg_ser_0_3_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_3_2, out_zpos_ser_0_3_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_3_2, out_zneg_ser_0_3_2;
	wire[7:0] xpos_ClockwiseUtil_0_3_2,xpos_CounterClockwiseUtil_0_3_2,xpos_InjectUtil_0_3_2;
	wire[7:0] xneg_ClockwiseUtil_0_3_2,xneg_CounterClockwiseUtil_0_3_2,xneg_InjectUtil_0_3_2;
	wire[7:0] ypos_ClockwiseUtil_0_3_2,ypos_CounterClockwiseUtil_0_3_2,ypos_InjectUtil_0_3_2;
	wire[7:0] yneg_ClockwiseUtil_0_3_2,yneg_CounterClockwiseUtil_0_3_2,yneg_InjectUtil_0_3_2;
	wire[7:0] zpos_ClockwiseUtil_0_3_2,zpos_CounterClockwiseUtil_0_3_2,zpos_InjectUtil_0_3_2;
	wire[7:0] zneg_ClockwiseUtil_0_3_2,zneg_CounterClockwiseUtil_0_3_2,zneg_InjectUtil_0_3_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_0_3_3, out_xpos_ser_0_3_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_3_3, out_xneg_ser_0_3_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_3_3, out_ypos_ser_0_3_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_3_3, out_yneg_ser_0_3_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_3_3, out_zpos_ser_0_3_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_3_3, out_zneg_ser_0_3_3;
	wire[7:0] xpos_ClockwiseUtil_0_3_3,xpos_CounterClockwiseUtil_0_3_3,xpos_InjectUtil_0_3_3;
	wire[7:0] xneg_ClockwiseUtil_0_3_3,xneg_CounterClockwiseUtil_0_3_3,xneg_InjectUtil_0_3_3;
	wire[7:0] ypos_ClockwiseUtil_0_3_3,ypos_CounterClockwiseUtil_0_3_3,ypos_InjectUtil_0_3_3;
	wire[7:0] yneg_ClockwiseUtil_0_3_3,yneg_CounterClockwiseUtil_0_3_3,yneg_InjectUtil_0_3_3;
	wire[7:0] zpos_ClockwiseUtil_0_3_3,zpos_CounterClockwiseUtil_0_3_3,zpos_InjectUtil_0_3_3;
	wire[7:0] zneg_ClockwiseUtil_0_3_3,zneg_CounterClockwiseUtil_0_3_3,zneg_InjectUtil_0_3_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_0_0, out_xpos_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_0_0, out_xneg_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_0_0, out_ypos_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_0_0, out_yneg_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_0_0, out_zpos_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_0_0, out_zneg_ser_1_0_0;
	wire[7:0] xpos_ClockwiseUtil_1_0_0,xpos_CounterClockwiseUtil_1_0_0,xpos_InjectUtil_1_0_0;
	wire[7:0] xneg_ClockwiseUtil_1_0_0,xneg_CounterClockwiseUtil_1_0_0,xneg_InjectUtil_1_0_0;
	wire[7:0] ypos_ClockwiseUtil_1_0_0,ypos_CounterClockwiseUtil_1_0_0,ypos_InjectUtil_1_0_0;
	wire[7:0] yneg_ClockwiseUtil_1_0_0,yneg_CounterClockwiseUtil_1_0_0,yneg_InjectUtil_1_0_0;
	wire[7:0] zpos_ClockwiseUtil_1_0_0,zpos_CounterClockwiseUtil_1_0_0,zpos_InjectUtil_1_0_0;
	wire[7:0] zneg_ClockwiseUtil_1_0_0,zneg_CounterClockwiseUtil_1_0_0,zneg_InjectUtil_1_0_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_0_1, out_xpos_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_0_1, out_xneg_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_0_1, out_ypos_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_0_1, out_yneg_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_0_1, out_zpos_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_0_1, out_zneg_ser_1_0_1;
	wire[7:0] xpos_ClockwiseUtil_1_0_1,xpos_CounterClockwiseUtil_1_0_1,xpos_InjectUtil_1_0_1;
	wire[7:0] xneg_ClockwiseUtil_1_0_1,xneg_CounterClockwiseUtil_1_0_1,xneg_InjectUtil_1_0_1;
	wire[7:0] ypos_ClockwiseUtil_1_0_1,ypos_CounterClockwiseUtil_1_0_1,ypos_InjectUtil_1_0_1;
	wire[7:0] yneg_ClockwiseUtil_1_0_1,yneg_CounterClockwiseUtil_1_0_1,yneg_InjectUtil_1_0_1;
	wire[7:0] zpos_ClockwiseUtil_1_0_1,zpos_CounterClockwiseUtil_1_0_1,zpos_InjectUtil_1_0_1;
	wire[7:0] zneg_ClockwiseUtil_1_0_1,zneg_CounterClockwiseUtil_1_0_1,zneg_InjectUtil_1_0_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_0_2, out_xpos_ser_1_0_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_0_2, out_xneg_ser_1_0_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_0_2, out_ypos_ser_1_0_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_0_2, out_yneg_ser_1_0_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_0_2, out_zpos_ser_1_0_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_0_2, out_zneg_ser_1_0_2;
	wire[7:0] xpos_ClockwiseUtil_1_0_2,xpos_CounterClockwiseUtil_1_0_2,xpos_InjectUtil_1_0_2;
	wire[7:0] xneg_ClockwiseUtil_1_0_2,xneg_CounterClockwiseUtil_1_0_2,xneg_InjectUtil_1_0_2;
	wire[7:0] ypos_ClockwiseUtil_1_0_2,ypos_CounterClockwiseUtil_1_0_2,ypos_InjectUtil_1_0_2;
	wire[7:0] yneg_ClockwiseUtil_1_0_2,yneg_CounterClockwiseUtil_1_0_2,yneg_InjectUtil_1_0_2;
	wire[7:0] zpos_ClockwiseUtil_1_0_2,zpos_CounterClockwiseUtil_1_0_2,zpos_InjectUtil_1_0_2;
	wire[7:0] zneg_ClockwiseUtil_1_0_2,zneg_CounterClockwiseUtil_1_0_2,zneg_InjectUtil_1_0_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_0_3, out_xpos_ser_1_0_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_0_3, out_xneg_ser_1_0_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_0_3, out_ypos_ser_1_0_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_0_3, out_yneg_ser_1_0_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_0_3, out_zpos_ser_1_0_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_0_3, out_zneg_ser_1_0_3;
	wire[7:0] xpos_ClockwiseUtil_1_0_3,xpos_CounterClockwiseUtil_1_0_3,xpos_InjectUtil_1_0_3;
	wire[7:0] xneg_ClockwiseUtil_1_0_3,xneg_CounterClockwiseUtil_1_0_3,xneg_InjectUtil_1_0_3;
	wire[7:0] ypos_ClockwiseUtil_1_0_3,ypos_CounterClockwiseUtil_1_0_3,ypos_InjectUtil_1_0_3;
	wire[7:0] yneg_ClockwiseUtil_1_0_3,yneg_CounterClockwiseUtil_1_0_3,yneg_InjectUtil_1_0_3;
	wire[7:0] zpos_ClockwiseUtil_1_0_3,zpos_CounterClockwiseUtil_1_0_3,zpos_InjectUtil_1_0_3;
	wire[7:0] zneg_ClockwiseUtil_1_0_3,zneg_CounterClockwiseUtil_1_0_3,zneg_InjectUtil_1_0_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_1_0, out_xpos_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_1_0, out_xneg_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_1_0, out_ypos_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_1_0, out_yneg_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_1_0, out_zpos_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_1_0, out_zneg_ser_1_1_0;
	wire[7:0] xpos_ClockwiseUtil_1_1_0,xpos_CounterClockwiseUtil_1_1_0,xpos_InjectUtil_1_1_0;
	wire[7:0] xneg_ClockwiseUtil_1_1_0,xneg_CounterClockwiseUtil_1_1_0,xneg_InjectUtil_1_1_0;
	wire[7:0] ypos_ClockwiseUtil_1_1_0,ypos_CounterClockwiseUtil_1_1_0,ypos_InjectUtil_1_1_0;
	wire[7:0] yneg_ClockwiseUtil_1_1_0,yneg_CounterClockwiseUtil_1_1_0,yneg_InjectUtil_1_1_0;
	wire[7:0] zpos_ClockwiseUtil_1_1_0,zpos_CounterClockwiseUtil_1_1_0,zpos_InjectUtil_1_1_0;
	wire[7:0] zneg_ClockwiseUtil_1_1_0,zneg_CounterClockwiseUtil_1_1_0,zneg_InjectUtil_1_1_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_1_1, out_xpos_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_1_1, out_xneg_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_1_1, out_ypos_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_1_1, out_yneg_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_1_1, out_zpos_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_1_1, out_zneg_ser_1_1_1;
	wire[7:0] xpos_ClockwiseUtil_1_1_1,xpos_CounterClockwiseUtil_1_1_1,xpos_InjectUtil_1_1_1;
	wire[7:0] xneg_ClockwiseUtil_1_1_1,xneg_CounterClockwiseUtil_1_1_1,xneg_InjectUtil_1_1_1;
	wire[7:0] ypos_ClockwiseUtil_1_1_1,ypos_CounterClockwiseUtil_1_1_1,ypos_InjectUtil_1_1_1;
	wire[7:0] yneg_ClockwiseUtil_1_1_1,yneg_CounterClockwiseUtil_1_1_1,yneg_InjectUtil_1_1_1;
	wire[7:0] zpos_ClockwiseUtil_1_1_1,zpos_CounterClockwiseUtil_1_1_1,zpos_InjectUtil_1_1_1;
	wire[7:0] zneg_ClockwiseUtil_1_1_1,zneg_CounterClockwiseUtil_1_1_1,zneg_InjectUtil_1_1_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_1_2, out_xpos_ser_1_1_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_1_2, out_xneg_ser_1_1_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_1_2, out_ypos_ser_1_1_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_1_2, out_yneg_ser_1_1_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_1_2, out_zpos_ser_1_1_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_1_2, out_zneg_ser_1_1_2;
	wire[7:0] xpos_ClockwiseUtil_1_1_2,xpos_CounterClockwiseUtil_1_1_2,xpos_InjectUtil_1_1_2;
	wire[7:0] xneg_ClockwiseUtil_1_1_2,xneg_CounterClockwiseUtil_1_1_2,xneg_InjectUtil_1_1_2;
	wire[7:0] ypos_ClockwiseUtil_1_1_2,ypos_CounterClockwiseUtil_1_1_2,ypos_InjectUtil_1_1_2;
	wire[7:0] yneg_ClockwiseUtil_1_1_2,yneg_CounterClockwiseUtil_1_1_2,yneg_InjectUtil_1_1_2;
	wire[7:0] zpos_ClockwiseUtil_1_1_2,zpos_CounterClockwiseUtil_1_1_2,zpos_InjectUtil_1_1_2;
	wire[7:0] zneg_ClockwiseUtil_1_1_2,zneg_CounterClockwiseUtil_1_1_2,zneg_InjectUtil_1_1_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_1_3, out_xpos_ser_1_1_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_1_3, out_xneg_ser_1_1_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_1_3, out_ypos_ser_1_1_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_1_3, out_yneg_ser_1_1_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_1_3, out_zpos_ser_1_1_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_1_3, out_zneg_ser_1_1_3;
	wire[7:0] xpos_ClockwiseUtil_1_1_3,xpos_CounterClockwiseUtil_1_1_3,xpos_InjectUtil_1_1_3;
	wire[7:0] xneg_ClockwiseUtil_1_1_3,xneg_CounterClockwiseUtil_1_1_3,xneg_InjectUtil_1_1_3;
	wire[7:0] ypos_ClockwiseUtil_1_1_3,ypos_CounterClockwiseUtil_1_1_3,ypos_InjectUtil_1_1_3;
	wire[7:0] yneg_ClockwiseUtil_1_1_3,yneg_CounterClockwiseUtil_1_1_3,yneg_InjectUtil_1_1_3;
	wire[7:0] zpos_ClockwiseUtil_1_1_3,zpos_CounterClockwiseUtil_1_1_3,zpos_InjectUtil_1_1_3;
	wire[7:0] zneg_ClockwiseUtil_1_1_3,zneg_CounterClockwiseUtil_1_1_3,zneg_InjectUtil_1_1_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_2_0, out_xpos_ser_1_2_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_2_0, out_xneg_ser_1_2_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_2_0, out_ypos_ser_1_2_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_2_0, out_yneg_ser_1_2_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_2_0, out_zpos_ser_1_2_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_2_0, out_zneg_ser_1_2_0;
	wire[7:0] xpos_ClockwiseUtil_1_2_0,xpos_CounterClockwiseUtil_1_2_0,xpos_InjectUtil_1_2_0;
	wire[7:0] xneg_ClockwiseUtil_1_2_0,xneg_CounterClockwiseUtil_1_2_0,xneg_InjectUtil_1_2_0;
	wire[7:0] ypos_ClockwiseUtil_1_2_0,ypos_CounterClockwiseUtil_1_2_0,ypos_InjectUtil_1_2_0;
	wire[7:0] yneg_ClockwiseUtil_1_2_0,yneg_CounterClockwiseUtil_1_2_0,yneg_InjectUtil_1_2_0;
	wire[7:0] zpos_ClockwiseUtil_1_2_0,zpos_CounterClockwiseUtil_1_2_0,zpos_InjectUtil_1_2_0;
	wire[7:0] zneg_ClockwiseUtil_1_2_0,zneg_CounterClockwiseUtil_1_2_0,zneg_InjectUtil_1_2_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_2_1, out_xpos_ser_1_2_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_2_1, out_xneg_ser_1_2_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_2_1, out_ypos_ser_1_2_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_2_1, out_yneg_ser_1_2_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_2_1, out_zpos_ser_1_2_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_2_1, out_zneg_ser_1_2_1;
	wire[7:0] xpos_ClockwiseUtil_1_2_1,xpos_CounterClockwiseUtil_1_2_1,xpos_InjectUtil_1_2_1;
	wire[7:0] xneg_ClockwiseUtil_1_2_1,xneg_CounterClockwiseUtil_1_2_1,xneg_InjectUtil_1_2_1;
	wire[7:0] ypos_ClockwiseUtil_1_2_1,ypos_CounterClockwiseUtil_1_2_1,ypos_InjectUtil_1_2_1;
	wire[7:0] yneg_ClockwiseUtil_1_2_1,yneg_CounterClockwiseUtil_1_2_1,yneg_InjectUtil_1_2_1;
	wire[7:0] zpos_ClockwiseUtil_1_2_1,zpos_CounterClockwiseUtil_1_2_1,zpos_InjectUtil_1_2_1;
	wire[7:0] zneg_ClockwiseUtil_1_2_1,zneg_CounterClockwiseUtil_1_2_1,zneg_InjectUtil_1_2_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_2_2, out_xpos_ser_1_2_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_2_2, out_xneg_ser_1_2_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_2_2, out_ypos_ser_1_2_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_2_2, out_yneg_ser_1_2_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_2_2, out_zpos_ser_1_2_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_2_2, out_zneg_ser_1_2_2;
	wire[7:0] xpos_ClockwiseUtil_1_2_2,xpos_CounterClockwiseUtil_1_2_2,xpos_InjectUtil_1_2_2;
	wire[7:0] xneg_ClockwiseUtil_1_2_2,xneg_CounterClockwiseUtil_1_2_2,xneg_InjectUtil_1_2_2;
	wire[7:0] ypos_ClockwiseUtil_1_2_2,ypos_CounterClockwiseUtil_1_2_2,ypos_InjectUtil_1_2_2;
	wire[7:0] yneg_ClockwiseUtil_1_2_2,yneg_CounterClockwiseUtil_1_2_2,yneg_InjectUtil_1_2_2;
	wire[7:0] zpos_ClockwiseUtil_1_2_2,zpos_CounterClockwiseUtil_1_2_2,zpos_InjectUtil_1_2_2;
	wire[7:0] zneg_ClockwiseUtil_1_2_2,zneg_CounterClockwiseUtil_1_2_2,zneg_InjectUtil_1_2_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_2_3, out_xpos_ser_1_2_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_2_3, out_xneg_ser_1_2_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_2_3, out_ypos_ser_1_2_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_2_3, out_yneg_ser_1_2_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_2_3, out_zpos_ser_1_2_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_2_3, out_zneg_ser_1_2_3;
	wire[7:0] xpos_ClockwiseUtil_1_2_3,xpos_CounterClockwiseUtil_1_2_3,xpos_InjectUtil_1_2_3;
	wire[7:0] xneg_ClockwiseUtil_1_2_3,xneg_CounterClockwiseUtil_1_2_3,xneg_InjectUtil_1_2_3;
	wire[7:0] ypos_ClockwiseUtil_1_2_3,ypos_CounterClockwiseUtil_1_2_3,ypos_InjectUtil_1_2_3;
	wire[7:0] yneg_ClockwiseUtil_1_2_3,yneg_CounterClockwiseUtil_1_2_3,yneg_InjectUtil_1_2_3;
	wire[7:0] zpos_ClockwiseUtil_1_2_3,zpos_CounterClockwiseUtil_1_2_3,zpos_InjectUtil_1_2_3;
	wire[7:0] zneg_ClockwiseUtil_1_2_3,zneg_CounterClockwiseUtil_1_2_3,zneg_InjectUtil_1_2_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_3_0, out_xpos_ser_1_3_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_3_0, out_xneg_ser_1_3_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_3_0, out_ypos_ser_1_3_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_3_0, out_yneg_ser_1_3_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_3_0, out_zpos_ser_1_3_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_3_0, out_zneg_ser_1_3_0;
	wire[7:0] xpos_ClockwiseUtil_1_3_0,xpos_CounterClockwiseUtil_1_3_0,xpos_InjectUtil_1_3_0;
	wire[7:0] xneg_ClockwiseUtil_1_3_0,xneg_CounterClockwiseUtil_1_3_0,xneg_InjectUtil_1_3_0;
	wire[7:0] ypos_ClockwiseUtil_1_3_0,ypos_CounterClockwiseUtil_1_3_0,ypos_InjectUtil_1_3_0;
	wire[7:0] yneg_ClockwiseUtil_1_3_0,yneg_CounterClockwiseUtil_1_3_0,yneg_InjectUtil_1_3_0;
	wire[7:0] zpos_ClockwiseUtil_1_3_0,zpos_CounterClockwiseUtil_1_3_0,zpos_InjectUtil_1_3_0;
	wire[7:0] zneg_ClockwiseUtil_1_3_0,zneg_CounterClockwiseUtil_1_3_0,zneg_InjectUtil_1_3_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_3_1, out_xpos_ser_1_3_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_3_1, out_xneg_ser_1_3_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_3_1, out_ypos_ser_1_3_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_3_1, out_yneg_ser_1_3_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_3_1, out_zpos_ser_1_3_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_3_1, out_zneg_ser_1_3_1;
	wire[7:0] xpos_ClockwiseUtil_1_3_1,xpos_CounterClockwiseUtil_1_3_1,xpos_InjectUtil_1_3_1;
	wire[7:0] xneg_ClockwiseUtil_1_3_1,xneg_CounterClockwiseUtil_1_3_1,xneg_InjectUtil_1_3_1;
	wire[7:0] ypos_ClockwiseUtil_1_3_1,ypos_CounterClockwiseUtil_1_3_1,ypos_InjectUtil_1_3_1;
	wire[7:0] yneg_ClockwiseUtil_1_3_1,yneg_CounterClockwiseUtil_1_3_1,yneg_InjectUtil_1_3_1;
	wire[7:0] zpos_ClockwiseUtil_1_3_1,zpos_CounterClockwiseUtil_1_3_1,zpos_InjectUtil_1_3_1;
	wire[7:0] zneg_ClockwiseUtil_1_3_1,zneg_CounterClockwiseUtil_1_3_1,zneg_InjectUtil_1_3_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_3_2, out_xpos_ser_1_3_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_3_2, out_xneg_ser_1_3_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_3_2, out_ypos_ser_1_3_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_3_2, out_yneg_ser_1_3_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_3_2, out_zpos_ser_1_3_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_3_2, out_zneg_ser_1_3_2;
	wire[7:0] xpos_ClockwiseUtil_1_3_2,xpos_CounterClockwiseUtil_1_3_2,xpos_InjectUtil_1_3_2;
	wire[7:0] xneg_ClockwiseUtil_1_3_2,xneg_CounterClockwiseUtil_1_3_2,xneg_InjectUtil_1_3_2;
	wire[7:0] ypos_ClockwiseUtil_1_3_2,ypos_CounterClockwiseUtil_1_3_2,ypos_InjectUtil_1_3_2;
	wire[7:0] yneg_ClockwiseUtil_1_3_2,yneg_CounterClockwiseUtil_1_3_2,yneg_InjectUtil_1_3_2;
	wire[7:0] zpos_ClockwiseUtil_1_3_2,zpos_CounterClockwiseUtil_1_3_2,zpos_InjectUtil_1_3_2;
	wire[7:0] zneg_ClockwiseUtil_1_3_2,zneg_CounterClockwiseUtil_1_3_2,zneg_InjectUtil_1_3_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_1_3_3, out_xpos_ser_1_3_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_3_3, out_xneg_ser_1_3_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_3_3, out_ypos_ser_1_3_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_3_3, out_yneg_ser_1_3_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_3_3, out_zpos_ser_1_3_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_3_3, out_zneg_ser_1_3_3;
	wire[7:0] xpos_ClockwiseUtil_1_3_3,xpos_CounterClockwiseUtil_1_3_3,xpos_InjectUtil_1_3_3;
	wire[7:0] xneg_ClockwiseUtil_1_3_3,xneg_CounterClockwiseUtil_1_3_3,xneg_InjectUtil_1_3_3;
	wire[7:0] ypos_ClockwiseUtil_1_3_3,ypos_CounterClockwiseUtil_1_3_3,ypos_InjectUtil_1_3_3;
	wire[7:0] yneg_ClockwiseUtil_1_3_3,yneg_CounterClockwiseUtil_1_3_3,yneg_InjectUtil_1_3_3;
	wire[7:0] zpos_ClockwiseUtil_1_3_3,zpos_CounterClockwiseUtil_1_3_3,zpos_InjectUtil_1_3_3;
	wire[7:0] zneg_ClockwiseUtil_1_3_3,zneg_CounterClockwiseUtil_1_3_3,zneg_InjectUtil_1_3_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_0_0, out_xpos_ser_2_0_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_0_0, out_xneg_ser_2_0_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_0_0, out_ypos_ser_2_0_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_0_0, out_yneg_ser_2_0_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_0_0, out_zpos_ser_2_0_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_0_0, out_zneg_ser_2_0_0;
	wire[7:0] xpos_ClockwiseUtil_2_0_0,xpos_CounterClockwiseUtil_2_0_0,xpos_InjectUtil_2_0_0;
	wire[7:0] xneg_ClockwiseUtil_2_0_0,xneg_CounterClockwiseUtil_2_0_0,xneg_InjectUtil_2_0_0;
	wire[7:0] ypos_ClockwiseUtil_2_0_0,ypos_CounterClockwiseUtil_2_0_0,ypos_InjectUtil_2_0_0;
	wire[7:0] yneg_ClockwiseUtil_2_0_0,yneg_CounterClockwiseUtil_2_0_0,yneg_InjectUtil_2_0_0;
	wire[7:0] zpos_ClockwiseUtil_2_0_0,zpos_CounterClockwiseUtil_2_0_0,zpos_InjectUtil_2_0_0;
	wire[7:0] zneg_ClockwiseUtil_2_0_0,zneg_CounterClockwiseUtil_2_0_0,zneg_InjectUtil_2_0_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_0_1, out_xpos_ser_2_0_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_0_1, out_xneg_ser_2_0_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_0_1, out_ypos_ser_2_0_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_0_1, out_yneg_ser_2_0_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_0_1, out_zpos_ser_2_0_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_0_1, out_zneg_ser_2_0_1;
	wire[7:0] xpos_ClockwiseUtil_2_0_1,xpos_CounterClockwiseUtil_2_0_1,xpos_InjectUtil_2_0_1;
	wire[7:0] xneg_ClockwiseUtil_2_0_1,xneg_CounterClockwiseUtil_2_0_1,xneg_InjectUtil_2_0_1;
	wire[7:0] ypos_ClockwiseUtil_2_0_1,ypos_CounterClockwiseUtil_2_0_1,ypos_InjectUtil_2_0_1;
	wire[7:0] yneg_ClockwiseUtil_2_0_1,yneg_CounterClockwiseUtil_2_0_1,yneg_InjectUtil_2_0_1;
	wire[7:0] zpos_ClockwiseUtil_2_0_1,zpos_CounterClockwiseUtil_2_0_1,zpos_InjectUtil_2_0_1;
	wire[7:0] zneg_ClockwiseUtil_2_0_1,zneg_CounterClockwiseUtil_2_0_1,zneg_InjectUtil_2_0_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_0_2, out_xpos_ser_2_0_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_0_2, out_xneg_ser_2_0_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_0_2, out_ypos_ser_2_0_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_0_2, out_yneg_ser_2_0_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_0_2, out_zpos_ser_2_0_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_0_2, out_zneg_ser_2_0_2;
	wire[7:0] xpos_ClockwiseUtil_2_0_2,xpos_CounterClockwiseUtil_2_0_2,xpos_InjectUtil_2_0_2;
	wire[7:0] xneg_ClockwiseUtil_2_0_2,xneg_CounterClockwiseUtil_2_0_2,xneg_InjectUtil_2_0_2;
	wire[7:0] ypos_ClockwiseUtil_2_0_2,ypos_CounterClockwiseUtil_2_0_2,ypos_InjectUtil_2_0_2;
	wire[7:0] yneg_ClockwiseUtil_2_0_2,yneg_CounterClockwiseUtil_2_0_2,yneg_InjectUtil_2_0_2;
	wire[7:0] zpos_ClockwiseUtil_2_0_2,zpos_CounterClockwiseUtil_2_0_2,zpos_InjectUtil_2_0_2;
	wire[7:0] zneg_ClockwiseUtil_2_0_2,zneg_CounterClockwiseUtil_2_0_2,zneg_InjectUtil_2_0_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_0_3, out_xpos_ser_2_0_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_0_3, out_xneg_ser_2_0_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_0_3, out_ypos_ser_2_0_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_0_3, out_yneg_ser_2_0_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_0_3, out_zpos_ser_2_0_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_0_3, out_zneg_ser_2_0_3;
	wire[7:0] xpos_ClockwiseUtil_2_0_3,xpos_CounterClockwiseUtil_2_0_3,xpos_InjectUtil_2_0_3;
	wire[7:0] xneg_ClockwiseUtil_2_0_3,xneg_CounterClockwiseUtil_2_0_3,xneg_InjectUtil_2_0_3;
	wire[7:0] ypos_ClockwiseUtil_2_0_3,ypos_CounterClockwiseUtil_2_0_3,ypos_InjectUtil_2_0_3;
	wire[7:0] yneg_ClockwiseUtil_2_0_3,yneg_CounterClockwiseUtil_2_0_3,yneg_InjectUtil_2_0_3;
	wire[7:0] zpos_ClockwiseUtil_2_0_3,zpos_CounterClockwiseUtil_2_0_3,zpos_InjectUtil_2_0_3;
	wire[7:0] zneg_ClockwiseUtil_2_0_3,zneg_CounterClockwiseUtil_2_0_3,zneg_InjectUtil_2_0_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_1_0, out_xpos_ser_2_1_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_1_0, out_xneg_ser_2_1_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_1_0, out_ypos_ser_2_1_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_1_0, out_yneg_ser_2_1_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_1_0, out_zpos_ser_2_1_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_1_0, out_zneg_ser_2_1_0;
	wire[7:0] xpos_ClockwiseUtil_2_1_0,xpos_CounterClockwiseUtil_2_1_0,xpos_InjectUtil_2_1_0;
	wire[7:0] xneg_ClockwiseUtil_2_1_0,xneg_CounterClockwiseUtil_2_1_0,xneg_InjectUtil_2_1_0;
	wire[7:0] ypos_ClockwiseUtil_2_1_0,ypos_CounterClockwiseUtil_2_1_0,ypos_InjectUtil_2_1_0;
	wire[7:0] yneg_ClockwiseUtil_2_1_0,yneg_CounterClockwiseUtil_2_1_0,yneg_InjectUtil_2_1_0;
	wire[7:0] zpos_ClockwiseUtil_2_1_0,zpos_CounterClockwiseUtil_2_1_0,zpos_InjectUtil_2_1_0;
	wire[7:0] zneg_ClockwiseUtil_2_1_0,zneg_CounterClockwiseUtil_2_1_0,zneg_InjectUtil_2_1_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_1_1, out_xpos_ser_2_1_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_1_1, out_xneg_ser_2_1_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_1_1, out_ypos_ser_2_1_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_1_1, out_yneg_ser_2_1_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_1_1, out_zpos_ser_2_1_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_1_1, out_zneg_ser_2_1_1;
	wire[7:0] xpos_ClockwiseUtil_2_1_1,xpos_CounterClockwiseUtil_2_1_1,xpos_InjectUtil_2_1_1;
	wire[7:0] xneg_ClockwiseUtil_2_1_1,xneg_CounterClockwiseUtil_2_1_1,xneg_InjectUtil_2_1_1;
	wire[7:0] ypos_ClockwiseUtil_2_1_1,ypos_CounterClockwiseUtil_2_1_1,ypos_InjectUtil_2_1_1;
	wire[7:0] yneg_ClockwiseUtil_2_1_1,yneg_CounterClockwiseUtil_2_1_1,yneg_InjectUtil_2_1_1;
	wire[7:0] zpos_ClockwiseUtil_2_1_1,zpos_CounterClockwiseUtil_2_1_1,zpos_InjectUtil_2_1_1;
	wire[7:0] zneg_ClockwiseUtil_2_1_1,zneg_CounterClockwiseUtil_2_1_1,zneg_InjectUtil_2_1_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_1_2, out_xpos_ser_2_1_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_1_2, out_xneg_ser_2_1_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_1_2, out_ypos_ser_2_1_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_1_2, out_yneg_ser_2_1_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_1_2, out_zpos_ser_2_1_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_1_2, out_zneg_ser_2_1_2;
	wire[7:0] xpos_ClockwiseUtil_2_1_2,xpos_CounterClockwiseUtil_2_1_2,xpos_InjectUtil_2_1_2;
	wire[7:0] xneg_ClockwiseUtil_2_1_2,xneg_CounterClockwiseUtil_2_1_2,xneg_InjectUtil_2_1_2;
	wire[7:0] ypos_ClockwiseUtil_2_1_2,ypos_CounterClockwiseUtil_2_1_2,ypos_InjectUtil_2_1_2;
	wire[7:0] yneg_ClockwiseUtil_2_1_2,yneg_CounterClockwiseUtil_2_1_2,yneg_InjectUtil_2_1_2;
	wire[7:0] zpos_ClockwiseUtil_2_1_2,zpos_CounterClockwiseUtil_2_1_2,zpos_InjectUtil_2_1_2;
	wire[7:0] zneg_ClockwiseUtil_2_1_2,zneg_CounterClockwiseUtil_2_1_2,zneg_InjectUtil_2_1_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_1_3, out_xpos_ser_2_1_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_1_3, out_xneg_ser_2_1_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_1_3, out_ypos_ser_2_1_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_1_3, out_yneg_ser_2_1_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_1_3, out_zpos_ser_2_1_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_1_3, out_zneg_ser_2_1_3;
	wire[7:0] xpos_ClockwiseUtil_2_1_3,xpos_CounterClockwiseUtil_2_1_3,xpos_InjectUtil_2_1_3;
	wire[7:0] xneg_ClockwiseUtil_2_1_3,xneg_CounterClockwiseUtil_2_1_3,xneg_InjectUtil_2_1_3;
	wire[7:0] ypos_ClockwiseUtil_2_1_3,ypos_CounterClockwiseUtil_2_1_3,ypos_InjectUtil_2_1_3;
	wire[7:0] yneg_ClockwiseUtil_2_1_3,yneg_CounterClockwiseUtil_2_1_3,yneg_InjectUtil_2_1_3;
	wire[7:0] zpos_ClockwiseUtil_2_1_3,zpos_CounterClockwiseUtil_2_1_3,zpos_InjectUtil_2_1_3;
	wire[7:0] zneg_ClockwiseUtil_2_1_3,zneg_CounterClockwiseUtil_2_1_3,zneg_InjectUtil_2_1_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_2_0, out_xpos_ser_2_2_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_2_0, out_xneg_ser_2_2_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_2_0, out_ypos_ser_2_2_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_2_0, out_yneg_ser_2_2_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_2_0, out_zpos_ser_2_2_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_2_0, out_zneg_ser_2_2_0;
	wire[7:0] xpos_ClockwiseUtil_2_2_0,xpos_CounterClockwiseUtil_2_2_0,xpos_InjectUtil_2_2_0;
	wire[7:0] xneg_ClockwiseUtil_2_2_0,xneg_CounterClockwiseUtil_2_2_0,xneg_InjectUtil_2_2_0;
	wire[7:0] ypos_ClockwiseUtil_2_2_0,ypos_CounterClockwiseUtil_2_2_0,ypos_InjectUtil_2_2_0;
	wire[7:0] yneg_ClockwiseUtil_2_2_0,yneg_CounterClockwiseUtil_2_2_0,yneg_InjectUtil_2_2_0;
	wire[7:0] zpos_ClockwiseUtil_2_2_0,zpos_CounterClockwiseUtil_2_2_0,zpos_InjectUtil_2_2_0;
	wire[7:0] zneg_ClockwiseUtil_2_2_0,zneg_CounterClockwiseUtil_2_2_0,zneg_InjectUtil_2_2_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_2_1, out_xpos_ser_2_2_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_2_1, out_xneg_ser_2_2_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_2_1, out_ypos_ser_2_2_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_2_1, out_yneg_ser_2_2_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_2_1, out_zpos_ser_2_2_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_2_1, out_zneg_ser_2_2_1;
	wire[7:0] xpos_ClockwiseUtil_2_2_1,xpos_CounterClockwiseUtil_2_2_1,xpos_InjectUtil_2_2_1;
	wire[7:0] xneg_ClockwiseUtil_2_2_1,xneg_CounterClockwiseUtil_2_2_1,xneg_InjectUtil_2_2_1;
	wire[7:0] ypos_ClockwiseUtil_2_2_1,ypos_CounterClockwiseUtil_2_2_1,ypos_InjectUtil_2_2_1;
	wire[7:0] yneg_ClockwiseUtil_2_2_1,yneg_CounterClockwiseUtil_2_2_1,yneg_InjectUtil_2_2_1;
	wire[7:0] zpos_ClockwiseUtil_2_2_1,zpos_CounterClockwiseUtil_2_2_1,zpos_InjectUtil_2_2_1;
	wire[7:0] zneg_ClockwiseUtil_2_2_1,zneg_CounterClockwiseUtil_2_2_1,zneg_InjectUtil_2_2_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_2_2, out_xpos_ser_2_2_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_2_2, out_xneg_ser_2_2_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_2_2, out_ypos_ser_2_2_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_2_2, out_yneg_ser_2_2_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_2_2, out_zpos_ser_2_2_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_2_2, out_zneg_ser_2_2_2;
	wire[7:0] xpos_ClockwiseUtil_2_2_2,xpos_CounterClockwiseUtil_2_2_2,xpos_InjectUtil_2_2_2;
	wire[7:0] xneg_ClockwiseUtil_2_2_2,xneg_CounterClockwiseUtil_2_2_2,xneg_InjectUtil_2_2_2;
	wire[7:0] ypos_ClockwiseUtil_2_2_2,ypos_CounterClockwiseUtil_2_2_2,ypos_InjectUtil_2_2_2;
	wire[7:0] yneg_ClockwiseUtil_2_2_2,yneg_CounterClockwiseUtil_2_2_2,yneg_InjectUtil_2_2_2;
	wire[7:0] zpos_ClockwiseUtil_2_2_2,zpos_CounterClockwiseUtil_2_2_2,zpos_InjectUtil_2_2_2;
	wire[7:0] zneg_ClockwiseUtil_2_2_2,zneg_CounterClockwiseUtil_2_2_2,zneg_InjectUtil_2_2_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_2_3, out_xpos_ser_2_2_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_2_3, out_xneg_ser_2_2_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_2_3, out_ypos_ser_2_2_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_2_3, out_yneg_ser_2_2_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_2_3, out_zpos_ser_2_2_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_2_3, out_zneg_ser_2_2_3;
	wire[7:0] xpos_ClockwiseUtil_2_2_3,xpos_CounterClockwiseUtil_2_2_3,xpos_InjectUtil_2_2_3;
	wire[7:0] xneg_ClockwiseUtil_2_2_3,xneg_CounterClockwiseUtil_2_2_3,xneg_InjectUtil_2_2_3;
	wire[7:0] ypos_ClockwiseUtil_2_2_3,ypos_CounterClockwiseUtil_2_2_3,ypos_InjectUtil_2_2_3;
	wire[7:0] yneg_ClockwiseUtil_2_2_3,yneg_CounterClockwiseUtil_2_2_3,yneg_InjectUtil_2_2_3;
	wire[7:0] zpos_ClockwiseUtil_2_2_3,zpos_CounterClockwiseUtil_2_2_3,zpos_InjectUtil_2_2_3;
	wire[7:0] zneg_ClockwiseUtil_2_2_3,zneg_CounterClockwiseUtil_2_2_3,zneg_InjectUtil_2_2_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_3_0, out_xpos_ser_2_3_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_3_0, out_xneg_ser_2_3_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_3_0, out_ypos_ser_2_3_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_3_0, out_yneg_ser_2_3_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_3_0, out_zpos_ser_2_3_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_3_0, out_zneg_ser_2_3_0;
	wire[7:0] xpos_ClockwiseUtil_2_3_0,xpos_CounterClockwiseUtil_2_3_0,xpos_InjectUtil_2_3_0;
	wire[7:0] xneg_ClockwiseUtil_2_3_0,xneg_CounterClockwiseUtil_2_3_0,xneg_InjectUtil_2_3_0;
	wire[7:0] ypos_ClockwiseUtil_2_3_0,ypos_CounterClockwiseUtil_2_3_0,ypos_InjectUtil_2_3_0;
	wire[7:0] yneg_ClockwiseUtil_2_3_0,yneg_CounterClockwiseUtil_2_3_0,yneg_InjectUtil_2_3_0;
	wire[7:0] zpos_ClockwiseUtil_2_3_0,zpos_CounterClockwiseUtil_2_3_0,zpos_InjectUtil_2_3_0;
	wire[7:0] zneg_ClockwiseUtil_2_3_0,zneg_CounterClockwiseUtil_2_3_0,zneg_InjectUtil_2_3_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_3_1, out_xpos_ser_2_3_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_3_1, out_xneg_ser_2_3_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_3_1, out_ypos_ser_2_3_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_3_1, out_yneg_ser_2_3_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_3_1, out_zpos_ser_2_3_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_3_1, out_zneg_ser_2_3_1;
	wire[7:0] xpos_ClockwiseUtil_2_3_1,xpos_CounterClockwiseUtil_2_3_1,xpos_InjectUtil_2_3_1;
	wire[7:0] xneg_ClockwiseUtil_2_3_1,xneg_CounterClockwiseUtil_2_3_1,xneg_InjectUtil_2_3_1;
	wire[7:0] ypos_ClockwiseUtil_2_3_1,ypos_CounterClockwiseUtil_2_3_1,ypos_InjectUtil_2_3_1;
	wire[7:0] yneg_ClockwiseUtil_2_3_1,yneg_CounterClockwiseUtil_2_3_1,yneg_InjectUtil_2_3_1;
	wire[7:0] zpos_ClockwiseUtil_2_3_1,zpos_CounterClockwiseUtil_2_3_1,zpos_InjectUtil_2_3_1;
	wire[7:0] zneg_ClockwiseUtil_2_3_1,zneg_CounterClockwiseUtil_2_3_1,zneg_InjectUtil_2_3_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_3_2, out_xpos_ser_2_3_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_3_2, out_xneg_ser_2_3_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_3_2, out_ypos_ser_2_3_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_3_2, out_yneg_ser_2_3_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_3_2, out_zpos_ser_2_3_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_3_2, out_zneg_ser_2_3_2;
	wire[7:0] xpos_ClockwiseUtil_2_3_2,xpos_CounterClockwiseUtil_2_3_2,xpos_InjectUtil_2_3_2;
	wire[7:0] xneg_ClockwiseUtil_2_3_2,xneg_CounterClockwiseUtil_2_3_2,xneg_InjectUtil_2_3_2;
	wire[7:0] ypos_ClockwiseUtil_2_3_2,ypos_CounterClockwiseUtil_2_3_2,ypos_InjectUtil_2_3_2;
	wire[7:0] yneg_ClockwiseUtil_2_3_2,yneg_CounterClockwiseUtil_2_3_2,yneg_InjectUtil_2_3_2;
	wire[7:0] zpos_ClockwiseUtil_2_3_2,zpos_CounterClockwiseUtil_2_3_2,zpos_InjectUtil_2_3_2;
	wire[7:0] zneg_ClockwiseUtil_2_3_2,zneg_CounterClockwiseUtil_2_3_2,zneg_InjectUtil_2_3_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_2_3_3, out_xpos_ser_2_3_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_2_3_3, out_xneg_ser_2_3_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_2_3_3, out_ypos_ser_2_3_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_2_3_3, out_yneg_ser_2_3_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_2_3_3, out_zpos_ser_2_3_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_2_3_3, out_zneg_ser_2_3_3;
	wire[7:0] xpos_ClockwiseUtil_2_3_3,xpos_CounterClockwiseUtil_2_3_3,xpos_InjectUtil_2_3_3;
	wire[7:0] xneg_ClockwiseUtil_2_3_3,xneg_CounterClockwiseUtil_2_3_3,xneg_InjectUtil_2_3_3;
	wire[7:0] ypos_ClockwiseUtil_2_3_3,ypos_CounterClockwiseUtil_2_3_3,ypos_InjectUtil_2_3_3;
	wire[7:0] yneg_ClockwiseUtil_2_3_3,yneg_CounterClockwiseUtil_2_3_3,yneg_InjectUtil_2_3_3;
	wire[7:0] zpos_ClockwiseUtil_2_3_3,zpos_CounterClockwiseUtil_2_3_3,zpos_InjectUtil_2_3_3;
	wire[7:0] zneg_ClockwiseUtil_2_3_3,zneg_CounterClockwiseUtil_2_3_3,zneg_InjectUtil_2_3_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_0_0, out_xpos_ser_3_0_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_0_0, out_xneg_ser_3_0_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_0_0, out_ypos_ser_3_0_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_0_0, out_yneg_ser_3_0_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_0_0, out_zpos_ser_3_0_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_0_0, out_zneg_ser_3_0_0;
	wire[7:0] xpos_ClockwiseUtil_3_0_0,xpos_CounterClockwiseUtil_3_0_0,xpos_InjectUtil_3_0_0;
	wire[7:0] xneg_ClockwiseUtil_3_0_0,xneg_CounterClockwiseUtil_3_0_0,xneg_InjectUtil_3_0_0;
	wire[7:0] ypos_ClockwiseUtil_3_0_0,ypos_CounterClockwiseUtil_3_0_0,ypos_InjectUtil_3_0_0;
	wire[7:0] yneg_ClockwiseUtil_3_0_0,yneg_CounterClockwiseUtil_3_0_0,yneg_InjectUtil_3_0_0;
	wire[7:0] zpos_ClockwiseUtil_3_0_0,zpos_CounterClockwiseUtil_3_0_0,zpos_InjectUtil_3_0_0;
	wire[7:0] zneg_ClockwiseUtil_3_0_0,zneg_CounterClockwiseUtil_3_0_0,zneg_InjectUtil_3_0_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_0_1, out_xpos_ser_3_0_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_0_1, out_xneg_ser_3_0_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_0_1, out_ypos_ser_3_0_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_0_1, out_yneg_ser_3_0_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_0_1, out_zpos_ser_3_0_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_0_1, out_zneg_ser_3_0_1;
	wire[7:0] xpos_ClockwiseUtil_3_0_1,xpos_CounterClockwiseUtil_3_0_1,xpos_InjectUtil_3_0_1;
	wire[7:0] xneg_ClockwiseUtil_3_0_1,xneg_CounterClockwiseUtil_3_0_1,xneg_InjectUtil_3_0_1;
	wire[7:0] ypos_ClockwiseUtil_3_0_1,ypos_CounterClockwiseUtil_3_0_1,ypos_InjectUtil_3_0_1;
	wire[7:0] yneg_ClockwiseUtil_3_0_1,yneg_CounterClockwiseUtil_3_0_1,yneg_InjectUtil_3_0_1;
	wire[7:0] zpos_ClockwiseUtil_3_0_1,zpos_CounterClockwiseUtil_3_0_1,zpos_InjectUtil_3_0_1;
	wire[7:0] zneg_ClockwiseUtil_3_0_1,zneg_CounterClockwiseUtil_3_0_1,zneg_InjectUtil_3_0_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_0_2, out_xpos_ser_3_0_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_0_2, out_xneg_ser_3_0_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_0_2, out_ypos_ser_3_0_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_0_2, out_yneg_ser_3_0_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_0_2, out_zpos_ser_3_0_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_0_2, out_zneg_ser_3_0_2;
	wire[7:0] xpos_ClockwiseUtil_3_0_2,xpos_CounterClockwiseUtil_3_0_2,xpos_InjectUtil_3_0_2;
	wire[7:0] xneg_ClockwiseUtil_3_0_2,xneg_CounterClockwiseUtil_3_0_2,xneg_InjectUtil_3_0_2;
	wire[7:0] ypos_ClockwiseUtil_3_0_2,ypos_CounterClockwiseUtil_3_0_2,ypos_InjectUtil_3_0_2;
	wire[7:0] yneg_ClockwiseUtil_3_0_2,yneg_CounterClockwiseUtil_3_0_2,yneg_InjectUtil_3_0_2;
	wire[7:0] zpos_ClockwiseUtil_3_0_2,zpos_CounterClockwiseUtil_3_0_2,zpos_InjectUtil_3_0_2;
	wire[7:0] zneg_ClockwiseUtil_3_0_2,zneg_CounterClockwiseUtil_3_0_2,zneg_InjectUtil_3_0_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_0_3, out_xpos_ser_3_0_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_0_3, out_xneg_ser_3_0_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_0_3, out_ypos_ser_3_0_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_0_3, out_yneg_ser_3_0_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_0_3, out_zpos_ser_3_0_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_0_3, out_zneg_ser_3_0_3;
	wire[7:0] xpos_ClockwiseUtil_3_0_3,xpos_CounterClockwiseUtil_3_0_3,xpos_InjectUtil_3_0_3;
	wire[7:0] xneg_ClockwiseUtil_3_0_3,xneg_CounterClockwiseUtil_3_0_3,xneg_InjectUtil_3_0_3;
	wire[7:0] ypos_ClockwiseUtil_3_0_3,ypos_CounterClockwiseUtil_3_0_3,ypos_InjectUtil_3_0_3;
	wire[7:0] yneg_ClockwiseUtil_3_0_3,yneg_CounterClockwiseUtil_3_0_3,yneg_InjectUtil_3_0_3;
	wire[7:0] zpos_ClockwiseUtil_3_0_3,zpos_CounterClockwiseUtil_3_0_3,zpos_InjectUtil_3_0_3;
	wire[7:0] zneg_ClockwiseUtil_3_0_3,zneg_CounterClockwiseUtil_3_0_3,zneg_InjectUtil_3_0_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_1_0, out_xpos_ser_3_1_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_1_0, out_xneg_ser_3_1_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_1_0, out_ypos_ser_3_1_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_1_0, out_yneg_ser_3_1_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_1_0, out_zpos_ser_3_1_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_1_0, out_zneg_ser_3_1_0;
	wire[7:0] xpos_ClockwiseUtil_3_1_0,xpos_CounterClockwiseUtil_3_1_0,xpos_InjectUtil_3_1_0;
	wire[7:0] xneg_ClockwiseUtil_3_1_0,xneg_CounterClockwiseUtil_3_1_0,xneg_InjectUtil_3_1_0;
	wire[7:0] ypos_ClockwiseUtil_3_1_0,ypos_CounterClockwiseUtil_3_1_0,ypos_InjectUtil_3_1_0;
	wire[7:0] yneg_ClockwiseUtil_3_1_0,yneg_CounterClockwiseUtil_3_1_0,yneg_InjectUtil_3_1_0;
	wire[7:0] zpos_ClockwiseUtil_3_1_0,zpos_CounterClockwiseUtil_3_1_0,zpos_InjectUtil_3_1_0;
	wire[7:0] zneg_ClockwiseUtil_3_1_0,zneg_CounterClockwiseUtil_3_1_0,zneg_InjectUtil_3_1_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_1_1, out_xpos_ser_3_1_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_1_1, out_xneg_ser_3_1_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_1_1, out_ypos_ser_3_1_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_1_1, out_yneg_ser_3_1_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_1_1, out_zpos_ser_3_1_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_1_1, out_zneg_ser_3_1_1;
	wire[7:0] xpos_ClockwiseUtil_3_1_1,xpos_CounterClockwiseUtil_3_1_1,xpos_InjectUtil_3_1_1;
	wire[7:0] xneg_ClockwiseUtil_3_1_1,xneg_CounterClockwiseUtil_3_1_1,xneg_InjectUtil_3_1_1;
	wire[7:0] ypos_ClockwiseUtil_3_1_1,ypos_CounterClockwiseUtil_3_1_1,ypos_InjectUtil_3_1_1;
	wire[7:0] yneg_ClockwiseUtil_3_1_1,yneg_CounterClockwiseUtil_3_1_1,yneg_InjectUtil_3_1_1;
	wire[7:0] zpos_ClockwiseUtil_3_1_1,zpos_CounterClockwiseUtil_3_1_1,zpos_InjectUtil_3_1_1;
	wire[7:0] zneg_ClockwiseUtil_3_1_1,zneg_CounterClockwiseUtil_3_1_1,zneg_InjectUtil_3_1_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_1_2, out_xpos_ser_3_1_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_1_2, out_xneg_ser_3_1_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_1_2, out_ypos_ser_3_1_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_1_2, out_yneg_ser_3_1_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_1_2, out_zpos_ser_3_1_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_1_2, out_zneg_ser_3_1_2;
	wire[7:0] xpos_ClockwiseUtil_3_1_2,xpos_CounterClockwiseUtil_3_1_2,xpos_InjectUtil_3_1_2;
	wire[7:0] xneg_ClockwiseUtil_3_1_2,xneg_CounterClockwiseUtil_3_1_2,xneg_InjectUtil_3_1_2;
	wire[7:0] ypos_ClockwiseUtil_3_1_2,ypos_CounterClockwiseUtil_3_1_2,ypos_InjectUtil_3_1_2;
	wire[7:0] yneg_ClockwiseUtil_3_1_2,yneg_CounterClockwiseUtil_3_1_2,yneg_InjectUtil_3_1_2;
	wire[7:0] zpos_ClockwiseUtil_3_1_2,zpos_CounterClockwiseUtil_3_1_2,zpos_InjectUtil_3_1_2;
	wire[7:0] zneg_ClockwiseUtil_3_1_2,zneg_CounterClockwiseUtil_3_1_2,zneg_InjectUtil_3_1_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_1_3, out_xpos_ser_3_1_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_1_3, out_xneg_ser_3_1_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_1_3, out_ypos_ser_3_1_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_1_3, out_yneg_ser_3_1_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_1_3, out_zpos_ser_3_1_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_1_3, out_zneg_ser_3_1_3;
	wire[7:0] xpos_ClockwiseUtil_3_1_3,xpos_CounterClockwiseUtil_3_1_3,xpos_InjectUtil_3_1_3;
	wire[7:0] xneg_ClockwiseUtil_3_1_3,xneg_CounterClockwiseUtil_3_1_3,xneg_InjectUtil_3_1_3;
	wire[7:0] ypos_ClockwiseUtil_3_1_3,ypos_CounterClockwiseUtil_3_1_3,ypos_InjectUtil_3_1_3;
	wire[7:0] yneg_ClockwiseUtil_3_1_3,yneg_CounterClockwiseUtil_3_1_3,yneg_InjectUtil_3_1_3;
	wire[7:0] zpos_ClockwiseUtil_3_1_3,zpos_CounterClockwiseUtil_3_1_3,zpos_InjectUtil_3_1_3;
	wire[7:0] zneg_ClockwiseUtil_3_1_3,zneg_CounterClockwiseUtil_3_1_3,zneg_InjectUtil_3_1_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_2_0, out_xpos_ser_3_2_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_2_0, out_xneg_ser_3_2_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_2_0, out_ypos_ser_3_2_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_2_0, out_yneg_ser_3_2_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_2_0, out_zpos_ser_3_2_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_2_0, out_zneg_ser_3_2_0;
	wire[7:0] xpos_ClockwiseUtil_3_2_0,xpos_CounterClockwiseUtil_3_2_0,xpos_InjectUtil_3_2_0;
	wire[7:0] xneg_ClockwiseUtil_3_2_0,xneg_CounterClockwiseUtil_3_2_0,xneg_InjectUtil_3_2_0;
	wire[7:0] ypos_ClockwiseUtil_3_2_0,ypos_CounterClockwiseUtil_3_2_0,ypos_InjectUtil_3_2_0;
	wire[7:0] yneg_ClockwiseUtil_3_2_0,yneg_CounterClockwiseUtil_3_2_0,yneg_InjectUtil_3_2_0;
	wire[7:0] zpos_ClockwiseUtil_3_2_0,zpos_CounterClockwiseUtil_3_2_0,zpos_InjectUtil_3_2_0;
	wire[7:0] zneg_ClockwiseUtil_3_2_0,zneg_CounterClockwiseUtil_3_2_0,zneg_InjectUtil_3_2_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_2_1, out_xpos_ser_3_2_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_2_1, out_xneg_ser_3_2_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_2_1, out_ypos_ser_3_2_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_2_1, out_yneg_ser_3_2_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_2_1, out_zpos_ser_3_2_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_2_1, out_zneg_ser_3_2_1;
	wire[7:0] xpos_ClockwiseUtil_3_2_1,xpos_CounterClockwiseUtil_3_2_1,xpos_InjectUtil_3_2_1;
	wire[7:0] xneg_ClockwiseUtil_3_2_1,xneg_CounterClockwiseUtil_3_2_1,xneg_InjectUtil_3_2_1;
	wire[7:0] ypos_ClockwiseUtil_3_2_1,ypos_CounterClockwiseUtil_3_2_1,ypos_InjectUtil_3_2_1;
	wire[7:0] yneg_ClockwiseUtil_3_2_1,yneg_CounterClockwiseUtil_3_2_1,yneg_InjectUtil_3_2_1;
	wire[7:0] zpos_ClockwiseUtil_3_2_1,zpos_CounterClockwiseUtil_3_2_1,zpos_InjectUtil_3_2_1;
	wire[7:0] zneg_ClockwiseUtil_3_2_1,zneg_CounterClockwiseUtil_3_2_1,zneg_InjectUtil_3_2_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_2_2, out_xpos_ser_3_2_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_2_2, out_xneg_ser_3_2_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_2_2, out_ypos_ser_3_2_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_2_2, out_yneg_ser_3_2_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_2_2, out_zpos_ser_3_2_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_2_2, out_zneg_ser_3_2_2;
	wire[7:0] xpos_ClockwiseUtil_3_2_2,xpos_CounterClockwiseUtil_3_2_2,xpos_InjectUtil_3_2_2;
	wire[7:0] xneg_ClockwiseUtil_3_2_2,xneg_CounterClockwiseUtil_3_2_2,xneg_InjectUtil_3_2_2;
	wire[7:0] ypos_ClockwiseUtil_3_2_2,ypos_CounterClockwiseUtil_3_2_2,ypos_InjectUtil_3_2_2;
	wire[7:0] yneg_ClockwiseUtil_3_2_2,yneg_CounterClockwiseUtil_3_2_2,yneg_InjectUtil_3_2_2;
	wire[7:0] zpos_ClockwiseUtil_3_2_2,zpos_CounterClockwiseUtil_3_2_2,zpos_InjectUtil_3_2_2;
	wire[7:0] zneg_ClockwiseUtil_3_2_2,zneg_CounterClockwiseUtil_3_2_2,zneg_InjectUtil_3_2_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_2_3, out_xpos_ser_3_2_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_2_3, out_xneg_ser_3_2_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_2_3, out_ypos_ser_3_2_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_2_3, out_yneg_ser_3_2_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_2_3, out_zpos_ser_3_2_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_2_3, out_zneg_ser_3_2_3;
	wire[7:0] xpos_ClockwiseUtil_3_2_3,xpos_CounterClockwiseUtil_3_2_3,xpos_InjectUtil_3_2_3;
	wire[7:0] xneg_ClockwiseUtil_3_2_3,xneg_CounterClockwiseUtil_3_2_3,xneg_InjectUtil_3_2_3;
	wire[7:0] ypos_ClockwiseUtil_3_2_3,ypos_CounterClockwiseUtil_3_2_3,ypos_InjectUtil_3_2_3;
	wire[7:0] yneg_ClockwiseUtil_3_2_3,yneg_CounterClockwiseUtil_3_2_3,yneg_InjectUtil_3_2_3;
	wire[7:0] zpos_ClockwiseUtil_3_2_3,zpos_CounterClockwiseUtil_3_2_3,zpos_InjectUtil_3_2_3;
	wire[7:0] zneg_ClockwiseUtil_3_2_3,zneg_CounterClockwiseUtil_3_2_3,zneg_InjectUtil_3_2_3;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_3_0, out_xpos_ser_3_3_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_3_0, out_xneg_ser_3_3_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_3_0, out_ypos_ser_3_3_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_3_0, out_yneg_ser_3_3_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_3_0, out_zpos_ser_3_3_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_3_0, out_zneg_ser_3_3_0;
	wire[7:0] xpos_ClockwiseUtil_3_3_0,xpos_CounterClockwiseUtil_3_3_0,xpos_InjectUtil_3_3_0;
	wire[7:0] xneg_ClockwiseUtil_3_3_0,xneg_CounterClockwiseUtil_3_3_0,xneg_InjectUtil_3_3_0;
	wire[7:0] ypos_ClockwiseUtil_3_3_0,ypos_CounterClockwiseUtil_3_3_0,ypos_InjectUtil_3_3_0;
	wire[7:0] yneg_ClockwiseUtil_3_3_0,yneg_CounterClockwiseUtil_3_3_0,yneg_InjectUtil_3_3_0;
	wire[7:0] zpos_ClockwiseUtil_3_3_0,zpos_CounterClockwiseUtil_3_3_0,zpos_InjectUtil_3_3_0;
	wire[7:0] zneg_ClockwiseUtil_3_3_0,zneg_CounterClockwiseUtil_3_3_0,zneg_InjectUtil_3_3_0;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_3_1, out_xpos_ser_3_3_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_3_1, out_xneg_ser_3_3_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_3_1, out_ypos_ser_3_3_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_3_1, out_yneg_ser_3_3_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_3_1, out_zpos_ser_3_3_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_3_1, out_zneg_ser_3_3_1;
	wire[7:0] xpos_ClockwiseUtil_3_3_1,xpos_CounterClockwiseUtil_3_3_1,xpos_InjectUtil_3_3_1;
	wire[7:0] xneg_ClockwiseUtil_3_3_1,xneg_CounterClockwiseUtil_3_3_1,xneg_InjectUtil_3_3_1;
	wire[7:0] ypos_ClockwiseUtil_3_3_1,ypos_CounterClockwiseUtil_3_3_1,ypos_InjectUtil_3_3_1;
	wire[7:0] yneg_ClockwiseUtil_3_3_1,yneg_CounterClockwiseUtil_3_3_1,yneg_InjectUtil_3_3_1;
	wire[7:0] zpos_ClockwiseUtil_3_3_1,zpos_CounterClockwiseUtil_3_3_1,zpos_InjectUtil_3_3_1;
	wire[7:0] zneg_ClockwiseUtil_3_3_1,zneg_CounterClockwiseUtil_3_3_1,zneg_InjectUtil_3_3_1;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_3_2, out_xpos_ser_3_3_2;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_3_2, out_xneg_ser_3_3_2;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_3_2, out_ypos_ser_3_3_2;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_3_2, out_yneg_ser_3_3_2;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_3_2, out_zpos_ser_3_3_2;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_3_2, out_zneg_ser_3_3_2;
	wire[7:0] xpos_ClockwiseUtil_3_3_2,xpos_CounterClockwiseUtil_3_3_2,xpos_InjectUtil_3_3_2;
	wire[7:0] xneg_ClockwiseUtil_3_3_2,xneg_CounterClockwiseUtil_3_3_2,xneg_InjectUtil_3_3_2;
	wire[7:0] ypos_ClockwiseUtil_3_3_2,ypos_CounterClockwiseUtil_3_3_2,ypos_InjectUtil_3_3_2;
	wire[7:0] yneg_ClockwiseUtil_3_3_2,yneg_CounterClockwiseUtil_3_3_2,yneg_InjectUtil_3_3_2;
	wire[7:0] zpos_ClockwiseUtil_3_3_2,zpos_CounterClockwiseUtil_3_3_2,zpos_InjectUtil_3_3_2;
	wire[7:0] zneg_ClockwiseUtil_3_3_2,zneg_CounterClockwiseUtil_3_3_2,zneg_InjectUtil_3_3_2;

	wire[FLIT_SIZE : 0] in_xpos_ser_3_3_3, out_xpos_ser_3_3_3;
	wire[FLIT_SIZE : 0] in_xneg_ser_3_3_3, out_xneg_ser_3_3_3;
	wire[FLIT_SIZE : 0] in_ypos_ser_3_3_3, out_ypos_ser_3_3_3;
	wire[FLIT_SIZE : 0] in_yneg_ser_3_3_3, out_yneg_ser_3_3_3;
	wire[FLIT_SIZE : 0] in_zpos_ser_3_3_3, out_zpos_ser_3_3_3;
	wire[FLIT_SIZE : 0] in_zneg_ser_3_3_3, out_zneg_ser_3_3_3;
	wire[7:0] xpos_ClockwiseUtil_3_3_3,xpos_CounterClockwiseUtil_3_3_3,xpos_InjectUtil_3_3_3;
	wire[7:0] xneg_ClockwiseUtil_3_3_3,xneg_CounterClockwiseUtil_3_3_3,xneg_InjectUtil_3_3_3;
	wire[7:0] ypos_ClockwiseUtil_3_3_3,ypos_CounterClockwiseUtil_3_3_3,ypos_InjectUtil_3_3_3;
	wire[7:0] yneg_ClockwiseUtil_3_3_3,yneg_CounterClockwiseUtil_3_3_3,yneg_InjectUtil_3_3_3;
	wire[7:0] zpos_ClockwiseUtil_3_3_3,zpos_CounterClockwiseUtil_3_3_3,zpos_InjectUtil_3_3_3;
	wire[7:0] zneg_ClockwiseUtil_3_3_3,zneg_CounterClockwiseUtil_3_3_3,zneg_InjectUtil_3_3_3;

	assign in_xpos_ser_0_0_0=out_xneg_ser_1_0_0;
	assign in_xneg_ser_0_0_0=out_xpos_ser_3_0_0;
	assign in_xpos_ser_0_0_1=out_xneg_ser_1_0_1;
	assign in_xneg_ser_0_0_1=out_xpos_ser_3_0_1;
	assign in_xpos_ser_0_0_2=out_xneg_ser_1_0_2;
	assign in_xneg_ser_0_0_2=out_xpos_ser_3_0_2;
	assign in_xpos_ser_0_0_3=out_xneg_ser_1_0_3;
	assign in_xneg_ser_0_0_3=out_xpos_ser_3_0_3;
	assign in_xpos_ser_0_1_0=out_xneg_ser_1_1_0;
	assign in_xneg_ser_0_1_0=out_xpos_ser_3_1_0;
	assign in_xpos_ser_0_1_1=out_xneg_ser_1_1_1;
	assign in_xneg_ser_0_1_1=out_xpos_ser_3_1_1;
	assign in_xpos_ser_0_1_2=out_xneg_ser_1_1_2;
	assign in_xneg_ser_0_1_2=out_xpos_ser_3_1_2;
	assign in_xpos_ser_0_1_3=out_xneg_ser_1_1_3;
	assign in_xneg_ser_0_1_3=out_xpos_ser_3_1_3;
	assign in_xpos_ser_0_2_0=out_xneg_ser_1_2_0;
	assign in_xneg_ser_0_2_0=out_xpos_ser_3_2_0;
	assign in_xpos_ser_0_2_1=out_xneg_ser_1_2_1;
	assign in_xneg_ser_0_2_1=out_xpos_ser_3_2_1;
	assign in_xpos_ser_0_2_2=out_xneg_ser_1_2_2;
	assign in_xneg_ser_0_2_2=out_xpos_ser_3_2_2;
	assign in_xpos_ser_0_2_3=out_xneg_ser_1_2_3;
	assign in_xneg_ser_0_2_3=out_xpos_ser_3_2_3;
	assign in_xpos_ser_0_3_0=out_xneg_ser_1_3_0;
	assign in_xneg_ser_0_3_0=out_xpos_ser_3_3_0;
	assign in_xpos_ser_0_3_1=out_xneg_ser_1_3_1;
	assign in_xneg_ser_0_3_1=out_xpos_ser_3_3_1;
	assign in_xpos_ser_0_3_2=out_xneg_ser_1_3_2;
	assign in_xneg_ser_0_3_2=out_xpos_ser_3_3_2;
	assign in_xpos_ser_0_3_3=out_xneg_ser_1_3_3;
	assign in_xneg_ser_0_3_3=out_xpos_ser_3_3_3;
	assign in_xpos_ser_1_0_0=out_xneg_ser_2_0_0;
	assign in_xneg_ser_1_0_0=out_xpos_ser_0_0_0;
	assign in_xpos_ser_1_0_1=out_xneg_ser_2_0_1;
	assign in_xneg_ser_1_0_1=out_xpos_ser_0_0_1;
	assign in_xpos_ser_1_0_2=out_xneg_ser_2_0_2;
	assign in_xneg_ser_1_0_2=out_xpos_ser_0_0_2;
	assign in_xpos_ser_1_0_3=out_xneg_ser_2_0_3;
	assign in_xneg_ser_1_0_3=out_xpos_ser_0_0_3;
	assign in_xpos_ser_1_1_0=out_xneg_ser_2_1_0;
	assign in_xneg_ser_1_1_0=out_xpos_ser_0_1_0;
	assign in_xpos_ser_1_1_1=out_xneg_ser_2_1_1;
	assign in_xneg_ser_1_1_1=out_xpos_ser_0_1_1;
	assign in_xpos_ser_1_1_2=out_xneg_ser_2_1_2;
	assign in_xneg_ser_1_1_2=out_xpos_ser_0_1_2;
	assign in_xpos_ser_1_1_3=out_xneg_ser_2_1_3;
	assign in_xneg_ser_1_1_3=out_xpos_ser_0_1_3;
	assign in_xpos_ser_1_2_0=out_xneg_ser_2_2_0;
	assign in_xneg_ser_1_2_0=out_xpos_ser_0_2_0;
	assign in_xpos_ser_1_2_1=out_xneg_ser_2_2_1;
	assign in_xneg_ser_1_2_1=out_xpos_ser_0_2_1;
	assign in_xpos_ser_1_2_2=out_xneg_ser_2_2_2;
	assign in_xneg_ser_1_2_2=out_xpos_ser_0_2_2;
	assign in_xpos_ser_1_2_3=out_xneg_ser_2_2_3;
	assign in_xneg_ser_1_2_3=out_xpos_ser_0_2_3;
	assign in_xpos_ser_1_3_0=out_xneg_ser_2_3_0;
	assign in_xneg_ser_1_3_0=out_xpos_ser_0_3_0;
	assign in_xpos_ser_1_3_1=out_xneg_ser_2_3_1;
	assign in_xneg_ser_1_3_1=out_xpos_ser_0_3_1;
	assign in_xpos_ser_1_3_2=out_xneg_ser_2_3_2;
	assign in_xneg_ser_1_3_2=out_xpos_ser_0_3_2;
	assign in_xpos_ser_1_3_3=out_xneg_ser_2_3_3;
	assign in_xneg_ser_1_3_3=out_xpos_ser_0_3_3;
	assign in_xpos_ser_2_0_0=out_xneg_ser_3_0_0;
	assign in_xneg_ser_2_0_0=out_xpos_ser_1_0_0;
	assign in_xpos_ser_2_0_1=out_xneg_ser_3_0_1;
	assign in_xneg_ser_2_0_1=out_xpos_ser_1_0_1;
	assign in_xpos_ser_2_0_2=out_xneg_ser_3_0_2;
	assign in_xneg_ser_2_0_2=out_xpos_ser_1_0_2;
	assign in_xpos_ser_2_0_3=out_xneg_ser_3_0_3;
	assign in_xneg_ser_2_0_3=out_xpos_ser_1_0_3;
	assign in_xpos_ser_2_1_0=out_xneg_ser_3_1_0;
	assign in_xneg_ser_2_1_0=out_xpos_ser_1_1_0;
	assign in_xpos_ser_2_1_1=out_xneg_ser_3_1_1;
	assign in_xneg_ser_2_1_1=out_xpos_ser_1_1_1;
	assign in_xpos_ser_2_1_2=out_xneg_ser_3_1_2;
	assign in_xneg_ser_2_1_2=out_xpos_ser_1_1_2;
	assign in_xpos_ser_2_1_3=out_xneg_ser_3_1_3;
	assign in_xneg_ser_2_1_3=out_xpos_ser_1_1_3;
	assign in_xpos_ser_2_2_0=out_xneg_ser_3_2_0;
	assign in_xneg_ser_2_2_0=out_xpos_ser_1_2_0;
	assign in_xpos_ser_2_2_1=out_xneg_ser_3_2_1;
	assign in_xneg_ser_2_2_1=out_xpos_ser_1_2_1;
	assign in_xpos_ser_2_2_2=out_xneg_ser_3_2_2;
	assign in_xneg_ser_2_2_2=out_xpos_ser_1_2_2;
	assign in_xpos_ser_2_2_3=out_xneg_ser_3_2_3;
	assign in_xneg_ser_2_2_3=out_xpos_ser_1_2_3;
	assign in_xpos_ser_2_3_0=out_xneg_ser_3_3_0;
	assign in_xneg_ser_2_3_0=out_xpos_ser_1_3_0;
	assign in_xpos_ser_2_3_1=out_xneg_ser_3_3_1;
	assign in_xneg_ser_2_3_1=out_xpos_ser_1_3_1;
	assign in_xpos_ser_2_3_2=out_xneg_ser_3_3_2;
	assign in_xneg_ser_2_3_2=out_xpos_ser_1_3_2;
	assign in_xpos_ser_2_3_3=out_xneg_ser_3_3_3;
	assign in_xneg_ser_2_3_3=out_xpos_ser_1_3_3;
	assign in_xpos_ser_3_0_0=out_xneg_ser_0_0_0;
	assign in_xneg_ser_3_0_0=out_xpos_ser_2_0_0;
	assign in_xpos_ser_3_0_1=out_xneg_ser_0_0_1;
	assign in_xneg_ser_3_0_1=out_xpos_ser_2_0_1;
	assign in_xpos_ser_3_0_2=out_xneg_ser_0_0_2;
	assign in_xneg_ser_3_0_2=out_xpos_ser_2_0_2;
	assign in_xpos_ser_3_0_3=out_xneg_ser_0_0_3;
	assign in_xneg_ser_3_0_3=out_xpos_ser_2_0_3;
	assign in_xpos_ser_3_1_0=out_xneg_ser_0_1_0;
	assign in_xneg_ser_3_1_0=out_xpos_ser_2_1_0;
	assign in_xpos_ser_3_1_1=out_xneg_ser_0_1_1;
	assign in_xneg_ser_3_1_1=out_xpos_ser_2_1_1;
	assign in_xpos_ser_3_1_2=out_xneg_ser_0_1_2;
	assign in_xneg_ser_3_1_2=out_xpos_ser_2_1_2;
	assign in_xpos_ser_3_1_3=out_xneg_ser_0_1_3;
	assign in_xneg_ser_3_1_3=out_xpos_ser_2_1_3;
	assign in_xpos_ser_3_2_0=out_xneg_ser_0_2_0;
	assign in_xneg_ser_3_2_0=out_xpos_ser_2_2_0;
	assign in_xpos_ser_3_2_1=out_xneg_ser_0_2_1;
	assign in_xneg_ser_3_2_1=out_xpos_ser_2_2_1;
	assign in_xpos_ser_3_2_2=out_xneg_ser_0_2_2;
	assign in_xneg_ser_3_2_2=out_xpos_ser_2_2_2;
	assign in_xpos_ser_3_2_3=out_xneg_ser_0_2_3;
	assign in_xneg_ser_3_2_3=out_xpos_ser_2_2_3;
	assign in_xpos_ser_3_3_0=out_xneg_ser_0_3_0;
	assign in_xneg_ser_3_3_0=out_xpos_ser_2_3_0;
	assign in_xpos_ser_3_3_1=out_xneg_ser_0_3_1;
	assign in_xneg_ser_3_3_1=out_xpos_ser_2_3_1;
	assign in_xpos_ser_3_3_2=out_xneg_ser_0_3_2;
	assign in_xneg_ser_3_3_2=out_xpos_ser_2_3_2;
	assign in_xpos_ser_3_3_3=out_xneg_ser_0_3_3;
	assign in_xneg_ser_3_3_3=out_xpos_ser_2_3_3;
	assign in_ypos_ser_0_0_0=out_yneg_ser_0_1_0;
	assign in_yneg_ser_0_0_0=out_ypos_ser_0_3_0;
	assign in_ypos_ser_0_0_1=out_yneg_ser_0_1_1;
	assign in_yneg_ser_0_0_1=out_ypos_ser_0_3_1;
	assign in_ypos_ser_0_0_2=out_yneg_ser_0_1_2;
	assign in_yneg_ser_0_0_2=out_ypos_ser_0_3_2;
	assign in_ypos_ser_0_0_3=out_yneg_ser_0_1_3;
	assign in_yneg_ser_0_0_3=out_ypos_ser_0_3_3;
	assign in_ypos_ser_0_1_0=out_yneg_ser_0_2_0;
	assign in_yneg_ser_0_1_0=out_ypos_ser_0_0_0;
	assign in_ypos_ser_0_1_1=out_yneg_ser_0_2_1;
	assign in_yneg_ser_0_1_1=out_ypos_ser_0_0_1;
	assign in_ypos_ser_0_1_2=out_yneg_ser_0_2_2;
	assign in_yneg_ser_0_1_2=out_ypos_ser_0_0_2;
	assign in_ypos_ser_0_1_3=out_yneg_ser_0_2_3;
	assign in_yneg_ser_0_1_3=out_ypos_ser_0_0_3;
	assign in_ypos_ser_0_2_0=out_yneg_ser_0_3_0;
	assign in_yneg_ser_0_2_0=out_ypos_ser_0_1_0;
	assign in_ypos_ser_0_2_1=out_yneg_ser_0_3_1;
	assign in_yneg_ser_0_2_1=out_ypos_ser_0_1_1;
	assign in_ypos_ser_0_2_2=out_yneg_ser_0_3_2;
	assign in_yneg_ser_0_2_2=out_ypos_ser_0_1_2;
	assign in_ypos_ser_0_2_3=out_yneg_ser_0_3_3;
	assign in_yneg_ser_0_2_3=out_ypos_ser_0_1_3;
	assign in_ypos_ser_0_3_0=out_yneg_ser_0_0_0;
	assign in_yneg_ser_0_3_0=out_ypos_ser_0_2_0;
	assign in_ypos_ser_0_3_1=out_yneg_ser_0_0_1;
	assign in_yneg_ser_0_3_1=out_ypos_ser_0_2_1;
	assign in_ypos_ser_0_3_2=out_yneg_ser_0_0_2;
	assign in_yneg_ser_0_3_2=out_ypos_ser_0_2_2;
	assign in_ypos_ser_0_3_3=out_yneg_ser_0_0_3;
	assign in_yneg_ser_0_3_3=out_ypos_ser_0_2_3;
	assign in_ypos_ser_1_0_0=out_yneg_ser_1_1_0;
	assign in_yneg_ser_1_0_0=out_ypos_ser_1_3_0;
	assign in_ypos_ser_1_0_1=out_yneg_ser_1_1_1;
	assign in_yneg_ser_1_0_1=out_ypos_ser_1_3_1;
	assign in_ypos_ser_1_0_2=out_yneg_ser_1_1_2;
	assign in_yneg_ser_1_0_2=out_ypos_ser_1_3_2;
	assign in_ypos_ser_1_0_3=out_yneg_ser_1_1_3;
	assign in_yneg_ser_1_0_3=out_ypos_ser_1_3_3;
	assign in_ypos_ser_1_1_0=out_yneg_ser_1_2_0;
	assign in_yneg_ser_1_1_0=out_ypos_ser_1_0_0;
	assign in_ypos_ser_1_1_1=out_yneg_ser_1_2_1;
	assign in_yneg_ser_1_1_1=out_ypos_ser_1_0_1;
	assign in_ypos_ser_1_1_2=out_yneg_ser_1_2_2;
	assign in_yneg_ser_1_1_2=out_ypos_ser_1_0_2;
	assign in_ypos_ser_1_1_3=out_yneg_ser_1_2_3;
	assign in_yneg_ser_1_1_3=out_ypos_ser_1_0_3;
	assign in_ypos_ser_1_2_0=out_yneg_ser_1_3_0;
	assign in_yneg_ser_1_2_0=out_ypos_ser_1_1_0;
	assign in_ypos_ser_1_2_1=out_yneg_ser_1_3_1;
	assign in_yneg_ser_1_2_1=out_ypos_ser_1_1_1;
	assign in_ypos_ser_1_2_2=out_yneg_ser_1_3_2;
	assign in_yneg_ser_1_2_2=out_ypos_ser_1_1_2;
	assign in_ypos_ser_1_2_3=out_yneg_ser_1_3_3;
	assign in_yneg_ser_1_2_3=out_ypos_ser_1_1_3;
	assign in_ypos_ser_1_3_0=out_yneg_ser_1_0_0;
	assign in_yneg_ser_1_3_0=out_ypos_ser_1_2_0;
	assign in_ypos_ser_1_3_1=out_yneg_ser_1_0_1;
	assign in_yneg_ser_1_3_1=out_ypos_ser_1_2_1;
	assign in_ypos_ser_1_3_2=out_yneg_ser_1_0_2;
	assign in_yneg_ser_1_3_2=out_ypos_ser_1_2_2;
	assign in_ypos_ser_1_3_3=out_yneg_ser_1_0_3;
	assign in_yneg_ser_1_3_3=out_ypos_ser_1_2_3;
	assign in_ypos_ser_2_0_0=out_yneg_ser_2_1_0;
	assign in_yneg_ser_2_0_0=out_ypos_ser_2_3_0;
	assign in_ypos_ser_2_0_1=out_yneg_ser_2_1_1;
	assign in_yneg_ser_2_0_1=out_ypos_ser_2_3_1;
	assign in_ypos_ser_2_0_2=out_yneg_ser_2_1_2;
	assign in_yneg_ser_2_0_2=out_ypos_ser_2_3_2;
	assign in_ypos_ser_2_0_3=out_yneg_ser_2_1_3;
	assign in_yneg_ser_2_0_3=out_ypos_ser_2_3_3;
	assign in_ypos_ser_2_1_0=out_yneg_ser_2_2_0;
	assign in_yneg_ser_2_1_0=out_ypos_ser_2_0_0;
	assign in_ypos_ser_2_1_1=out_yneg_ser_2_2_1;
	assign in_yneg_ser_2_1_1=out_ypos_ser_2_0_1;
	assign in_ypos_ser_2_1_2=out_yneg_ser_2_2_2;
	assign in_yneg_ser_2_1_2=out_ypos_ser_2_0_2;
	assign in_ypos_ser_2_1_3=out_yneg_ser_2_2_3;
	assign in_yneg_ser_2_1_3=out_ypos_ser_2_0_3;
	assign in_ypos_ser_2_2_0=out_yneg_ser_2_3_0;
	assign in_yneg_ser_2_2_0=out_ypos_ser_2_1_0;
	assign in_ypos_ser_2_2_1=out_yneg_ser_2_3_1;
	assign in_yneg_ser_2_2_1=out_ypos_ser_2_1_1;
	assign in_ypos_ser_2_2_2=out_yneg_ser_2_3_2;
	assign in_yneg_ser_2_2_2=out_ypos_ser_2_1_2;
	assign in_ypos_ser_2_2_3=out_yneg_ser_2_3_3;
	assign in_yneg_ser_2_2_3=out_ypos_ser_2_1_3;
	assign in_ypos_ser_2_3_0=out_yneg_ser_2_0_0;
	assign in_yneg_ser_2_3_0=out_ypos_ser_2_2_0;
	assign in_ypos_ser_2_3_1=out_yneg_ser_2_0_1;
	assign in_yneg_ser_2_3_1=out_ypos_ser_2_2_1;
	assign in_ypos_ser_2_3_2=out_yneg_ser_2_0_2;
	assign in_yneg_ser_2_3_2=out_ypos_ser_2_2_2;
	assign in_ypos_ser_2_3_3=out_yneg_ser_2_0_3;
	assign in_yneg_ser_2_3_3=out_ypos_ser_2_2_3;
	assign in_ypos_ser_3_0_0=out_yneg_ser_3_1_0;
	assign in_yneg_ser_3_0_0=out_ypos_ser_3_3_0;
	assign in_ypos_ser_3_0_1=out_yneg_ser_3_1_1;
	assign in_yneg_ser_3_0_1=out_ypos_ser_3_3_1;
	assign in_ypos_ser_3_0_2=out_yneg_ser_3_1_2;
	assign in_yneg_ser_3_0_2=out_ypos_ser_3_3_2;
	assign in_ypos_ser_3_0_3=out_yneg_ser_3_1_3;
	assign in_yneg_ser_3_0_3=out_ypos_ser_3_3_3;
	assign in_ypos_ser_3_1_0=out_yneg_ser_3_2_0;
	assign in_yneg_ser_3_1_0=out_ypos_ser_3_0_0;
	assign in_ypos_ser_3_1_1=out_yneg_ser_3_2_1;
	assign in_yneg_ser_3_1_1=out_ypos_ser_3_0_1;
	assign in_ypos_ser_3_1_2=out_yneg_ser_3_2_2;
	assign in_yneg_ser_3_1_2=out_ypos_ser_3_0_2;
	assign in_ypos_ser_3_1_3=out_yneg_ser_3_2_3;
	assign in_yneg_ser_3_1_3=out_ypos_ser_3_0_3;
	assign in_ypos_ser_3_2_0=out_yneg_ser_3_3_0;
	assign in_yneg_ser_3_2_0=out_ypos_ser_3_1_0;
	assign in_ypos_ser_3_2_1=out_yneg_ser_3_3_1;
	assign in_yneg_ser_3_2_1=out_ypos_ser_3_1_1;
	assign in_ypos_ser_3_2_2=out_yneg_ser_3_3_2;
	assign in_yneg_ser_3_2_2=out_ypos_ser_3_1_2;
	assign in_ypos_ser_3_2_3=out_yneg_ser_3_3_3;
	assign in_yneg_ser_3_2_3=out_ypos_ser_3_1_3;
	assign in_ypos_ser_3_3_0=out_yneg_ser_3_0_0;
	assign in_yneg_ser_3_3_0=out_ypos_ser_3_2_0;
	assign in_ypos_ser_3_3_1=out_yneg_ser_3_0_1;
	assign in_yneg_ser_3_3_1=out_ypos_ser_3_2_1;
	assign in_ypos_ser_3_3_2=out_yneg_ser_3_0_2;
	assign in_yneg_ser_3_3_2=out_ypos_ser_3_2_2;
	assign in_ypos_ser_3_3_3=out_yneg_ser_3_0_3;
	assign in_yneg_ser_3_3_3=out_ypos_ser_3_2_3;
	assign in_zpos_ser_0_0_0=out_zneg_ser_0_0_1;
	assign in_zneg_ser_0_0_0=out_zpos_ser_0_0_3;
	assign in_zpos_ser_0_0_1=out_zneg_ser_0_0_2;
	assign in_zneg_ser_0_0_1=out_zpos_ser_0_0_0;
	assign in_zpos_ser_0_0_2=out_zneg_ser_0_0_3;
	assign in_zneg_ser_0_0_2=out_zpos_ser_0_0_1;
	assign in_zpos_ser_0_0_3=out_zneg_ser_0_0_0;
	assign in_zneg_ser_0_0_3=out_zpos_ser_0_0_2;
	assign in_zpos_ser_0_1_0=out_zneg_ser_0_1_1;
	assign in_zneg_ser_0_1_0=out_zpos_ser_0_1_3;
	assign in_zpos_ser_0_1_1=out_zneg_ser_0_1_2;
	assign in_zneg_ser_0_1_1=out_zpos_ser_0_1_0;
	assign in_zpos_ser_0_1_2=out_zneg_ser_0_1_3;
	assign in_zneg_ser_0_1_2=out_zpos_ser_0_1_1;
	assign in_zpos_ser_0_1_3=out_zneg_ser_0_1_0;
	assign in_zneg_ser_0_1_3=out_zpos_ser_0_1_2;
	assign in_zpos_ser_0_2_0=out_zneg_ser_0_2_1;
	assign in_zneg_ser_0_2_0=out_zpos_ser_0_2_3;
	assign in_zpos_ser_0_2_1=out_zneg_ser_0_2_2;
	assign in_zneg_ser_0_2_1=out_zpos_ser_0_2_0;
	assign in_zpos_ser_0_2_2=out_zneg_ser_0_2_3;
	assign in_zneg_ser_0_2_2=out_zpos_ser_0_2_1;
	assign in_zpos_ser_0_2_3=out_zneg_ser_0_2_0;
	assign in_zneg_ser_0_2_3=out_zpos_ser_0_2_2;
	assign in_zpos_ser_0_3_0=out_zneg_ser_0_3_1;
	assign in_zneg_ser_0_3_0=out_zpos_ser_0_3_3;
	assign in_zpos_ser_0_3_1=out_zneg_ser_0_3_2;
	assign in_zneg_ser_0_3_1=out_zpos_ser_0_3_0;
	assign in_zpos_ser_0_3_2=out_zneg_ser_0_3_3;
	assign in_zneg_ser_0_3_2=out_zpos_ser_0_3_1;
	assign in_zpos_ser_0_3_3=out_zneg_ser_0_3_0;
	assign in_zneg_ser_0_3_3=out_zpos_ser_0_3_2;
	assign in_zpos_ser_1_0_0=out_zneg_ser_1_0_1;
	assign in_zneg_ser_1_0_0=out_zpos_ser_1_0_3;
	assign in_zpos_ser_1_0_1=out_zneg_ser_1_0_2;
	assign in_zneg_ser_1_0_1=out_zpos_ser_1_0_0;
	assign in_zpos_ser_1_0_2=out_zneg_ser_1_0_3;
	assign in_zneg_ser_1_0_2=out_zpos_ser_1_0_1;
	assign in_zpos_ser_1_0_3=out_zneg_ser_1_0_0;
	assign in_zneg_ser_1_0_3=out_zpos_ser_1_0_2;
	assign in_zpos_ser_1_1_0=out_zneg_ser_1_1_1;
	assign in_zneg_ser_1_1_0=out_zpos_ser_1_1_3;
	assign in_zpos_ser_1_1_1=out_zneg_ser_1_1_2;
	assign in_zneg_ser_1_1_1=out_zpos_ser_1_1_0;
	assign in_zpos_ser_1_1_2=out_zneg_ser_1_1_3;
	assign in_zneg_ser_1_1_2=out_zpos_ser_1_1_1;
	assign in_zpos_ser_1_1_3=out_zneg_ser_1_1_0;
	assign in_zneg_ser_1_1_3=out_zpos_ser_1_1_2;
	assign in_zpos_ser_1_2_0=out_zneg_ser_1_2_1;
	assign in_zneg_ser_1_2_0=out_zpos_ser_1_2_3;
	assign in_zpos_ser_1_2_1=out_zneg_ser_1_2_2;
	assign in_zneg_ser_1_2_1=out_zpos_ser_1_2_0;
	assign in_zpos_ser_1_2_2=out_zneg_ser_1_2_3;
	assign in_zneg_ser_1_2_2=out_zpos_ser_1_2_1;
	assign in_zpos_ser_1_2_3=out_zneg_ser_1_2_0;
	assign in_zneg_ser_1_2_3=out_zpos_ser_1_2_2;
	assign in_zpos_ser_1_3_0=out_zneg_ser_1_3_1;
	assign in_zneg_ser_1_3_0=out_zpos_ser_1_3_3;
	assign in_zpos_ser_1_3_1=out_zneg_ser_1_3_2;
	assign in_zneg_ser_1_3_1=out_zpos_ser_1_3_0;
	assign in_zpos_ser_1_3_2=out_zneg_ser_1_3_3;
	assign in_zneg_ser_1_3_2=out_zpos_ser_1_3_1;
	assign in_zpos_ser_1_3_3=out_zneg_ser_1_3_0;
	assign in_zneg_ser_1_3_3=out_zpos_ser_1_3_2;
	assign in_zpos_ser_2_0_0=out_zneg_ser_2_0_1;
	assign in_zneg_ser_2_0_0=out_zpos_ser_2_0_3;
	assign in_zpos_ser_2_0_1=out_zneg_ser_2_0_2;
	assign in_zneg_ser_2_0_1=out_zpos_ser_2_0_0;
	assign in_zpos_ser_2_0_2=out_zneg_ser_2_0_3;
	assign in_zneg_ser_2_0_2=out_zpos_ser_2_0_1;
	assign in_zpos_ser_2_0_3=out_zneg_ser_2_0_0;
	assign in_zneg_ser_2_0_3=out_zpos_ser_2_0_2;
	assign in_zpos_ser_2_1_0=out_zneg_ser_2_1_1;
	assign in_zneg_ser_2_1_0=out_zpos_ser_2_1_3;
	assign in_zpos_ser_2_1_1=out_zneg_ser_2_1_2;
	assign in_zneg_ser_2_1_1=out_zpos_ser_2_1_0;
	assign in_zpos_ser_2_1_2=out_zneg_ser_2_1_3;
	assign in_zneg_ser_2_1_2=out_zpos_ser_2_1_1;
	assign in_zpos_ser_2_1_3=out_zneg_ser_2_1_0;
	assign in_zneg_ser_2_1_3=out_zpos_ser_2_1_2;
	assign in_zpos_ser_2_2_0=out_zneg_ser_2_2_1;
	assign in_zneg_ser_2_2_0=out_zpos_ser_2_2_3;
	assign in_zpos_ser_2_2_1=out_zneg_ser_2_2_2;
	assign in_zneg_ser_2_2_1=out_zpos_ser_2_2_0;
	assign in_zpos_ser_2_2_2=out_zneg_ser_2_2_3;
	assign in_zneg_ser_2_2_2=out_zpos_ser_2_2_1;
	assign in_zpos_ser_2_2_3=out_zneg_ser_2_2_0;
	assign in_zneg_ser_2_2_3=out_zpos_ser_2_2_2;
	assign in_zpos_ser_2_3_0=out_zneg_ser_2_3_1;
	assign in_zneg_ser_2_3_0=out_zpos_ser_2_3_3;
	assign in_zpos_ser_2_3_1=out_zneg_ser_2_3_2;
	assign in_zneg_ser_2_3_1=out_zpos_ser_2_3_0;
	assign in_zpos_ser_2_3_2=out_zneg_ser_2_3_3;
	assign in_zneg_ser_2_3_2=out_zpos_ser_2_3_1;
	assign in_zpos_ser_2_3_3=out_zneg_ser_2_3_0;
	assign in_zneg_ser_2_3_3=out_zpos_ser_2_3_2;
	assign in_zpos_ser_3_0_0=out_zneg_ser_3_0_1;
	assign in_zneg_ser_3_0_0=out_zpos_ser_3_0_3;
	assign in_zpos_ser_3_0_1=out_zneg_ser_3_0_2;
	assign in_zneg_ser_3_0_1=out_zpos_ser_3_0_0;
	assign in_zpos_ser_3_0_2=out_zneg_ser_3_0_3;
	assign in_zneg_ser_3_0_2=out_zpos_ser_3_0_1;
	assign in_zpos_ser_3_0_3=out_zneg_ser_3_0_0;
	assign in_zneg_ser_3_0_3=out_zpos_ser_3_0_2;
	assign in_zpos_ser_3_1_0=out_zneg_ser_3_1_1;
	assign in_zneg_ser_3_1_0=out_zpos_ser_3_1_3;
	assign in_zpos_ser_3_1_1=out_zneg_ser_3_1_2;
	assign in_zneg_ser_3_1_1=out_zpos_ser_3_1_0;
	assign in_zpos_ser_3_1_2=out_zneg_ser_3_1_3;
	assign in_zneg_ser_3_1_2=out_zpos_ser_3_1_1;
	assign in_zpos_ser_3_1_3=out_zneg_ser_3_1_0;
	assign in_zneg_ser_3_1_3=out_zpos_ser_3_1_2;
	assign in_zpos_ser_3_2_0=out_zneg_ser_3_2_1;
	assign in_zneg_ser_3_2_0=out_zpos_ser_3_2_3;
	assign in_zpos_ser_3_2_1=out_zneg_ser_3_2_2;
	assign in_zneg_ser_3_2_1=out_zpos_ser_3_2_0;
	assign in_zpos_ser_3_2_2=out_zneg_ser_3_2_3;
	assign in_zneg_ser_3_2_2=out_zpos_ser_3_2_1;
	assign in_zpos_ser_3_2_3=out_zneg_ser_3_2_0;
	assign in_zneg_ser_3_2_3=out_zpos_ser_3_2_2;
	assign in_zpos_ser_3_3_0=out_zneg_ser_3_3_1;
	assign in_zneg_ser_3_3_0=out_zpos_ser_3_3_3;
	assign in_zpos_ser_3_3_1=out_zneg_ser_3_3_2;
	assign in_zneg_ser_3_3_1=out_zpos_ser_3_3_0;
	assign in_zpos_ser_3_3_2=out_zneg_ser_3_3_3;
	assign in_zneg_ser_3_3_2=out_zpos_ser_3_3_1;
	assign in_zpos_ser_3_3_3=out_zneg_ser_3_3_0;
	assign in_zneg_ser_3_3_3=out_zpos_ser_3_3_2;
    node#(
        .cur_x(3'd0),
        .cur_y(3'd0),
        .cur_z(3'd0)
        )n_0_0_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_0_0),
        .out_xpos_ser(out_xpos_ser_0_0_0),
        .in_xneg_ser(in_xneg_ser_0_0_0),
        .out_xneg_ser(out_xneg_ser_0_0_0),
        .in_ypos_ser(in_ypos_ser_0_0_0),
        .out_ypos_ser(out_ypos_ser_0_0_0),
        .in_yneg_ser(in_yneg_ser_0_0_0),
        .out_yneg_ser(out_yneg_ser_0_0_0),
        .in_zpos_ser(in_zpos_ser_0_0_0),
        .out_zpos_ser(out_zpos_ser_0_0_0),
        .in_zneg_ser(in_zneg_ser_0_0_0),
        .out_zneg_ser(out_zneg_ser_0_0_0)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd0),
        .cur_z(3'd1)
        )n_0_0_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_0_1),
        .out_xpos_ser(out_xpos_ser_0_0_1),
        .in_xneg_ser(in_xneg_ser_0_0_1),
        .out_xneg_ser(out_xneg_ser_0_0_1),
        .in_ypos_ser(in_ypos_ser_0_0_1),
        .out_ypos_ser(out_ypos_ser_0_0_1),
        .in_yneg_ser(in_yneg_ser_0_0_1),
        .out_yneg_ser(out_yneg_ser_0_0_1),
        .in_zpos_ser(in_zpos_ser_0_0_1),
        .out_zpos_ser(out_zpos_ser_0_0_1),
        .in_zneg_ser(in_zneg_ser_0_0_1),
        .out_zneg_ser(out_zneg_ser_0_0_1)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd0),
        .cur_z(3'd2)
        )n_0_0_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_0_2),
        .out_xpos_ser(out_xpos_ser_0_0_2),
        .in_xneg_ser(in_xneg_ser_0_0_2),
        .out_xneg_ser(out_xneg_ser_0_0_2),
        .in_ypos_ser(in_ypos_ser_0_0_2),
        .out_ypos_ser(out_ypos_ser_0_0_2),
        .in_yneg_ser(in_yneg_ser_0_0_2),
        .out_yneg_ser(out_yneg_ser_0_0_2),
        .in_zpos_ser(in_zpos_ser_0_0_2),
        .out_zpos_ser(out_zpos_ser_0_0_2),
        .in_zneg_ser(in_zneg_ser_0_0_2),
        .out_zneg_ser(out_zneg_ser_0_0_2)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd0),
        .cur_z(3'd3)
        )n_0_0_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_0_3),
        .out_xpos_ser(out_xpos_ser_0_0_3),
        .in_xneg_ser(in_xneg_ser_0_0_3),
        .out_xneg_ser(out_xneg_ser_0_0_3),
        .in_ypos_ser(in_ypos_ser_0_0_3),
        .out_ypos_ser(out_ypos_ser_0_0_3),
        .in_yneg_ser(in_yneg_ser_0_0_3),
        .out_yneg_ser(out_yneg_ser_0_0_3),
        .in_zpos_ser(in_zpos_ser_0_0_3),
        .out_zpos_ser(out_zpos_ser_0_0_3),
        .in_zneg_ser(in_zneg_ser_0_0_3),
        .out_zneg_ser(out_zneg_ser_0_0_3)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd1),
        .cur_z(3'd0)
        )n_0_1_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_1_0),
        .out_xpos_ser(out_xpos_ser_0_1_0),
        .in_xneg_ser(in_xneg_ser_0_1_0),
        .out_xneg_ser(out_xneg_ser_0_1_0),
        .in_ypos_ser(in_ypos_ser_0_1_0),
        .out_ypos_ser(out_ypos_ser_0_1_0),
        .in_yneg_ser(in_yneg_ser_0_1_0),
        .out_yneg_ser(out_yneg_ser_0_1_0),
        .in_zpos_ser(in_zpos_ser_0_1_0),
        .out_zpos_ser(out_zpos_ser_0_1_0),
        .in_zneg_ser(in_zneg_ser_0_1_0),
        .out_zneg_ser(out_zneg_ser_0_1_0)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd1),
        .cur_z(3'd1)
        )n_0_1_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_1_1),
        .out_xpos_ser(out_xpos_ser_0_1_1),
        .in_xneg_ser(in_xneg_ser_0_1_1),
        .out_xneg_ser(out_xneg_ser_0_1_1),
        .in_ypos_ser(in_ypos_ser_0_1_1),
        .out_ypos_ser(out_ypos_ser_0_1_1),
        .in_yneg_ser(in_yneg_ser_0_1_1),
        .out_yneg_ser(out_yneg_ser_0_1_1),
        .in_zpos_ser(in_zpos_ser_0_1_1),
        .out_zpos_ser(out_zpos_ser_0_1_1),
        .in_zneg_ser(in_zneg_ser_0_1_1),
        .out_zneg_ser(out_zneg_ser_0_1_1)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd1),
        .cur_z(3'd2)
        )n_0_1_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_1_2),
        .out_xpos_ser(out_xpos_ser_0_1_2),
        .in_xneg_ser(in_xneg_ser_0_1_2),
        .out_xneg_ser(out_xneg_ser_0_1_2),
        .in_ypos_ser(in_ypos_ser_0_1_2),
        .out_ypos_ser(out_ypos_ser_0_1_2),
        .in_yneg_ser(in_yneg_ser_0_1_2),
        .out_yneg_ser(out_yneg_ser_0_1_2),
        .in_zpos_ser(in_zpos_ser_0_1_2),
        .out_zpos_ser(out_zpos_ser_0_1_2),
        .in_zneg_ser(in_zneg_ser_0_1_2),
        .out_zneg_ser(out_zneg_ser_0_1_2)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd1),
        .cur_z(3'd3)
        )n_0_1_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_1_3),
        .out_xpos_ser(out_xpos_ser_0_1_3),
        .in_xneg_ser(in_xneg_ser_0_1_3),
        .out_xneg_ser(out_xneg_ser_0_1_3),
        .in_ypos_ser(in_ypos_ser_0_1_3),
        .out_ypos_ser(out_ypos_ser_0_1_3),
        .in_yneg_ser(in_yneg_ser_0_1_3),
        .out_yneg_ser(out_yneg_ser_0_1_3),
        .in_zpos_ser(in_zpos_ser_0_1_3),
        .out_zpos_ser(out_zpos_ser_0_1_3),
        .in_zneg_ser(in_zneg_ser_0_1_3),
        .out_zneg_ser(out_zneg_ser_0_1_3)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd2),
        .cur_z(3'd0)
        )n_0_2_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_2_0),
        .out_xpos_ser(out_xpos_ser_0_2_0),
        .in_xneg_ser(in_xneg_ser_0_2_0),
        .out_xneg_ser(out_xneg_ser_0_2_0),
        .in_ypos_ser(in_ypos_ser_0_2_0),
        .out_ypos_ser(out_ypos_ser_0_2_0),
        .in_yneg_ser(in_yneg_ser_0_2_0),
        .out_yneg_ser(out_yneg_ser_0_2_0),
        .in_zpos_ser(in_zpos_ser_0_2_0),
        .out_zpos_ser(out_zpos_ser_0_2_0),
        .in_zneg_ser(in_zneg_ser_0_2_0),
        .out_zneg_ser(out_zneg_ser_0_2_0)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd2),
        .cur_z(3'd1)
        )n_0_2_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_2_1),
        .out_xpos_ser(out_xpos_ser_0_2_1),
        .in_xneg_ser(in_xneg_ser_0_2_1),
        .out_xneg_ser(out_xneg_ser_0_2_1),
        .in_ypos_ser(in_ypos_ser_0_2_1),
        .out_ypos_ser(out_ypos_ser_0_2_1),
        .in_yneg_ser(in_yneg_ser_0_2_1),
        .out_yneg_ser(out_yneg_ser_0_2_1),
        .in_zpos_ser(in_zpos_ser_0_2_1),
        .out_zpos_ser(out_zpos_ser_0_2_1),
        .in_zneg_ser(in_zneg_ser_0_2_1),
        .out_zneg_ser(out_zneg_ser_0_2_1)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd2),
        .cur_z(3'd2)
        )n_0_2_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_2_2),
        .out_xpos_ser(out_xpos_ser_0_2_2),
        .in_xneg_ser(in_xneg_ser_0_2_2),
        .out_xneg_ser(out_xneg_ser_0_2_2),
        .in_ypos_ser(in_ypos_ser_0_2_2),
        .out_ypos_ser(out_ypos_ser_0_2_2),
        .in_yneg_ser(in_yneg_ser_0_2_2),
        .out_yneg_ser(out_yneg_ser_0_2_2),
        .in_zpos_ser(in_zpos_ser_0_2_2),
        .out_zpos_ser(out_zpos_ser_0_2_2),
        .in_zneg_ser(in_zneg_ser_0_2_2),
        .out_zneg_ser(out_zneg_ser_0_2_2)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd2),
        .cur_z(3'd3)
        )n_0_2_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_2_3),
        .out_xpos_ser(out_xpos_ser_0_2_3),
        .in_xneg_ser(in_xneg_ser_0_2_3),
        .out_xneg_ser(out_xneg_ser_0_2_3),
        .in_ypos_ser(in_ypos_ser_0_2_3),
        .out_ypos_ser(out_ypos_ser_0_2_3),
        .in_yneg_ser(in_yneg_ser_0_2_3),
        .out_yneg_ser(out_yneg_ser_0_2_3),
        .in_zpos_ser(in_zpos_ser_0_2_3),
        .out_zpos_ser(out_zpos_ser_0_2_3),
        .in_zneg_ser(in_zneg_ser_0_2_3),
        .out_zneg_ser(out_zneg_ser_0_2_3)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd3),
        .cur_z(3'd0)
        )n_0_3_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_3_0),
        .out_xpos_ser(out_xpos_ser_0_3_0),
        .in_xneg_ser(in_xneg_ser_0_3_0),
        .out_xneg_ser(out_xneg_ser_0_3_0),
        .in_ypos_ser(in_ypos_ser_0_3_0),
        .out_ypos_ser(out_ypos_ser_0_3_0),
        .in_yneg_ser(in_yneg_ser_0_3_0),
        .out_yneg_ser(out_yneg_ser_0_3_0),
        .in_zpos_ser(in_zpos_ser_0_3_0),
        .out_zpos_ser(out_zpos_ser_0_3_0),
        .in_zneg_ser(in_zneg_ser_0_3_0),
        .out_zneg_ser(out_zneg_ser_0_3_0)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd3),
        .cur_z(3'd1)
        )n_0_3_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_3_1),
        .out_xpos_ser(out_xpos_ser_0_3_1),
        .in_xneg_ser(in_xneg_ser_0_3_1),
        .out_xneg_ser(out_xneg_ser_0_3_1),
        .in_ypos_ser(in_ypos_ser_0_3_1),
        .out_ypos_ser(out_ypos_ser_0_3_1),
        .in_yneg_ser(in_yneg_ser_0_3_1),
        .out_yneg_ser(out_yneg_ser_0_3_1),
        .in_zpos_ser(in_zpos_ser_0_3_1),
        .out_zpos_ser(out_zpos_ser_0_3_1),
        .in_zneg_ser(in_zneg_ser_0_3_1),
        .out_zneg_ser(out_zneg_ser_0_3_1)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd3),
        .cur_z(3'd2)
        )n_0_3_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_3_2),
        .out_xpos_ser(out_xpos_ser_0_3_2),
        .in_xneg_ser(in_xneg_ser_0_3_2),
        .out_xneg_ser(out_xneg_ser_0_3_2),
        .in_ypos_ser(in_ypos_ser_0_3_2),
        .out_ypos_ser(out_ypos_ser_0_3_2),
        .in_yneg_ser(in_yneg_ser_0_3_2),
        .out_yneg_ser(out_yneg_ser_0_3_2),
        .in_zpos_ser(in_zpos_ser_0_3_2),
        .out_zpos_ser(out_zpos_ser_0_3_2),
        .in_zneg_ser(in_zneg_ser_0_3_2),
        .out_zneg_ser(out_zneg_ser_0_3_2)
      );
    node#(
        .cur_x(3'd0),
        .cur_y(3'd3),
        .cur_z(3'd3)
        )n_0_3_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_3_3),
        .out_xpos_ser(out_xpos_ser_0_3_3),
        .in_xneg_ser(in_xneg_ser_0_3_3),
        .out_xneg_ser(out_xneg_ser_0_3_3),
        .in_ypos_ser(in_ypos_ser_0_3_3),
        .out_ypos_ser(out_ypos_ser_0_3_3),
        .in_yneg_ser(in_yneg_ser_0_3_3),
        .out_yneg_ser(out_yneg_ser_0_3_3),
        .in_zpos_ser(in_zpos_ser_0_3_3),
        .out_zpos_ser(out_zpos_ser_0_3_3),
        .in_zneg_ser(in_zneg_ser_0_3_3),
        .out_zneg_ser(out_zneg_ser_0_3_3)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd0),
        .cur_z(3'd0)
        )n_1_0_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_0_0),
        .out_xpos_ser(out_xpos_ser_1_0_0),
        .in_xneg_ser(in_xneg_ser_1_0_0),
        .out_xneg_ser(out_xneg_ser_1_0_0),
        .in_ypos_ser(in_ypos_ser_1_0_0),
        .out_ypos_ser(out_ypos_ser_1_0_0),
        .in_yneg_ser(in_yneg_ser_1_0_0),
        .out_yneg_ser(out_yneg_ser_1_0_0),
        .in_zpos_ser(in_zpos_ser_1_0_0),
        .out_zpos_ser(out_zpos_ser_1_0_0),
        .in_zneg_ser(in_zneg_ser_1_0_0),
        .out_zneg_ser(out_zneg_ser_1_0_0)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd0),
        .cur_z(3'd1)
        )n_1_0_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_0_1),
        .out_xpos_ser(out_xpos_ser_1_0_1),
        .in_xneg_ser(in_xneg_ser_1_0_1),
        .out_xneg_ser(out_xneg_ser_1_0_1),
        .in_ypos_ser(in_ypos_ser_1_0_1),
        .out_ypos_ser(out_ypos_ser_1_0_1),
        .in_yneg_ser(in_yneg_ser_1_0_1),
        .out_yneg_ser(out_yneg_ser_1_0_1),
        .in_zpos_ser(in_zpos_ser_1_0_1),
        .out_zpos_ser(out_zpos_ser_1_0_1),
        .in_zneg_ser(in_zneg_ser_1_0_1),
        .out_zneg_ser(out_zneg_ser_1_0_1)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd0),
        .cur_z(3'd2)
        )n_1_0_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_0_2),
        .out_xpos_ser(out_xpos_ser_1_0_2),
        .in_xneg_ser(in_xneg_ser_1_0_2),
        .out_xneg_ser(out_xneg_ser_1_0_2),
        .in_ypos_ser(in_ypos_ser_1_0_2),
        .out_ypos_ser(out_ypos_ser_1_0_2),
        .in_yneg_ser(in_yneg_ser_1_0_2),
        .out_yneg_ser(out_yneg_ser_1_0_2),
        .in_zpos_ser(in_zpos_ser_1_0_2),
        .out_zpos_ser(out_zpos_ser_1_0_2),
        .in_zneg_ser(in_zneg_ser_1_0_2),
        .out_zneg_ser(out_zneg_ser_1_0_2)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd0),
        .cur_z(3'd3)
        )n_1_0_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_0_3),
        .out_xpos_ser(out_xpos_ser_1_0_3),
        .in_xneg_ser(in_xneg_ser_1_0_3),
        .out_xneg_ser(out_xneg_ser_1_0_3),
        .in_ypos_ser(in_ypos_ser_1_0_3),
        .out_ypos_ser(out_ypos_ser_1_0_3),
        .in_yneg_ser(in_yneg_ser_1_0_3),
        .out_yneg_ser(out_yneg_ser_1_0_3),
        .in_zpos_ser(in_zpos_ser_1_0_3),
        .out_zpos_ser(out_zpos_ser_1_0_3),
        .in_zneg_ser(in_zneg_ser_1_0_3),
        .out_zneg_ser(out_zneg_ser_1_0_3)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd1),
        .cur_z(3'd0)
        )n_1_1_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_1_0),
        .out_xpos_ser(out_xpos_ser_1_1_0),
        .in_xneg_ser(in_xneg_ser_1_1_0),
        .out_xneg_ser(out_xneg_ser_1_1_0),
        .in_ypos_ser(in_ypos_ser_1_1_0),
        .out_ypos_ser(out_ypos_ser_1_1_0),
        .in_yneg_ser(in_yneg_ser_1_1_0),
        .out_yneg_ser(out_yneg_ser_1_1_0),
        .in_zpos_ser(in_zpos_ser_1_1_0),
        .out_zpos_ser(out_zpos_ser_1_1_0),
        .in_zneg_ser(in_zneg_ser_1_1_0),
        .out_zneg_ser(out_zneg_ser_1_1_0)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd1),
        .cur_z(3'd1)
        )n_1_1_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_1_1),
        .out_xpos_ser(out_xpos_ser_1_1_1),
        .in_xneg_ser(in_xneg_ser_1_1_1),
        .out_xneg_ser(out_xneg_ser_1_1_1),
        .in_ypos_ser(in_ypos_ser_1_1_1),
        .out_ypos_ser(out_ypos_ser_1_1_1),
        .in_yneg_ser(in_yneg_ser_1_1_1),
        .out_yneg_ser(out_yneg_ser_1_1_1),
        .in_zpos_ser(in_zpos_ser_1_1_1),
        .out_zpos_ser(out_zpos_ser_1_1_1),
        .in_zneg_ser(in_zneg_ser_1_1_1),
        .out_zneg_ser(out_zneg_ser_1_1_1)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd1),
        .cur_z(3'd2)
        )n_1_1_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_1_2),
        .out_xpos_ser(out_xpos_ser_1_1_2),
        .in_xneg_ser(in_xneg_ser_1_1_2),
        .out_xneg_ser(out_xneg_ser_1_1_2),
        .in_ypos_ser(in_ypos_ser_1_1_2),
        .out_ypos_ser(out_ypos_ser_1_1_2),
        .in_yneg_ser(in_yneg_ser_1_1_2),
        .out_yneg_ser(out_yneg_ser_1_1_2),
        .in_zpos_ser(in_zpos_ser_1_1_2),
        .out_zpos_ser(out_zpos_ser_1_1_2),
        .in_zneg_ser(in_zneg_ser_1_1_2),
        .out_zneg_ser(out_zneg_ser_1_1_2)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd1),
        .cur_z(3'd3)
        )n_1_1_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_1_3),
        .out_xpos_ser(out_xpos_ser_1_1_3),
        .in_xneg_ser(in_xneg_ser_1_1_3),
        .out_xneg_ser(out_xneg_ser_1_1_3),
        .in_ypos_ser(in_ypos_ser_1_1_3),
        .out_ypos_ser(out_ypos_ser_1_1_3),
        .in_yneg_ser(in_yneg_ser_1_1_3),
        .out_yneg_ser(out_yneg_ser_1_1_3),
        .in_zpos_ser(in_zpos_ser_1_1_3),
        .out_zpos_ser(out_zpos_ser_1_1_3),
        .in_zneg_ser(in_zneg_ser_1_1_3),
        .out_zneg_ser(out_zneg_ser_1_1_3)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd2),
        .cur_z(3'd0)
        )n_1_2_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_2_0),
        .out_xpos_ser(out_xpos_ser_1_2_0),
        .in_xneg_ser(in_xneg_ser_1_2_0),
        .out_xneg_ser(out_xneg_ser_1_2_0),
        .in_ypos_ser(in_ypos_ser_1_2_0),
        .out_ypos_ser(out_ypos_ser_1_2_0),
        .in_yneg_ser(in_yneg_ser_1_2_0),
        .out_yneg_ser(out_yneg_ser_1_2_0),
        .in_zpos_ser(in_zpos_ser_1_2_0),
        .out_zpos_ser(out_zpos_ser_1_2_0),
        .in_zneg_ser(in_zneg_ser_1_2_0),
        .out_zneg_ser(out_zneg_ser_1_2_0)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd2),
        .cur_z(3'd1)
        )n_1_2_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_2_1),
        .out_xpos_ser(out_xpos_ser_1_2_1),
        .in_xneg_ser(in_xneg_ser_1_2_1),
        .out_xneg_ser(out_xneg_ser_1_2_1),
        .in_ypos_ser(in_ypos_ser_1_2_1),
        .out_ypos_ser(out_ypos_ser_1_2_1),
        .in_yneg_ser(in_yneg_ser_1_2_1),
        .out_yneg_ser(out_yneg_ser_1_2_1),
        .in_zpos_ser(in_zpos_ser_1_2_1),
        .out_zpos_ser(out_zpos_ser_1_2_1),
        .in_zneg_ser(in_zneg_ser_1_2_1),
        .out_zneg_ser(out_zneg_ser_1_2_1)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd2),
        .cur_z(3'd2)
        )n_1_2_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_2_2),
        .out_xpos_ser(out_xpos_ser_1_2_2),
        .in_xneg_ser(in_xneg_ser_1_2_2),
        .out_xneg_ser(out_xneg_ser_1_2_2),
        .in_ypos_ser(in_ypos_ser_1_2_2),
        .out_ypos_ser(out_ypos_ser_1_2_2),
        .in_yneg_ser(in_yneg_ser_1_2_2),
        .out_yneg_ser(out_yneg_ser_1_2_2),
        .in_zpos_ser(in_zpos_ser_1_2_2),
        .out_zpos_ser(out_zpos_ser_1_2_2),
        .in_zneg_ser(in_zneg_ser_1_2_2),
        .out_zneg_ser(out_zneg_ser_1_2_2)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd2),
        .cur_z(3'd3)
        )n_1_2_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_2_3),
        .out_xpos_ser(out_xpos_ser_1_2_3),
        .in_xneg_ser(in_xneg_ser_1_2_3),
        .out_xneg_ser(out_xneg_ser_1_2_3),
        .in_ypos_ser(in_ypos_ser_1_2_3),
        .out_ypos_ser(out_ypos_ser_1_2_3),
        .in_yneg_ser(in_yneg_ser_1_2_3),
        .out_yneg_ser(out_yneg_ser_1_2_3),
        .in_zpos_ser(in_zpos_ser_1_2_3),
        .out_zpos_ser(out_zpos_ser_1_2_3),
        .in_zneg_ser(in_zneg_ser_1_2_3),
        .out_zneg_ser(out_zneg_ser_1_2_3)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd3),
        .cur_z(3'd0)
        )n_1_3_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_3_0),
        .out_xpos_ser(out_xpos_ser_1_3_0),
        .in_xneg_ser(in_xneg_ser_1_3_0),
        .out_xneg_ser(out_xneg_ser_1_3_0),
        .in_ypos_ser(in_ypos_ser_1_3_0),
        .out_ypos_ser(out_ypos_ser_1_3_0),
        .in_yneg_ser(in_yneg_ser_1_3_0),
        .out_yneg_ser(out_yneg_ser_1_3_0),
        .in_zpos_ser(in_zpos_ser_1_3_0),
        .out_zpos_ser(out_zpos_ser_1_3_0),
        .in_zneg_ser(in_zneg_ser_1_3_0),
        .out_zneg_ser(out_zneg_ser_1_3_0)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd3),
        .cur_z(3'd1)
        )n_1_3_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_3_1),
        .out_xpos_ser(out_xpos_ser_1_3_1),
        .in_xneg_ser(in_xneg_ser_1_3_1),
        .out_xneg_ser(out_xneg_ser_1_3_1),
        .in_ypos_ser(in_ypos_ser_1_3_1),
        .out_ypos_ser(out_ypos_ser_1_3_1),
        .in_yneg_ser(in_yneg_ser_1_3_1),
        .out_yneg_ser(out_yneg_ser_1_3_1),
        .in_zpos_ser(in_zpos_ser_1_3_1),
        .out_zpos_ser(out_zpos_ser_1_3_1),
        .in_zneg_ser(in_zneg_ser_1_3_1),
        .out_zneg_ser(out_zneg_ser_1_3_1)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd3),
        .cur_z(3'd2)
        )n_1_3_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_3_2),
        .out_xpos_ser(out_xpos_ser_1_3_2),
        .in_xneg_ser(in_xneg_ser_1_3_2),
        .out_xneg_ser(out_xneg_ser_1_3_2),
        .in_ypos_ser(in_ypos_ser_1_3_2),
        .out_ypos_ser(out_ypos_ser_1_3_2),
        .in_yneg_ser(in_yneg_ser_1_3_2),
        .out_yneg_ser(out_yneg_ser_1_3_2),
        .in_zpos_ser(in_zpos_ser_1_3_2),
        .out_zpos_ser(out_zpos_ser_1_3_2),
        .in_zneg_ser(in_zneg_ser_1_3_2),
        .out_zneg_ser(out_zneg_ser_1_3_2)
      );
    node#(
        .cur_x(3'd1),
        .cur_y(3'd3),
        .cur_z(3'd3)
        )n_1_3_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_3_3),
        .out_xpos_ser(out_xpos_ser_1_3_3),
        .in_xneg_ser(in_xneg_ser_1_3_3),
        .out_xneg_ser(out_xneg_ser_1_3_3),
        .in_ypos_ser(in_ypos_ser_1_3_3),
        .out_ypos_ser(out_ypos_ser_1_3_3),
        .in_yneg_ser(in_yneg_ser_1_3_3),
        .out_yneg_ser(out_yneg_ser_1_3_3),
        .in_zpos_ser(in_zpos_ser_1_3_3),
        .out_zpos_ser(out_zpos_ser_1_3_3),
        .in_zneg_ser(in_zneg_ser_1_3_3),
        .out_zneg_ser(out_zneg_ser_1_3_3)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd0),
        .cur_z(3'd0)
        )n_2_0_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_0_0),
        .out_xpos_ser(out_xpos_ser_2_0_0),
        .in_xneg_ser(in_xneg_ser_2_0_0),
        .out_xneg_ser(out_xneg_ser_2_0_0),
        .in_ypos_ser(in_ypos_ser_2_0_0),
        .out_ypos_ser(out_ypos_ser_2_0_0),
        .in_yneg_ser(in_yneg_ser_2_0_0),
        .out_yneg_ser(out_yneg_ser_2_0_0),
        .in_zpos_ser(in_zpos_ser_2_0_0),
        .out_zpos_ser(out_zpos_ser_2_0_0),
        .in_zneg_ser(in_zneg_ser_2_0_0),
        .out_zneg_ser(out_zneg_ser_2_0_0)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd0),
        .cur_z(3'd1)
        )n_2_0_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_0_1),
        .out_xpos_ser(out_xpos_ser_2_0_1),
        .in_xneg_ser(in_xneg_ser_2_0_1),
        .out_xneg_ser(out_xneg_ser_2_0_1),
        .in_ypos_ser(in_ypos_ser_2_0_1),
        .out_ypos_ser(out_ypos_ser_2_0_1),
        .in_yneg_ser(in_yneg_ser_2_0_1),
        .out_yneg_ser(out_yneg_ser_2_0_1),
        .in_zpos_ser(in_zpos_ser_2_0_1),
        .out_zpos_ser(out_zpos_ser_2_0_1),
        .in_zneg_ser(in_zneg_ser_2_0_1),
        .out_zneg_ser(out_zneg_ser_2_0_1)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd0),
        .cur_z(3'd2)
        )n_2_0_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_0_2),
        .out_xpos_ser(out_xpos_ser_2_0_2),
        .in_xneg_ser(in_xneg_ser_2_0_2),
        .out_xneg_ser(out_xneg_ser_2_0_2),
        .in_ypos_ser(in_ypos_ser_2_0_2),
        .out_ypos_ser(out_ypos_ser_2_0_2),
        .in_yneg_ser(in_yneg_ser_2_0_2),
        .out_yneg_ser(out_yneg_ser_2_0_2),
        .in_zpos_ser(in_zpos_ser_2_0_2),
        .out_zpos_ser(out_zpos_ser_2_0_2),
        .in_zneg_ser(in_zneg_ser_2_0_2),
        .out_zneg_ser(out_zneg_ser_2_0_2)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd0),
        .cur_z(3'd3)
        )n_2_0_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_0_3),
        .out_xpos_ser(out_xpos_ser_2_0_3),
        .in_xneg_ser(in_xneg_ser_2_0_3),
        .out_xneg_ser(out_xneg_ser_2_0_3),
        .in_ypos_ser(in_ypos_ser_2_0_3),
        .out_ypos_ser(out_ypos_ser_2_0_3),
        .in_yneg_ser(in_yneg_ser_2_0_3),
        .out_yneg_ser(out_yneg_ser_2_0_3),
        .in_zpos_ser(in_zpos_ser_2_0_3),
        .out_zpos_ser(out_zpos_ser_2_0_3),
        .in_zneg_ser(in_zneg_ser_2_0_3),
        .out_zneg_ser(out_zneg_ser_2_0_3)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd1),
        .cur_z(3'd0)
        )n_2_1_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_1_0),
        .out_xpos_ser(out_xpos_ser_2_1_0),
        .in_xneg_ser(in_xneg_ser_2_1_0),
        .out_xneg_ser(out_xneg_ser_2_1_0),
        .in_ypos_ser(in_ypos_ser_2_1_0),
        .out_ypos_ser(out_ypos_ser_2_1_0),
        .in_yneg_ser(in_yneg_ser_2_1_0),
        .out_yneg_ser(out_yneg_ser_2_1_0),
        .in_zpos_ser(in_zpos_ser_2_1_0),
        .out_zpos_ser(out_zpos_ser_2_1_0),
        .in_zneg_ser(in_zneg_ser_2_1_0),
        .out_zneg_ser(out_zneg_ser_2_1_0)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd1),
        .cur_z(3'd1)
        )n_2_1_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_1_1),
        .out_xpos_ser(out_xpos_ser_2_1_1),
        .in_xneg_ser(in_xneg_ser_2_1_1),
        .out_xneg_ser(out_xneg_ser_2_1_1),
        .in_ypos_ser(in_ypos_ser_2_1_1),
        .out_ypos_ser(out_ypos_ser_2_1_1),
        .in_yneg_ser(in_yneg_ser_2_1_1),
        .out_yneg_ser(out_yneg_ser_2_1_1),
        .in_zpos_ser(in_zpos_ser_2_1_1),
        .out_zpos_ser(out_zpos_ser_2_1_1),
        .in_zneg_ser(in_zneg_ser_2_1_1),
        .out_zneg_ser(out_zneg_ser_2_1_1)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd1),
        .cur_z(3'd2)
        )n_2_1_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_1_2),
        .out_xpos_ser(out_xpos_ser_2_1_2),
        .in_xneg_ser(in_xneg_ser_2_1_2),
        .out_xneg_ser(out_xneg_ser_2_1_2),
        .in_ypos_ser(in_ypos_ser_2_1_2),
        .out_ypos_ser(out_ypos_ser_2_1_2),
        .in_yneg_ser(in_yneg_ser_2_1_2),
        .out_yneg_ser(out_yneg_ser_2_1_2),
        .in_zpos_ser(in_zpos_ser_2_1_2),
        .out_zpos_ser(out_zpos_ser_2_1_2),
        .in_zneg_ser(in_zneg_ser_2_1_2),
        .out_zneg_ser(out_zneg_ser_2_1_2)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd1),
        .cur_z(3'd3)
        )n_2_1_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_1_3),
        .out_xpos_ser(out_xpos_ser_2_1_3),
        .in_xneg_ser(in_xneg_ser_2_1_3),
        .out_xneg_ser(out_xneg_ser_2_1_3),
        .in_ypos_ser(in_ypos_ser_2_1_3),
        .out_ypos_ser(out_ypos_ser_2_1_3),
        .in_yneg_ser(in_yneg_ser_2_1_3),
        .out_yneg_ser(out_yneg_ser_2_1_3),
        .in_zpos_ser(in_zpos_ser_2_1_3),
        .out_zpos_ser(out_zpos_ser_2_1_3),
        .in_zneg_ser(in_zneg_ser_2_1_3),
        .out_zneg_ser(out_zneg_ser_2_1_3)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd2),
        .cur_z(3'd0)
        )n_2_2_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_2_0),
        .out_xpos_ser(out_xpos_ser_2_2_0),
        .in_xneg_ser(in_xneg_ser_2_2_0),
        .out_xneg_ser(out_xneg_ser_2_2_0),
        .in_ypos_ser(in_ypos_ser_2_2_0),
        .out_ypos_ser(out_ypos_ser_2_2_0),
        .in_yneg_ser(in_yneg_ser_2_2_0),
        .out_yneg_ser(out_yneg_ser_2_2_0),
        .in_zpos_ser(in_zpos_ser_2_2_0),
        .out_zpos_ser(out_zpos_ser_2_2_0),
        .in_zneg_ser(in_zneg_ser_2_2_0),
        .out_zneg_ser(out_zneg_ser_2_2_0)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd2),
        .cur_z(3'd1)
        )n_2_2_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_2_1),
        .out_xpos_ser(out_xpos_ser_2_2_1),
        .in_xneg_ser(in_xneg_ser_2_2_1),
        .out_xneg_ser(out_xneg_ser_2_2_1),
        .in_ypos_ser(in_ypos_ser_2_2_1),
        .out_ypos_ser(out_ypos_ser_2_2_1),
        .in_yneg_ser(in_yneg_ser_2_2_1),
        .out_yneg_ser(out_yneg_ser_2_2_1),
        .in_zpos_ser(in_zpos_ser_2_2_1),
        .out_zpos_ser(out_zpos_ser_2_2_1),
        .in_zneg_ser(in_zneg_ser_2_2_1),
        .out_zneg_ser(out_zneg_ser_2_2_1)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd2),
        .cur_z(3'd2)
        )n_2_2_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_2_2),
        .out_xpos_ser(out_xpos_ser_2_2_2),
        .in_xneg_ser(in_xneg_ser_2_2_2),
        .out_xneg_ser(out_xneg_ser_2_2_2),
        .in_ypos_ser(in_ypos_ser_2_2_2),
        .out_ypos_ser(out_ypos_ser_2_2_2),
        .in_yneg_ser(in_yneg_ser_2_2_2),
        .out_yneg_ser(out_yneg_ser_2_2_2),
        .in_zpos_ser(in_zpos_ser_2_2_2),
        .out_zpos_ser(out_zpos_ser_2_2_2),
        .in_zneg_ser(in_zneg_ser_2_2_2),
        .out_zneg_ser(out_zneg_ser_2_2_2)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd2),
        .cur_z(3'd3)
        )n_2_2_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_2_3),
        .out_xpos_ser(out_xpos_ser_2_2_3),
        .in_xneg_ser(in_xneg_ser_2_2_3),
        .out_xneg_ser(out_xneg_ser_2_2_3),
        .in_ypos_ser(in_ypos_ser_2_2_3),
        .out_ypos_ser(out_ypos_ser_2_2_3),
        .in_yneg_ser(in_yneg_ser_2_2_3),
        .out_yneg_ser(out_yneg_ser_2_2_3),
        .in_zpos_ser(in_zpos_ser_2_2_3),
        .out_zpos_ser(out_zpos_ser_2_2_3),
        .in_zneg_ser(in_zneg_ser_2_2_3),
        .out_zneg_ser(out_zneg_ser_2_2_3)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd3),
        .cur_z(3'd0)
        )n_2_3_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_3_0),
        .out_xpos_ser(out_xpos_ser_2_3_0),
        .in_xneg_ser(in_xneg_ser_2_3_0),
        .out_xneg_ser(out_xneg_ser_2_3_0),
        .in_ypos_ser(in_ypos_ser_2_3_0),
        .out_ypos_ser(out_ypos_ser_2_3_0),
        .in_yneg_ser(in_yneg_ser_2_3_0),
        .out_yneg_ser(out_yneg_ser_2_3_0),
        .in_zpos_ser(in_zpos_ser_2_3_0),
        .out_zpos_ser(out_zpos_ser_2_3_0),
        .in_zneg_ser(in_zneg_ser_2_3_0),
        .out_zneg_ser(out_zneg_ser_2_3_0)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd3),
        .cur_z(3'd1)
        )n_2_3_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_3_1),
        .out_xpos_ser(out_xpos_ser_2_3_1),
        .in_xneg_ser(in_xneg_ser_2_3_1),
        .out_xneg_ser(out_xneg_ser_2_3_1),
        .in_ypos_ser(in_ypos_ser_2_3_1),
        .out_ypos_ser(out_ypos_ser_2_3_1),
        .in_yneg_ser(in_yneg_ser_2_3_1),
        .out_yneg_ser(out_yneg_ser_2_3_1),
        .in_zpos_ser(in_zpos_ser_2_3_1),
        .out_zpos_ser(out_zpos_ser_2_3_1),
        .in_zneg_ser(in_zneg_ser_2_3_1),
        .out_zneg_ser(out_zneg_ser_2_3_1)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd3),
        .cur_z(3'd2)
        )n_2_3_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_3_2),
        .out_xpos_ser(out_xpos_ser_2_3_2),
        .in_xneg_ser(in_xneg_ser_2_3_2),
        .out_xneg_ser(out_xneg_ser_2_3_2),
        .in_ypos_ser(in_ypos_ser_2_3_2),
        .out_ypos_ser(out_ypos_ser_2_3_2),
        .in_yneg_ser(in_yneg_ser_2_3_2),
        .out_yneg_ser(out_yneg_ser_2_3_2),
        .in_zpos_ser(in_zpos_ser_2_3_2),
        .out_zpos_ser(out_zpos_ser_2_3_2),
        .in_zneg_ser(in_zneg_ser_2_3_2),
        .out_zneg_ser(out_zneg_ser_2_3_2)
      );
    node#(
        .cur_x(3'd2),
        .cur_y(3'd3),
        .cur_z(3'd3)
        )n_2_3_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_2_3_3),
        .out_xpos_ser(out_xpos_ser_2_3_3),
        .in_xneg_ser(in_xneg_ser_2_3_3),
        .out_xneg_ser(out_xneg_ser_2_3_3),
        .in_ypos_ser(in_ypos_ser_2_3_3),
        .out_ypos_ser(out_ypos_ser_2_3_3),
        .in_yneg_ser(in_yneg_ser_2_3_3),
        .out_yneg_ser(out_yneg_ser_2_3_3),
        .in_zpos_ser(in_zpos_ser_2_3_3),
        .out_zpos_ser(out_zpos_ser_2_3_3),
        .in_zneg_ser(in_zneg_ser_2_3_3),
        .out_zneg_ser(out_zneg_ser_2_3_3)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd0),
        .cur_z(3'd0)
        )n_3_0_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_0_0),
        .out_xpos_ser(out_xpos_ser_3_0_0),
        .in_xneg_ser(in_xneg_ser_3_0_0),
        .out_xneg_ser(out_xneg_ser_3_0_0),
        .in_ypos_ser(in_ypos_ser_3_0_0),
        .out_ypos_ser(out_ypos_ser_3_0_0),
        .in_yneg_ser(in_yneg_ser_3_0_0),
        .out_yneg_ser(out_yneg_ser_3_0_0),
        .in_zpos_ser(in_zpos_ser_3_0_0),
        .out_zpos_ser(out_zpos_ser_3_0_0),
        .in_zneg_ser(in_zneg_ser_3_0_0),
        .out_zneg_ser(out_zneg_ser_3_0_0)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd0),
        .cur_z(3'd1)
        )n_3_0_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_0_1),
        .out_xpos_ser(out_xpos_ser_3_0_1),
        .in_xneg_ser(in_xneg_ser_3_0_1),
        .out_xneg_ser(out_xneg_ser_3_0_1),
        .in_ypos_ser(in_ypos_ser_3_0_1),
        .out_ypos_ser(out_ypos_ser_3_0_1),
        .in_yneg_ser(in_yneg_ser_3_0_1),
        .out_yneg_ser(out_yneg_ser_3_0_1),
        .in_zpos_ser(in_zpos_ser_3_0_1),
        .out_zpos_ser(out_zpos_ser_3_0_1),
        .in_zneg_ser(in_zneg_ser_3_0_1),
        .out_zneg_ser(out_zneg_ser_3_0_1)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd0),
        .cur_z(3'd2)
        )n_3_0_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_0_2),
        .out_xpos_ser(out_xpos_ser_3_0_2),
        .in_xneg_ser(in_xneg_ser_3_0_2),
        .out_xneg_ser(out_xneg_ser_3_0_2),
        .in_ypos_ser(in_ypos_ser_3_0_2),
        .out_ypos_ser(out_ypos_ser_3_0_2),
        .in_yneg_ser(in_yneg_ser_3_0_2),
        .out_yneg_ser(out_yneg_ser_3_0_2),
        .in_zpos_ser(in_zpos_ser_3_0_2),
        .out_zpos_ser(out_zpos_ser_3_0_2),
        .in_zneg_ser(in_zneg_ser_3_0_2),
        .out_zneg_ser(out_zneg_ser_3_0_2)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd0),
        .cur_z(3'd3)
        )n_3_0_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_0_3),
        .out_xpos_ser(out_xpos_ser_3_0_3),
        .in_xneg_ser(in_xneg_ser_3_0_3),
        .out_xneg_ser(out_xneg_ser_3_0_3),
        .in_ypos_ser(in_ypos_ser_3_0_3),
        .out_ypos_ser(out_ypos_ser_3_0_3),
        .in_yneg_ser(in_yneg_ser_3_0_3),
        .out_yneg_ser(out_yneg_ser_3_0_3),
        .in_zpos_ser(in_zpos_ser_3_0_3),
        .out_zpos_ser(out_zpos_ser_3_0_3),
        .in_zneg_ser(in_zneg_ser_3_0_3),
        .out_zneg_ser(out_zneg_ser_3_0_3)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd1),
        .cur_z(3'd0)
        )n_3_1_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_1_0),
        .out_xpos_ser(out_xpos_ser_3_1_0),
        .in_xneg_ser(in_xneg_ser_3_1_0),
        .out_xneg_ser(out_xneg_ser_3_1_0),
        .in_ypos_ser(in_ypos_ser_3_1_0),
        .out_ypos_ser(out_ypos_ser_3_1_0),
        .in_yneg_ser(in_yneg_ser_3_1_0),
        .out_yneg_ser(out_yneg_ser_3_1_0),
        .in_zpos_ser(in_zpos_ser_3_1_0),
        .out_zpos_ser(out_zpos_ser_3_1_0),
        .in_zneg_ser(in_zneg_ser_3_1_0),
        .out_zneg_ser(out_zneg_ser_3_1_0)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd1),
        .cur_z(3'd1)
        )n_3_1_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_1_1),
        .out_xpos_ser(out_xpos_ser_3_1_1),
        .in_xneg_ser(in_xneg_ser_3_1_1),
        .out_xneg_ser(out_xneg_ser_3_1_1),
        .in_ypos_ser(in_ypos_ser_3_1_1),
        .out_ypos_ser(out_ypos_ser_3_1_1),
        .in_yneg_ser(in_yneg_ser_3_1_1),
        .out_yneg_ser(out_yneg_ser_3_1_1),
        .in_zpos_ser(in_zpos_ser_3_1_1),
        .out_zpos_ser(out_zpos_ser_3_1_1),
        .in_zneg_ser(in_zneg_ser_3_1_1),
        .out_zneg_ser(out_zneg_ser_3_1_1)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd1),
        .cur_z(3'd2)
        )n_3_1_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_1_2),
        .out_xpos_ser(out_xpos_ser_3_1_2),
        .in_xneg_ser(in_xneg_ser_3_1_2),
        .out_xneg_ser(out_xneg_ser_3_1_2),
        .in_ypos_ser(in_ypos_ser_3_1_2),
        .out_ypos_ser(out_ypos_ser_3_1_2),
        .in_yneg_ser(in_yneg_ser_3_1_2),
        .out_yneg_ser(out_yneg_ser_3_1_2),
        .in_zpos_ser(in_zpos_ser_3_1_2),
        .out_zpos_ser(out_zpos_ser_3_1_2),
        .in_zneg_ser(in_zneg_ser_3_1_2),
        .out_zneg_ser(out_zneg_ser_3_1_2)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd1),
        .cur_z(3'd3)
        )n_3_1_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_1_3),
        .out_xpos_ser(out_xpos_ser_3_1_3),
        .in_xneg_ser(in_xneg_ser_3_1_3),
        .out_xneg_ser(out_xneg_ser_3_1_3),
        .in_ypos_ser(in_ypos_ser_3_1_3),
        .out_ypos_ser(out_ypos_ser_3_1_3),
        .in_yneg_ser(in_yneg_ser_3_1_3),
        .out_yneg_ser(out_yneg_ser_3_1_3),
        .in_zpos_ser(in_zpos_ser_3_1_3),
        .out_zpos_ser(out_zpos_ser_3_1_3),
        .in_zneg_ser(in_zneg_ser_3_1_3),
        .out_zneg_ser(out_zneg_ser_3_1_3)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd2),
        .cur_z(3'd0)
        )n_3_2_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_2_0),
        .out_xpos_ser(out_xpos_ser_3_2_0),
        .in_xneg_ser(in_xneg_ser_3_2_0),
        .out_xneg_ser(out_xneg_ser_3_2_0),
        .in_ypos_ser(in_ypos_ser_3_2_0),
        .out_ypos_ser(out_ypos_ser_3_2_0),
        .in_yneg_ser(in_yneg_ser_3_2_0),
        .out_yneg_ser(out_yneg_ser_3_2_0),
        .in_zpos_ser(in_zpos_ser_3_2_0),
        .out_zpos_ser(out_zpos_ser_3_2_0),
        .in_zneg_ser(in_zneg_ser_3_2_0),
        .out_zneg_ser(out_zneg_ser_3_2_0)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd2),
        .cur_z(3'd1)
        )n_3_2_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_2_1),
        .out_xpos_ser(out_xpos_ser_3_2_1),
        .in_xneg_ser(in_xneg_ser_3_2_1),
        .out_xneg_ser(out_xneg_ser_3_2_1),
        .in_ypos_ser(in_ypos_ser_3_2_1),
        .out_ypos_ser(out_ypos_ser_3_2_1),
        .in_yneg_ser(in_yneg_ser_3_2_1),
        .out_yneg_ser(out_yneg_ser_3_2_1),
        .in_zpos_ser(in_zpos_ser_3_2_1),
        .out_zpos_ser(out_zpos_ser_3_2_1),
        .in_zneg_ser(in_zneg_ser_3_2_1),
        .out_zneg_ser(out_zneg_ser_3_2_1)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd2),
        .cur_z(3'd2)
        )n_3_2_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_2_2),
        .out_xpos_ser(out_xpos_ser_3_2_2),
        .in_xneg_ser(in_xneg_ser_3_2_2),
        .out_xneg_ser(out_xneg_ser_3_2_2),
        .in_ypos_ser(in_ypos_ser_3_2_2),
        .out_ypos_ser(out_ypos_ser_3_2_2),
        .in_yneg_ser(in_yneg_ser_3_2_2),
        .out_yneg_ser(out_yneg_ser_3_2_2),
        .in_zpos_ser(in_zpos_ser_3_2_2),
        .out_zpos_ser(out_zpos_ser_3_2_2),
        .in_zneg_ser(in_zneg_ser_3_2_2),
        .out_zneg_ser(out_zneg_ser_3_2_2)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd2),
        .cur_z(3'd3)
        )n_3_2_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_2_3),
        .out_xpos_ser(out_xpos_ser_3_2_3),
        .in_xneg_ser(in_xneg_ser_3_2_3),
        .out_xneg_ser(out_xneg_ser_3_2_3),
        .in_ypos_ser(in_ypos_ser_3_2_3),
        .out_ypos_ser(out_ypos_ser_3_2_3),
        .in_yneg_ser(in_yneg_ser_3_2_3),
        .out_yneg_ser(out_yneg_ser_3_2_3),
        .in_zpos_ser(in_zpos_ser_3_2_3),
        .out_zpos_ser(out_zpos_ser_3_2_3),
        .in_zneg_ser(in_zneg_ser_3_2_3),
        .out_zneg_ser(out_zneg_ser_3_2_3)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd3),
        .cur_z(3'd0)
        )n_3_3_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_3_0),
        .out_xpos_ser(out_xpos_ser_3_3_0),
        .in_xneg_ser(in_xneg_ser_3_3_0),
        .out_xneg_ser(out_xneg_ser_3_3_0),
        .in_ypos_ser(in_ypos_ser_3_3_0),
        .out_ypos_ser(out_ypos_ser_3_3_0),
        .in_yneg_ser(in_yneg_ser_3_3_0),
        .out_yneg_ser(out_yneg_ser_3_3_0),
        .in_zpos_ser(in_zpos_ser_3_3_0),
        .out_zpos_ser(out_zpos_ser_3_3_0),
        .in_zneg_ser(in_zneg_ser_3_3_0),
        .out_zneg_ser(out_zneg_ser_3_3_0)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd3),
        .cur_z(3'd1)
        )n_3_3_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_3_1),
        .out_xpos_ser(out_xpos_ser_3_3_1),
        .in_xneg_ser(in_xneg_ser_3_3_1),
        .out_xneg_ser(out_xneg_ser_3_3_1),
        .in_ypos_ser(in_ypos_ser_3_3_1),
        .out_ypos_ser(out_ypos_ser_3_3_1),
        .in_yneg_ser(in_yneg_ser_3_3_1),
        .out_yneg_ser(out_yneg_ser_3_3_1),
        .in_zpos_ser(in_zpos_ser_3_3_1),
        .out_zpos_ser(out_zpos_ser_3_3_1),
        .in_zneg_ser(in_zneg_ser_3_3_1),
        .out_zneg_ser(out_zneg_ser_3_3_1)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd3),
        .cur_z(3'd2)
        )n_3_3_2(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_3_2),
        .out_xpos_ser(out_xpos_ser_3_3_2),
        .in_xneg_ser(in_xneg_ser_3_3_2),
        .out_xneg_ser(out_xneg_ser_3_3_2),
        .in_ypos_ser(in_ypos_ser_3_3_2),
        .out_ypos_ser(out_ypos_ser_3_3_2),
        .in_yneg_ser(in_yneg_ser_3_3_2),
        .out_yneg_ser(out_yneg_ser_3_3_2),
        .in_zpos_ser(in_zpos_ser_3_3_2),
        .out_zpos_ser(out_zpos_ser_3_3_2),
        .in_zneg_ser(in_zneg_ser_3_3_2),
        .out_zneg_ser(out_zneg_ser_3_3_2)
      );
    node#(
        .cur_x(3'd3),
        .cur_y(3'd3),
        .cur_z(3'd3)
        )n_3_3_3(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_3_3_3),
        .out_xpos_ser(out_xpos_ser_3_3_3),
        .in_xneg_ser(in_xneg_ser_3_3_3),
        .out_xneg_ser(out_xneg_ser_3_3_3),
        .in_ypos_ser(in_ypos_ser_3_3_3),
        .out_ypos_ser(out_ypos_ser_3_3_3),
        .in_yneg_ser(in_yneg_ser_3_3_3),
        .out_yneg_ser(out_yneg_ser_3_3_3),
        .in_zpos_ser(in_zpos_ser_3_3_3),
        .out_zpos_ser(out_zpos_ser_3_3_3),
        .in_zneg_ser(in_zneg_ser_3_3_3),
        .out_zneg_ser(out_zneg_ser_3_3_3)
      );
endmodule
