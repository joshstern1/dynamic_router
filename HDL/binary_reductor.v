`include "para.v"
module binary_reductor#(
)(
    input clk,
    input rst,
    input [FLIT_SIZE - 1 : 0] in0,
    input [FLIT_SIZE - 1 : 0] in1,
    input in0_valid,
    input in1_valid,
    input out_avail,
    output reg in0_avail,
    output reg in1_avail,
    output [FLIT_SIZE - 1 : 0] out,
    output out_valid
);

    reg [FLIT_SIZE - 1 : 0] in_slot0;
    reg [FLIT_SIZE - 1 : 0] in_slot1;

    reg slot0_valid;
    reg slot1_valid;

    reg selector;

    reg slot0_ptr;
    reg slot1_ptr;

    assign out = selector ? in0 : in1;

    assign out_valid = selector ? slot0_valid : slot1_valid;
    
    always@(*) begin
        out_valid = selector ? 
        
    end
endmodule
