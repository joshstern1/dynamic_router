`include "parameter.v"
module VC
(
    input clk,
    input rst,
    
    output reg [2:0] G, //Global: state Either idle (I), routing (R), waiting for an output VC (V), active (A), or waiting for credits (C).
    output reg [2:0] R, //Route: After routing is completed for a packet, this field holds the output port selected for the packet.
    output reg [3:0] O, //Output VC: After virtual-channel allocation is completed for a packet, this field holds the output virtual channel of port R assigned to the packet.
    output reg [buffer_width - 1:0] P, //the number of the empty slots in VC
    input [2:0] C,       //Credit count: The number of credits (available downstream flit buffers) for output virtual channel O on output port R.
    
    input [FLIT_SIZE-1:0] flit_in,
    input valid_in,
    input [2:0] route_in, //the output port number of current flit_in
    
    output [FLIT_SIZE-1:0] flit_out,
      
);
//VC states list
    parameter IDLE    = 3'd0;
    parameter ROUTING = 3'd1;
    parameter WATING  = 3'd2;
    parameter ACTIVE  = 3'd3;
    parameter CREDITS = 3'd4;

    always@(posedge clk) begin
        if(rst) begin
            G<=IDLE;
        end
        else begin
            case(G)
                IDLE: begin
                    if P
                end
            endcase
        end
    end


    wire is_head;

    assign is_head = valid_in && (flit_in[FLIT_SIZE - 1 : FLIT_SIZE - 2] == HEAD_FLIT); 

    wire buffer_produce;
    wire buffer_consume;
    wire buffer_full;
    wire buffer_empty;
    wire [buffer_width - 1 : 0] buffer_usedw;

    buffer#(
        .buffer_depth(FLIT_SIZE),
        .buffer_width(VC_SIZE),
    )VC_buffer(
        .clk        (clk),
        .rst        (rst),
        .in         (flit_in),
        .produce    (buffer_produce),
        .consume    (buffer_consume),
        .full       (buffer_full),
        .empty      (buffer_empty),
        .out        (flit_out),
        .usedw      (buffer_usedw)
    );

    assign P = VC_SIZE - 1 - buffer_usedw;


endmodule


    
