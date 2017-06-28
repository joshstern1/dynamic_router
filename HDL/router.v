module router#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
    parameter input_Q_size = 256,
    parameter credit_back_period = 100,
    parameter credit_threshold = 160
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

    wire VA_stall_xpos;
    wire VA_stall_ypos;
    wire VA_stall_zpos;
    wire VA_stall_xneg;
    wire VA_stall_yneg;
    wire VA_stall_zneg;
 
    reg [FLIT_SIZE - 1 : 0] xpos_downstream_credits;
    reg [FLIT_SIZE - 1 : 0] ypos_downstream_credits;
    reg [FLIT_SIZE - 1 : 0] zpos_downstream_credits;
    reg [FLIT_SIZE - 1 : 0] xneg_downstream_credits;
    reg [FLIT_SIZE - 1 : 0] yneg_downstream_credits;
    reg [FLIT_SIZE - 1 : 0] zneg_downstream_credits;

    wire [FLIT_SIZE - 1 : 0] xpos_upstream_credits;
    wire [FLIT_SIZE - 1 : 0] ypos_upstream_credits;
    wire [FLIT_SIZE - 1 : 0] zpos_upstream_credits;
    wire [FLIT_SIZE - 1 : 0] xneg_upstream_credits;
    wire [FLIT_SIZE - 1 : 0] yneg_upstream_credits;
    wire [FLIT_SIZE - 1 : 0] zneg_upstream_credits;
    


    assign in_xpos_is_credit = in_xpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_ypos_is_credit = in_ypos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_zpos_is_credit = in_zpos[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_xneg_is_credit = in_xneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_yneg_is_credit = in_yneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;
    assign in_zneg_is_credit = in_zneg[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == CREDIT_FLIT;

    //instantiate 6 big input buffers

    wire xpos_input_queue_empty;
    wire ypos_input_queue_empty;
    wire zpos_input_queue_empty;
    wire xneg_input_queue_empty;
    wire yneg_input_queue_empty;
    wire zneg_input_queue_empty;
 
    wire in_xpos_valid_RC;
    wire in_ypos_valid_RC;
    wire in_zpos_valid_RC;
    wire in_xneg_valid_RC;
    wire in_yneg_valid_RC;
    wire in_zneg_valid_RC;

    wire [FLIT_SIZE - 1 : 0] in_xpos_RC;
    wire [FLIT_SIZE - 1 : 0] in_ypos_RC;
    wire [FLIT_SIZE - 1 : 0] in_zpos_RC;
    wire [FLIT_SIZE - 1 : 0] in_xneg_RC;
    wire [FLIT_SIZE - 1 : 0] in_yneg_RC;
    wire [FLIT_SIZE - 1 : 0] in_zneg_RC;

    wire [input_Q_size - 1 : 0] in_xpos_q_usedw;
    wire [input_Q_size - 1 : 0] in_ypos_q_usedw;
    wire [input_Q_size - 1 : 0] in_zpos_q_usedw;
    wire [input_Q_size - 1 : 0] in_xneg_q_usedw;
    wire [input_Q_size - 1 : 0] in_yneg_q_usedw;
    wire [input_Q_size - 1 : 0] in_zneg_q_usedw;



    buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    xpos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_xpos),
        .produce(in_xpos_valid),
        .consume(~VA_stall_xpos),
        .full(),
        .empty(xpos_input_queue_empty),
        .out(in_xpos_RC),
        .usedw(in_xpos_q_usedw)
    );

    assign in_xpos_valid_RC = ~xpos_input_queue_empty;

    buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    ypos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_ypos),
        .produce(in_ypos_valid),
        .consume(~VA_stall_ypos),
        .full(),
        .empty(ypos_input_queue_empty),
        .out(in_ypos_RC),
        .usedw(in_ypos_usedw)
    );

    assign in_ypos_valid_RC = ~ypos_input_queue_empty;

    buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    zpos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_zpos),
        .produce(in_zpos_valid),
        .consume(~VA_stall_zpos),
        .full(),
        .empty(zpos_input_queue_empty),
        .out(in_zpos_RC),
        .usedw(in_zpos_usedw)
    );

    assign in_zpos_valid_RC = ~zpos_input_queue_empty;
 
    buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    xneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_xneg),
        .produce(in_xneg_valid),
        .consume(~VA_stall_xneg),
        .full(),
        .empty(xneg_input_queue_empty),
        .out(in_xneg_RC),
        .usedw(in_xneg_usedw)
    );

    assign in_xneg_valid_RC = ~xneg_input_queue_empty;

    buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    yneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_yneg),
        .produce(in_yneg_valid),
        .consume(~VA_stall_yneg),
        .full(),
        .empty(yneg_input_queue_empty),
        .out(in_yneg_RC),
        .usedw(in_yneg_usedw)
    );

    assign in_yneg_valid_RC = ~yneg_input_queue_empty;

    buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    zneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_zneg),
        .produce(in_zneg_valid),
        .consume(~VA_stall_zneg),
        .full(),
        .empty(zneg_input_queue_empty),
        .out(in_zneg_RC),
        .usedw(in_zneg_usedw)
    );

    assign in_zneg_valid_RC = ~zneg_input_queue_empty;

    assign xpos_upstream_credits = input_Q_size - 1 - in_xpos_usedw;
    assign ypos_upstream_credits = input_Q_size - 1 - in_ypos_usedw;
    assign zpos_upstream_credits = input_Q_size - 1 - in_zpos_usedw;
    assign xneg_upstream_credits = input_Q_size - 1 - in_xneg_usedw;
    assign yneg_upstream_credits = input_Q_size - 1 - in_yneg_usedw;
    assign zneg_upstream_credits = input_Q_size - 1 - in_zneg_usedw;


    

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )xpos_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_xpos_valid && (~in_xpos_is_credit)),
        .flit_before_RC(in_xpos_valid),
        .stall(VA_stall_xpos),
        .dir_in(DIR_XPOS),
        .flit_after_RC(flit_xpos_VA),
        .flit_valid_out(flit_xpos_VA_valid),
        .dir_out(flit_xpos_VA_route),
        .eject_enable(eject_xpos_valid)
    );
    assign eject_xpos = flit_xpos_VA;

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )ypos_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_ypos_valid && (~in_ypos_is_credit)),
        .flit_before_RC(in_ypos_valid),
        .stall(VA_stall_ypos),
        .dir_in(DIR_YPOS),
        .flit_after_RC(flit_ypos_VA),
        .flit_valid_out(flit_ypos_VA_valid),
        .dir_out(flit_ypos_VA_route),
        .eject_enable(eject_ypos_valid)
    ); 
    assign eject_ypos = flit_ypos_VA;

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )zpos_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_zpos_valid && (~in_zpos_is_credit)),
        .flit_before_RC(in_zpos_valid),
        .stall(VA_stall_zpos),
        .dir_in(DIR_ZPOS),
        .flit_after_RC(flit_zpos_VA),
        .flit_valid_out(flit_zpos_VA_valid),
        .dir_out(flit_xneg_VA_route),
        .eject_enable(eject_zpos_valid)
    );
    assign eject_zpos = flit_zpos_VA;

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )xneg_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_xneg_valid && (~in_xneg_is_credit)),
        .flit_before_RC(in_xneg_valid),
        .stall(VA_stall_xneg),
        .dir_in(DIR_XNEG),
        .flit_after_RC(flit_xneg_VA),
        .flit_valid_out(flit_xneg_VA_valid),
        .dir_out(flit_xneg_VA_route),
        .eject_enable(eject_xneg_valid)
    );
    assign eject_xneg = flit_xneg_VA;

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )yneg_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_yneg_valid && (~in_yneg_is_credit)),
        .flit_before_RC(in_yneg_valid),
        .stall(VA_stall_yneg),
        .dir_in(DIR_YNEG),
        .flit_after_RC(flit_yneg_VA),
        .flit_valid_out(flit_yneg_VA_valid),
        .dir_out(flit_yneg_VA_route),
        .eject_enable(eject_yneg_valid)
    );
    assign eject_yneg = flit_yneg_VA;

    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )zneg_route_comp(
        .clk(clk),
        .rst(rst),
        ,flit_valid_in(in_zneg_valid && (~in_zneg_is_credit)),
        .flit_before_RC(in_zneg_valid),
        .stall(VA_stall_zneg),
        .dir_in(DIR_ZNEG),
        .flit_after_RC(flit_zneg_VA),
        .flit_valid_out(flit_zneg_VA_valid),
        .dir_out(flit_zneg_VA_route),
        .eject_enable(eject_zneg_valid)
    );
    assign eject_zneg = flit_zneg_VA;


    wire [VC_NUM - 1 : 0] VC_full_xpos;
    wire [VC_NUM - 1 : 0] VC_full_ypos;
    wire [VC_NUM - 1 : 0] VC_full_zpos;
    wire [VC_NUM - 1 : 0] VC_full_xneg;
    wire [VC_NUM - 1 : 0] VC_full_yneg;
    wire [VC_NUM - 1 : 0] VC_full_zneg;

    wire [VC_NUM - 1 : 0] VC_idle_xpos;
    wire [VC_NUM - 1 : 0] VC_idle_ypos;
    wire [VC_NUM - 1 : 0] VC_idle_zpos;
    wire [VC_NUM - 1 : 0] VC_idle_xneg;
    wire [VC_NUM - 1 : 0] VC_idle_ypos;
    wire [VC_NUM - 1 : 0] VC_idle_ypos;

    wire [VC_NUM - 1 : 0] VC_grant_xpos;
    wire [VC_NUM - 1 : 0] VC_grant_ypos;
    wire [VC_NUM - 1 : 0] VC_grant_zpos;
    wire [VC_NUM - 1 : 0] VC_grant_xneg;
    wire [VC_NUM - 1 : 0] VC_grant_ypos;
    wire [VC_NUM - 1 : 0] VC_grant_ypos;







    //instantiate VC allocators
    VC_allocator  VC_allocator_inst(
        .clk(clk),
        .rst(rst),
        .full_xpos(VC_full_xpos),
        .full_ypos(VC_full_ypos),
        .full_zpos(VC_full_zpos),
        .full_xneg(VC_full_xneg),
        .full_yneg(VC_full_yneg),
        .full_zneg(VC_full_zneg),
        .idle_xpos(VC_idle_xpos),
        .idle_ypos(VC_idle_ypos),
        .idle_zpos(VC_idle_zpos),
        .idle_xneg(VC_idle_xneg),
        .idle_yneg(VC_idle_yneg),
        .idle_zneg(VC_idle_zneg),
        .port_valid({flit_zneg_VA_valid, flit_yneg_VA_valid, flit_xneg_VA_valid, flit_zpos_VA_valid, flit_ypos_VA_valid, flit_xpos_VA_valid), //xpos 0th bit, ypos 1st bit, zpos 2nd bit, xneg 3rd bit, yneg 4th bit, zneg 5th bit
        .route_in_xpos(flit_xpos_VA_route),
        .route_in_ypos(flit_ypos_VA_route),
        .route_in_zpos(flit_zpos_VA_route),
        .route_in_xneg(flit_xneg_VA_route),
        .route_in_yneg(flit_yneg_VA_route),
        .route_in_zneg(flit_zneg_VA_route),
        .flit_xpos(flit_xpos_VA),
        .flit_ypos(flit_ypos_VA),
        .flit_zpos(flit_zpos_VA),
        .flit_xneg(flit_xneg_VA),
        .flit_yneg(flit_yneg_VA),
        .flit_zneg(flit_zneg_VA),
        .grant_xpos(VC_grant_xpos), // a one-hot coding grant
        .grant_ypos(VC_grant_ypos),
        .grant_zpos(VC_grant_zpos),
        .grant_xneg(VC_grant_xneg),
        .grant_yneg(VC_grant_yneg),
        .grant_zneg(VC_grant_zneg),
        .stall_xpos(VA_stall_xpos),
        .stall_ypos(VA_stall_ypos),
        .stall_zpos(VA_stall_zpos),
        .stall_xneg(VA_stall_xneg),
        .stall_yneg(VA_stall_yneg),
        .stall_zneg(VA_stall_zneg)
    );

    wire [VC_NUM * FLIT_SIZE - 1 : 0] flit_xpos_SA;
    wire [VC_NUM * FLIT_SIZE - 1 : 0] flit_ypos_SA;
    wire [VC_NUM * FLIT_SIZE - 1 : 0] flit_zpos_SA;
    wire [VC_NUM * FLIT_SIZE - 1 : 0] flit_xneg_SA;
    wire [VC_NUM * FLIT_SIZE - 1 : 0] flit_yneg_SA;
    wire [VC_NUM * FLIT_SIZE - 1 : 0] flit_zneg_SA;

    wire [VC_NUM - 1 : 0] flit_xpos_SA_valid;
    wire [VC_NUM - 1 : 0] flit_ypos_SA_valid;
    wire [VC_NUM - 1 : 0] flit_zpos_SA_valid;
    wire [VC_NUM - 1 : 0] flit_xneg_SA_valid;
    wire [VC_NUM - 1 : 0] flit_yneg_SA_valid;
    wire [VC_NUM - 1 : 0] flit_zneg_SA_valid;

    wire [VC_NUM - 1 : 0] flit_xpos_SA_grant;
    wire [VC_NUM - 1 : 0] flit_ypos_SA_grant;
    wire [VC_NUM - 1 : 0] flit_zpos_SA_grant;
    wire [VC_NUM - 1 : 0] flit_xneg_SA_grant;
    wire [VC_NUM - 1 : 0] flit_yneg_SA_grant;
    wire [VC_NUM - 1 : 0] flit_zneg_SA_grant;

    wire [VC_NUM * ROUTE_LEN - 1 : 0] flit_xpos_SA_route;
    wire [VC_NUM * ROUTE_LEN - 1 : 0] flit_ypos_SA_route;
    wire [VC_NUM * ROUTE_LEN - 1 : 0] flit_zpos_SA_route;
    wire [VC_NUM * ROUTE_LEN - 1 : 0] flit_xneg_SA_route;
    wire [VC_NUM * ROUTE_LEN - 1 : 0] flit_yneg_SA_route;
    wire [VC_NUM * ROUTE_LEN - 1 : 0] flit_zneg_SA_route;


    //instantiate VCs
    // xpos VCs
    genvar i;
    generate 
        for(i = 0; i < VC_NUM; i = i + 1) begin: xpos_VCs
            VC VC_inst(
                .clk(clk),
                .rst(rst),
                .G(),
                .R(flit_xpos_SA_route[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN]),
                .O(),
                .P(),
                .vc_full(vc_full_xpos[i]),
                .C(flit_xpos_SA_grant[i]),
                .flit_in(flit_xpos_VA),
                .valid_in(VA_grant_xpos[i]),
                .route_in(flit_xpos_VA_route),
                .grant(flit_xpos_SA_grant[i]),
                .flit_out(flit_xpos_SA[i * FLIT_SIZE + FLIT_SIZE - 1 : i * FLIT_SIZE]),
                .valid_out(flit_xpos_SA_valid[i]),
                .vc_idle(vc_idle_xpos[i])
            );
        end
    endgenerate
    

    //ypos VCs
    generate 
        for(i = 0; i < VC_NUM; i = i + 1) begin: ypos_VCs
            VC VC_inst(
                .clk(clk),
                .rst(rst),
                .G(),
                .R(flit_ypos_SA_route[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN]),
                .O(),
                .P(),
                .vc_full(vc_full_ypos[i]),
                .C(flit_ypos_SA_grant[i]),
                .flit_in(flit_ypos_VA),
                .valid_in(VA_grant_ypos[i]),
                .route_in(flit_ypos_VA_route),
                .grant(flit_ypos_SA_grant[i]),
                .flit_out(flit_ypos_SA[i * FLIT_SIZE + FLIT_SIZE - 1 : i * FLIT_SIZE]),
                .valid_out(flit_ypos_SA_valid[i]),
                .vc_idle(vc_idle_ypos[i])

            );
        end
    endgenerate    
    
   //zpos VCs 
    generate 
        for(i = 0; i < VC_NUM; i = i + 1) begin: zpos_VCs
            VC VC_inst(
                .clk(clk),
                .rst(rst),
                .G(),
                .R(flit_zpos_SA_route[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN]),
                .O(),
                .P(),
                .vc_full(vc_full_zpos[i]),
                .C(flit_zpos_SA_grant[i]),
                .flit_in(flit_zpos_VA),
                .valid_in(VA_grant_zpos[i]),
                .route_in(flit_zpos_VA_route),
                .grant(flit_zpos_SA_grant[i]),
                .flit_out(flit_zpos_SA[i * FLIT_SIZE + FLIT_SIZE - 1 : i * FLIT_SIZE]),
                .valid_out(flit_zpos_SA_valid[i]),
                .vc_idle(vc_idle_zpos[i])

            );
        end
    endgenerate

    generate 
        for(i = 0; i < VC_NUM; i = i + 1) begin: xneg_VCs
            VC VC_inst(
                .clk(clk),
                .rst(rst),
                .G(),
                .R(flit_xneg_SA_route[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN]),
                .O(),
                .P(),
                .vc_full(vc_full_xneg[i]),
                .C(flit_xneg_SA_grant[i]),
                .flit_in(flit_xneg_VA),
                .valid_in(VA_grant_xneg[i]),
                .route_in(flit_xneg_VA_route),
                .grant(flit_xneg_SA_grant[i]),
                .flit_out(flit_xneg_SA[i * FLIT_SIZE + FLIT_SIZE - 1 : i * FLIT_SIZE]),
                .valid_out(flit_xneg_SA_valid[i]),
                .vc_idle(vc_idle_xneg[i])

            );
        end
    endgenerate
 
    generate 
        for(i = 0; i < VC_NUM; i = i + 1) begin: yneg_VCs
            VC VC_inst(
                .clk(clk),
                .rst(rst),
                .G(),
                .R(flit_yneg_SA_route[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN]),
                .O(),
                .P(),
                .vc_full(vc_full_yneg[i]),
                .C(flit_yneg_SA_grant[i]),
                .flit_in(flit_yneg_VA),
                .valid_in(VA_grant_yneg[i]),
                .route_in(flit_yneg_VA_route),
                .grant(flit_yneg_SA_grant[i]),
                .flit_out(flit_yneg_SA[i * FLIT_SIZE + FLIT_SIZE - 1 : i * FLIT_SIZE]),
                .valid_out(flit_yneg_SA_valid[i]),
                .vc_idle(vc_idle_yneg[i])

            );
        end
    endgenerate 
    
    generate 
        for(i = 0; i < VC_NUM; i = i + 1) begin: zneg_VCs
            VC VC_inst(
                .clk(clk),
                .rst(rst),
                .G(),
                .R(flit_zneg_SA_route[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN]),
                .O(),
                .P(),
                .vc_full(vc_full_zneg[i]),
                .C(flit_zneg_SA_grant[i]),
                .flit_in(flit_zneg_VA),
                .valid_in(VA_grant_zneg[i]),
                .route_in(flit_zneg_VA_route),
                .grant(flit_zneg_SA_grant[i]),
                .flit_out(flit_zneg_SA[i * FLIT_SIZE + FLIT_SIZE - 1 : i * FLIT_SIZE]),
                .valid_out(flit_zneg_SA_valid[i]),
                .vc_idle(vc_idle_zneg[i])

            );
        end
    endgenerate

//instantiate switch

    wire [PORT_NUM - 1 : 0] flit_valid_ST;
    wire [FLIT_SIZE - 1 : 0] flit_xpos_ST;
    wire [FLIT_SIZE - 1 : 0] flit_ypos_ST;
    wire [FLIT_SIZE - 1 : 0] flit_zpos_ST;
    wire [FLIT_SIZE - 1 : 0] flit_xneg_ST;
    wire [FLIT_SIZE - 1 : 0] flit_yneg_ST;
    wire [FLIT_SIZE - 1 : 0] flit_zneg_ST;


    switch#(
        .M_IN(VC_NUM * PORT_NUM),
        .N_out(PORT_NUM)
    )sw_inst(
        .clk(clk),
        .rst(rst),
        .in({flit_zneg_SA, flit_yneg_SA, flit_xneg_SA, flit_zpos_SA, flit_ypos_SA, flit_xpos_SA}),
        .route_in({flit_zneg_SA_route, flit_yneg_SA_route, flit_xneg_SA_route, flit_zpos_SA_route, flit_ypos_SA_route, flit_xpos_SA_route}),
        .in_valid({flit_zneg_SA_valid, flit_yneg_SA_valid, flit_xneg_SA_valid, flit_zpos_SA_valid, flit_ypos_SA_valid, flit_xpos_SA_valid}),
        .in_avail({flit_zneg_SA_grant, flit_yneg_SA_grant, flit_xneg_SA_grant, flit_zpos_SA_grant, flit_ypos_SA_grant, flit_xpos_SA_grant}),
        
        .out_valid(),
        .out_avail(),
        .out()
    );



    endmodule
    
    

    

    
