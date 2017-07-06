#Purpose: Python scripts to generate the network.v to connect all the nodes and switches in the 3D torus
#Author: Jiayi Sheng
#Organization: CAAD lab @ Boston University
#Start date: Dec 20th 2015
#

import sys
import os
import getopt


def module_gen():
    module='''`include "para.sv"
    module network(
    input clk,
    input rst
);\n'''
    return module

def parameter_gen():
    parameter=""
    return parameter

def var_gen(xsize,ysize,zsize):
    var=""
    tag=""
    tmp=""
    tmp+="\treg[15:0] xpos_link_sum, xneg_link_sum, ypos_link_sum, yneg_link_sum, zpos_link_sum, zneg_link_sum;\n"
    tmp+="\treg[15:0] xpos_ClockwiseUtil_sum, xneg_ClockwiseUtil_sum, ypos_ClockwiseUtil_sum, yneg_ClockwiseUtil_sum, zpos_ClockwiseUtil_sum, zneg_ClockwiseUtil_sum;\n"
    tmp+="\treg[15:0] xpos_CounterClockwiseUtil_sum, xneg_CounterClockwiseUtil_sum, ypos_CounterClockwiseUtil_sum, yneg_CounterClockwiseUtil_sum, zpos_CounterClockwiseUtil_sum, zneg_CounterClockwiseUtil_sum;\n"
    tmp+="\treg[15:0] xpos_InjectUtil_sum, xneg_InjectUtil_sum, ypos_InjectUtil_sum, yneg_InjectUtil_sum, zpos_InjectUtil_sum, zneg_InjectUtil_sum;\n"
    tmp+="\treg[15:0] link_sum,Clockwise_sum,CounterClockwise_sum,Inject_sum,port_sum;\n"
    tmp+="\treg[15:0] counter, time_counter;\n"
    var+=tmp;
    for i in range(0,xsize):
        for j in range(0,ysize):
            for k in range(0,zsize):
                tag="_"+str(i)+"_"+str(j)+"_"+str(k)
                tmp="\twire[FLIT_SIZE : 0] in_xpos_ser"+tag+", out_xpos_ser"+tag+";\n"
                tmp+="\twire[FLIT_SIZE : 0] in_xneg_ser"+tag+", out_xneg_ser"+tag+";\n"
                tmp+="\twire[FLIT_SIZE : 0] in_ypos_ser"+tag+", out_ypos_ser"+tag+";\n"
                tmp+="\twire[FLIT_SIZE : 0] in_yneg_ser"+tag+", out_yneg_ser"+tag+";\n"
                tmp+="\twire[FLIT_SIZE : 0] in_zpos_ser"+tag+", out_zpos_ser"+tag+";\n"
                tmp+="\twire[FLIT_SIZE : 0] in_zneg_ser"+tag+", out_zneg_ser"+tag+";\n"

                tmp+="\twire[7:0] xpos_ClockwiseUtil"+tag+",xpos_CounterClockwiseUtil"+tag+",xpos_InjectUtil"+tag+";\n"
                tmp+="\twire[7:0] xneg_ClockwiseUtil"+tag+",xneg_CounterClockwiseUtil"+tag+",xneg_InjectUtil"+tag+";\n"
                tmp+="\twire[7:0] ypos_ClockwiseUtil"+tag+",ypos_CounterClockwiseUtil"+tag+",ypos_InjectUtil"+tag+";\n"
                tmp+="\twire[7:0] yneg_ClockwiseUtil"+tag+",yneg_CounterClockwiseUtil"+tag+",yneg_InjectUtil"+tag+";\n"
                tmp+="\twire[7:0] zpos_ClockwiseUtil"+tag+",zpos_CounterClockwiseUtil"+tag+",zpos_InjectUtil"+tag+";\n"
                tmp+="\twire[7:0] zneg_ClockwiseUtil"+tag+",zneg_CounterClockwiseUtil"+tag+",zneg_InjectUtil"+tag+";\n\n"

                var+=tmp
    return var




def assign_gen(xsize,ysize,zsize):
    assign=""
    tag0=""
    tag1=""
    tag2=""
    tmp=""
    for i in range(0,xsize):
        for j in range(0,ysize):
            for k in range(0,zsize):
                tag0="_"+str((i-1+xsize)%xsize)+"_"+str(j)+"_"+str(k)
                tag1="_"+str(i)+"_"+str(j)+"_"+str(k)
                tag2="_"+str((i+1)%xsize)+"_"+str(j)+"_"+str(k)
                tmp="\tassign in_xpos_ser"+tag1+"=out_xneg_ser"+tag2+";\n"
                tmp+="\tassign in_xneg_ser"+tag1+"=out_xpos_ser"+tag0+";\n"
                assign+=tmp

    for i in range(0,xsize):
        for j in range(0,ysize):
            for k in range(0,zsize):
                tag0="_"+str(i)+"_"+str((j-1+ysize)%ysize)+"_"+str(k)
                tag1="_"+str(i)+"_"+str(j)+"_"+str(k)
                tag2="_"+str(i)+"_"+str((j+1)%ysize)+"_"+str(k)
                tmp="\tassign in_ypos_ser"+tag1+"=out_yneg_ser"+tag2+";\n"
                tmp+="\tassign in_yneg_ser"+tag1+"=out_ypos_ser"+tag0+";\n"
                assign+=tmp

    for i in range(0,xsize):
        for j in range(0,ysize):
            for k in range(0,zsize):
                tag0="_"+str(i)+"_"+str(j)+"_"+str((k-1+zsize)%zsize)
                tag1="_"+str(i)+"_"+str(j)+"_"+str(k)
                tag2="_"+str(i)+"_"+str(j)+"_"+str((k+1)%zsize)
                tmp="\tassign in_zpos_ser"+tag1+"=out_zneg_ser"+tag2+";\n"
                tmp+="\tassign in_zneg_ser"+tag1+"=out_zpos_ser"+tag0+";\n"
                assign+=tmp
    return assign

def node_gen(xsize,ysize,zsize):
    node=""
    tag=""
    tmp=""
    for i in range(0,xsize):
        for j in range(0,ysize):
            for k in range(0,zsize):
                tag="_"+str(i)+"_"+str(j)+"_"+str(k)
                tmp='''    node#(
        .cur_x(3'd'''+str(i)+'''),
        .cur_y(3'd'''+str(j)+'''),
        .cur_z(3'd'''+str(k)+''')
        )'''
                tmp+="n"+tag+'''(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser'''+tag+'''),
        .out_xpos_ser(out_xpos_ser'''+tag+'''),
        .in_xneg_ser(in_xneg_ser'''+tag+'''),
        .out_xneg_ser(out_xneg_ser'''+tag+'''),
        .in_ypos_ser(in_ypos_ser'''+tag+'''),
        .out_ypos_ser(out_ypos_ser'''+tag+'''),
        .in_yneg_ser(in_yneg_ser'''+tag+'''),
        .out_yneg_ser(out_yneg_ser'''+tag+'''),
        .in_zpos_ser(in_zpos_ser'''+tag+'''),
        .out_zpos_ser(out_zpos_ser'''+tag+'''),
        .in_zneg_ser(in_zneg_ser'''+tag+'''),
        .out_zneg_ser(out_zneg_ser'''+tag+''')
      );\n'''
                node+=tmp
    return node



def network_gen(xsize,ysize,zsize):
    module=module_gen()
    paramter=parameter_gen()
    var=var_gen(xsize,ysize,zsize)
   # var_extra=var_extra_gen(size)
    assign=assign_gen(xsize,ysize,zsize)
    unit=node_gen(xsize,ysize,zsize)
    #profiling=profiling_gen(size)
    return module+paramter+var+assign+unit+"endmodule\n"

def usage():
    print ('''Usage: ./network -h (helper)
    ./network -x [xsize] -y [ysize] -z [zsize] denote the size of the 3D torus network default value=2''')


def main(argv):
    print(argv)
    try:
        opts,args=getopt.getopt(argv,"hx:y:z:",["help","xsize","ysize","zsize"])
    except getopt.GetoptError:
        usage()
        sys.exit(2);

    size=2
    print(opts)
    print(args)
    for opt,arg in opts:
        if opt in ("-h","--help"):
            usage()
            sys.exit()
        elif opt in("-x","--xsize"):
            xsize=int(arg)
            print(xsize)
        elif opt in("-y","--ysize"):
            ysize=int(arg)
            print(ysize)
        elif opt in("-z","--zsize"):
            zsize=int(arg)
            print(zsize)
    code=network_gen(xsize,ysize,zsize)
    f=open("..\HDL\\network.sv",'w')
    f.write(code)
    f.close()


if __name__=="__main__":
    main(sys.argv[1:])



