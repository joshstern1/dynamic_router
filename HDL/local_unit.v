
`include "para.sv"


module local_unit
(
    input clk,
    input rst,
    input [FLIT_SIZE - 1 : 0] eject_xpos,
    input eject_xpos_valid,
    input [FLIT_SIZE - 1 : 0] eject_ypos,
    input eject_ypos_valid,
    input [FLIT_SIZE - 1 : 0] eject_zpos,
    input eject_zpos_valid,
    input [FLIT_SIZE - 1 : 0] eject_xneg,
    input eject_xneg_valid,
    input [FLIT_SIZE - 1 : 0] eject_yneg,
    input eject_yneg_valid,
    input [FLIT_SIZE - 1 : 0] eject_zneg,
    input eject_zneg_valid,

    output [FLIT_SIZE - 1 : 0] inject_xpos,
    output inject_xpos_valid,
    output [FLIT_SIZE - 1 : 0] inject_ypos,
    output inject_ypos_valid,
    output [FLIT_SIZE - 1 : 0] inject_zpos,
    output inject_zpos_valid,
    output [FLIT_SIZE - 1 : 0] inject_xneg,
    output inject_xneg_valid,
    output [FLIT_SIZE - 1 : 0] inject_yneg,
    output inject_yneg_valid,
    output [FLIT_SIZE - 1 : 0] inject_zneg,
    output inject_zneg_valid,
    input inject_xpos_avail,
    input inject_ypos_avail,
    input inject_zpos_avail,
    input inject_xneg_avail,
    input inject_yneg_avail,
    input inject_zneg_avail

);

    parameter injection_rate=10'd1; //injection rate means inject one packet per injection_rate cycles

    parameter packet_size = 16, //16 flit in one packet

    reg [9:0] injection_control_counter;


    wire local_fifo_full;
    wire local_fifo_empty;
    wire [DataWidth-1:0] local_fifo_out;
    wire [15:0] local_fifo_util;
    integer fd;
    wire [CoordWidth-1:0] XCoord;
    wire [CoordWidth-1:0] YCoord;
    wire [CoordWidth-1:0] ZCoord;
    reg [31:0] cycle_counter=0;

    reg [IndexWidth-1:0] packet_counter=0;
//routing table copy
    reg [RoutingTableWidth-1:0] routing_table[RoutingTablesize-1:0];
//data is register based 
//
    reg [DataWidth-1:0] eject_local_reg;    
    reg [DataWidth-1:0] eject_yneg_reg;
    reg [DataWidth-1:0] eject_ypos_reg;
    reg [DataWidth-1:0] eject_xpos_reg;
    reg [DataWidth-1:0] eject_xneg_reg;
    reg [DataWidth-1:0] eject_zpos_reg;
    reg [DataWidth-1:0] eject_zneg_reg;
    reg [DataWidth-1:0] eject_reduction_reg;

    always@(posedge clk) begin
        if(rst) begin
            injection_control_counter<=0;
        end
        else begin
            injection_control_counter<=(injection_control_counter==injection_rate-1)?0:injection_control_counter+1;
        end
    end



    always@(posedge clk) begin
        if(rst)
            cycle_counter<=0;
        else
            cycle_counter<=cycle_counter+1;
    end


`ifdef MULTICAST
    reg [DataWidth-1:0] data[DataSize-1:0];
    //all the data share the same path, so each data will use the same table entry
    reg [7:0] data_ptr;
    wire [15:0] table_ptr;

    assign inject_local=(injection_control_counter==0)?((data_ptr>=DataSize)?0:data[data_ptr]):0;
    assign inject_receive_local=inject_local[DataWidth-1];

    always@(posedge clk) begin
        if(rst) begin
            data_ptr<=0;
        end
        else if(InjectSlotAvail_local&&inject_receive_local) begin
            data_ptr<=data_ptr+1;
            fd=$fopen("dump.txt","a");
            if(fd)
                $display("file: dump.txt open successfully\n");
            else
                $display("file open failed\n");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("data from (%d, %d, %d) whose id #%d is injected into the network at cycle %d",XCoord,YCoord,ZCoord,data_ptr,cycle_counter);
            //format [src.x] [src.y] [src.z] [id] [time] [packet type]
            $fdisplay(fd,"Departuring: \n %d %d %d %d %d 9",XCoord,YCoord,ZCoord,data_ptr,cycle_counter);
            $fclose(fd);
        end
    end

    always@(posedge clk) begin
        eject_local_reg<=eject_local;
    end
            
    assign EjectSlotAvail_local=1;
    always@(posedge clk) begin
        if(eject_send_local && EjectSlotAvail_local) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_local_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_local_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_local_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_local_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_local[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_local[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_local[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_local[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end

    always@(posedge clk) begin
        eject_yneg_reg<=eject_yneg;
    end
    assign EjectSlotAvail_yneg=1;
    always@(posedge clk) begin
        if(eject_send_yneg && EjectSlotAvail_yneg) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_yneg_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_yneg_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_yneg_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_yneg_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_yneg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_yneg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_yneg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_yneg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_ypos_reg<=eject_ypos;
    end
    assign EjectSlotAvail_ypos=1;
    always@(posedge clk) begin
        if(eject_send_ypos && EjectSlotAvail_ypos) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_ypos_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_ypos_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_ypos_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_ypos_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_ypos[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_ypos[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_ypos[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_ypos[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_xpos_reg<=eject_xpos;
    end
    assign EjectSlotAvail_xpos=1;
    always@(posedge clk) begin
        if(eject_send_xpos && EjectSlotAvail_xpos) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_xpos_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xpos_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xpos_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_xpos_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_xpos[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xpos[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xpos[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_xpos[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_xneg_reg<=eject_xneg;
    end
    assign EjectSlotAvail_xneg=1;
    always@(posedge clk) begin
        if(eject_send_xneg && EjectSlotAvail_xneg) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_xneg_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xneg_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xneg_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_xneg_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_xneg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xneg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xneg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_xneg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_zpos_reg<=eject_zpos;
    end
    assign EjectSlotAvail_zpos=1;
    always@(posedge clk) begin
        if(eject_send_zpos && EjectSlotAvail_zpos) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_zpos_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zpos_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zpos_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_zpos_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_zpos[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zpos[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zpos[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_zpos[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_zneg_reg<=eject_zneg;
    end
    assign EjectSlotAvail_zneg=1;
    always@(posedge clk) begin
        if(eject_send_zneg && EjectSlotAvail_zneg) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("multicast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_zneg_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zneg_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zneg_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_yneg_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_zneg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zneg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zneg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_zneg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end


`endif

`ifdef REDUCTION
    //each packet has its own routing table entry
    reg [DataWidth-1:0] data[DataSize-1:0];
    //all the data share the same path, so each data will use the same table entry
    reg [15:0] data_ptr;
    wire [15:0] table_ptr;

    assign inject_local=(injection_control_counter==0)?((data_ptr>=DataSize)?0:data[data_ptr]):0;
    assign inject_receive_local=inject_local[DataWidth-1];
//    assign inject_local=(data_ptr>=DataSize)?0:data[data_ptr];
//    assign inject_receive_local=inject_local[DataWidth-1];
    always@(posedge clk) begin
        if(rst) begin
            data_ptr<=0;
        end
        else if(InjectSlotAvail_local&&inject_receive_local) begin
            data_ptr<=data_ptr+1;
            fd=$fopen("dump.txt","a");
            if(fd)
                $display("file: dump.txt open successfully\n");
            else
                $display("file open failed\n");
            $strobe("Displaying in %m\t");
            $strobe("reduction packet\t");
            $strobe("data from (%d, %d, %d) whose id #%d is injected into the network at cycle %d",XCoord,YCoord,ZCoord,inject_local[DstPacketIDPos+7:DstPacketIDPos],cycle_counter);
            //format [src.x] [src.y] [src.z] [dst id] [time] [packet type]
            $fdisplay(fd,"Departuring: \n %d %d %d %d %d 10",XCoord,YCoord,ZCoord,inject_local[DstPacketIDPos+7:DstPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
    always@(posedge clk) begin
        eject_reduction_reg<=eject_reduction;
    end
            
            
    assign EjectSlotAvail_local=1;
    always@(posedge clk) begin
        if(EjectSlotAvail_local && eject_reduction[DataWidth-1]) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("reduction packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_reduction_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_reduction_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_reduction_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_reduction_reg[DstPacketIDPos+7:DstPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [dst id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 10",eject_reduction[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_reduction[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_reduction[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_reduction[DstPacketIDPos+7:DstPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end


`endif
`ifdef SINGLECAST
    reg [DataWidth-1:0] data[DataSize-1:0];
    //all the data share the same path, so each data will use all the entry
    reg [7:0] data_ptr;
    reg [IndexWidth-1:0] table_index;


//    assign inject_receive_local=inject_local[DataWidth-1];

    assign inject_local=(data_ptr>=DataSize)?0:{data[data_ptr][DataWidth-1:IndexPos+IndexWidth],table_index,data[data_ptr][IndexPos-1:0]};
//    assign inject_local=(injection_control_counter==0)?((data_ptr>=DataSize)?0:data[data_ptr]):0;
        
    assign inject_receive_local=(injection_control_counter==0)?inject_local[DataWidth-1]:0;

    always@(posedge clk) begin
        if(rst) begin
            table_index<=0;
            data_ptr<=0;
        end
        else begin
            if(injection_control_counter==0) begin
                if(routing_table[table_index+1][RoutingTableWidth-1]&&inject_receive_local) begin
                    if(InjectSlotAvail_local) begin
                        table_index<=table_index+1;
                        data_ptr<=data_ptr;
                        fd=$fopen("dump.txt","a");
                        if(fd)
                            $display("file: dump.txt open successfully\n");
                        else
                            $display("file open failed\n");
                    $strobe("Displaying in %m\t");
                    $strobe("singlecast packet\t");
                    $strobe("data from (%d, %d, %d) whose id #%d is injected into the network at cycle %d",XCoord,YCoord,ZCoord,data_ptr,cycle_counter);
                    //format [src.x] [src.y] [src.z] [id] [time] [packet type]
                    $fdisplay(fd,"Departuring: \n %d %d %d %d %d 10",XCoord,YCoord,ZCoord,data_ptr,cycle_counter);
                    $fclose(fd);

                    end
                    else begin
                        table_index<=table_index;
                        data_ptr<=data_ptr;
                    end
                end
                else begin
                    table_index<=0;
                    if(data[data_ptr][DataWidth-1]) begin
                        data_ptr<=data_ptr+1;
                    end
                    else begin
                        data_ptr<=data_ptr;
                    end
                end
            end
            else begin
                data_ptr<=data_ptr;
                table_index<=table_index;
            end
        end    

    end
    assign EjectSlotAvail_local=1;
    always@(posedge clk) begin
        eject_local_reg<=eject_local;
    end
    always@(posedge clk) begin
        if(eject_send_local && EjectSlotAvail_local) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_local_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_local_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_local_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_local_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_local[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_local[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_local[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_local[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end

    always@(posedge clk) begin
        eject_yneg_reg<=eject_yneg;
    end
    assign EjectSlotAvail_yneg=1;
    always@(posedge clk) begin
        if(eject_send_yneg && EjectSlotAvail_yneg) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_yneg_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_yneg_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_yneg_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_yneg_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_yneg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_yneg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_yneg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_yneg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_ypos_reg<=eject_ypos;
    end
    assign EjectSlotAvail_ypos=1;
    always@(posedge clk) begin
        if(eject_send_ypos && EjectSlotAvail_ypos) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_ypos_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_ypos_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_ypos_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_ypos_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_ypos[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_ypos[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_ypos[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_ypos[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_xpos_reg<=eject_xpos;
    end
    assign EjectSlotAvail_xpos=1;
    always@(posedge clk) begin
        if(eject_send_xpos && EjectSlotAvail_xpos) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_xpos_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xpos_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xpos_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_xpos_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_xpos[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xpos[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xpos[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_xpos[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_xneg_reg<=eject_xneg;
    end
    assign EjectSlotAvail_xneg=1;
    always@(posedge clk) begin
        if(eject_send_xneg && EjectSlotAvail_xneg) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_xneg_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xneg_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xneg_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_xneg_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_xneg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_xneg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_xneg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_xneg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_zpos_reg<=eject_zpos;
    end
    assign EjectSlotAvail_zpos=1;
    always@(posedge clk) begin
        if(eject_send_zpos && EjectSlotAvail_zpos) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_zpos_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zpos_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zpos_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_zpos_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_zpos[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zpos[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zpos[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_zpos[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end
 
    always@(posedge clk) begin
        eject_zneg_reg<=eject_zneg;
    end
    assign EjectSlotAvail_zneg=1;
    always@(posedge clk) begin
        if(eject_send_zneg && EjectSlotAvail_zneg) begin
            fd=$fopen("dump.txt","a");
            $strobe("Displaying in %m\t");
            $strobe("singlecast packet\t");
            $strobe("packet arrives from (%d,%d,%d) whose id is %d at cycle #%d\n",eject_zneg_reg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zneg_reg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zneg_reg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],eject_yneg_reg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fdisplay(fd,"Arriving\t");
            //format [src.x] [src.y] [src.z] [dst.x] [dst.y] [dst.z] [id] [time] [packet type]
            $fdisplay(fd,"%d %d %d %d %d %d %d %d 9",eject_zneg[SrcXCoordPos+CoordWidth-1:SrcXCoordPos],eject_zneg[SrcYCoordPos+CoordWidth-1:SrcYCoordPos],eject_zneg[SrcZCoordPos+CoordWidth-1:SrcZCoordPos],X,Y,Z,eject_zneg[SrcPacketIDPos+7:SrcPacketIDPos],cycle_counter);
            $fclose(fd);
        end
    end



    
`endif


    
    assign XCoord=X;
    assign YCoord=Y;
    assign ZCoord=Z;
            
                
endmodule

    

	 

    
    
