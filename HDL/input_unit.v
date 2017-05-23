//input unit for dynamic router
//Format: VC
module input_unit
#(
    parameter phit_size=256
    parameter flit_size
)(
    input clk,
    input rst,
    input [flit_size-1:0] data_in,
    input valid_in,
    
    output [flit_size-1:0] credit_out,
);
