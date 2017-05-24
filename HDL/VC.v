`include "parameter.v"
module VC
(
    input clk,
    input rst,
    

    output reg [2:0] G, //Global: state Either idle (I), routing (R), waiting for an output VC (V), active (A), or waiting for credits (C).
    output reg [2:0] R, //Route: After routing is completed for a packet, this field holds the output port selected for the packet.
    output reg [3:0] O, //Output VC: After virtual-channel allocation is completed for a packet, this field holds the output virtual channel of port R assigned to the packet.
    output reg [2:0] P, //the number of the empty slots in VC
    input [2:0] C       //Credit count The number of credits (available downstream flit buffers) for output virtual channel O on output port R.
);
