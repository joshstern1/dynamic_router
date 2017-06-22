`include "para.v"
parameter N = 8;
module N_to_1_reductor(
    input clk,
    input rst,
    input [FLIT_SIZE * N - 1 : 0] in,
    input [N - 1 : 0] in_valid,
    output out_avail,
    output reg [N - 1 : 0] in_avail,
    output [FLIT_SIZE - 1 : 0] out,
    output out_valid
);

    reg [FLIT_SIZE - 1 : 0] in_slot [N - 1 : 0];
    
    wire [N - 1 : 0] slot_is_head;

    reg [N - 1 : 0] slot_valid;

    reg [N - 1 : 0] selector;

    genvar i;

    generate 
        for(i = 0; i < N; i = i + 1) begin
            assign slot_is_head[i] = (in_slot[i][FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT) || (in_slot[i][FLIT_SIZE - 1 : FLIT_SIEZ - HEADER_LEN] == SINGLE_FLIT);
        end
    endgenerate

    assign out = in_slot[selector];

    assign out_valid = slot_valid[selector];

    always@(*) begin
        if(out_avail) 
            in_avail = (1 << selector) | (~ slot_valid);
        else 
            in_avail = (~slot_valid);
    end

    generate 
    for(i = 0; i < N; i = i + 1) begin
        always@(posedge clk) begin
            if(rst) begin
                in_slot[i] < = 0;
            end
            else begin
                if(in_avail[i]) begin
                    in_slot[i] <= in[FLIT_SIZE * i + FLIT_SIEZ - 1: FLIT_SIZE * i];
                    slot_valid[i] <= in_valid[i];
                end
            end
        end
    end
    endgenerate



endmodule
