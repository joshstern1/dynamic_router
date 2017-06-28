`include "para.sv"


module reduction_tree#(
    parameter FAN_IN = 36,
    parameter L1_N = 6,
    parameter L2_N = 1
)
(
    input clk,
    input rst,
    input [FLIT_SIZE * FAN_IN  - 1 : 0] in,
    input [FAN_IN - 1 : 0] in_valid,
    input out_avail,
    output reg [FAN_IN - 1 : 0] in_avail,
    output [FLIT_SIZE - 1 : 0] out,
    output out_valid
);
    parameter L1_W = FAN_IN / L1_N;
    parameter L2_W = L1_N;


    wire [L1_N - 1 : 0] out_avail_L2_to_L1;
    wire [L1_N - 1 : 0] out_valid_L1_to_L2;
    wire [FLIT_SIZE - 1 : 0] out_L1_to_L2[L1_N - 1 : 0];
//we need two levels of reductors
    //instantiate first level
    genvar i;

    generate
        for(i = 0; i < L1_N; i = i + 1) begin: L1_reductors
            N_to_1_reductor#(
                .N(L1_W)
            )level1(
                .clk(clk),
                .rst(rst),
                .in(in[i * L1_W * FLIT_SIZE + L1_W * FLIT_SIZE - 1 : i * L1_W * FLIT_SIZE]),
                .in_valid(in_valid[i * L1_W + L1_W - 1 : i * L1_W]),
                .out_avail(out_avail_L2_to_L1[i]),
                .in_avail(in_avail[i * L1_W + L1_W - 1 : i * L1_W]),
                .out(out_L1_to_L2[i]),
                .out_valid(out_valid_L1_to_L2[i])
            );
        end
    endgenerate
	 
	 wire [FLIT_SIZE * L1_N - 1 : 0] out_L1_to_L2_packed;
	 generate 
	     for(i = 0; i < L1_N; i = i + 1) begin: pack_out_l1_to_l2
		      assign out_L1_to_L2_packed[i * FLIT_SIZE + FLIT_SIZE - 1 : i* FLIT_SIZE] = out_L1_to_L2[i];	  
		  end
	 endgenerate


    //instantiate second level
    N_to_1_reductor#(
        .N(L2_W)
    )L2_reductor(
        .clk(clk),
        .rst(rst),
        .in(out_L1_to_L2_packed),
        .in_valid(out_valid_L1_to_L2),
        .out_avail(out_avail),
        .in_avail(out_avail_L2_to_L1),
        .out(out),
        .out_valid(out_valid)
    );


endmodule
