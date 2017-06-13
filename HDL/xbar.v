`include "parameter.v"
module xbar#(
    parameter M_in = 28, 
    parameter N_out = 7
)(
    input [M_in * flit_size - 1 : 0] inputs,
    input [M_in * N_out -1 : 0] xpoints_enable,
    output [N_out * flit_size -1 : 0] outputs
);

    genvar i, j;

    wire [FLIT_SIZE - 1 : 0] h_in_array [M_in * N_out - 1 : 0];
    wire [FLIT_SIZE - 1 : 0] v_in_array [M_in * N_out - 1 : 0];
    wire [FLIT_SIZE - 1 : 0] h_out_array [M_in * N_out - 1 : 0];
    wire [FLIT_SIZE - 1 : 0] v_out_array [M_in * N_out - 1 : 0];



    generate 
        for(i = 0; i < M_in; i = i + 1)
        begin: V
            for(j = 0 ; j < N_out; j = j + 1) 
            begin: H
                xpoint (
                    .h_in(),
                    .v_in(),
                    .cross_enable(xpoints_enable[i * N_out + j]),
                    .h_out(),
                    .v_out()
                );
            end
        end
    endgenerate



endmodule
