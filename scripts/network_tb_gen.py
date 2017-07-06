
import sys
import os
import getopt


def module_gen():
    module='''`include "para.sv"\n module network_tb;\n'''
    return module

def parameter_gen():
    parameter='''\n
\n '''
    return parameter

def var_gen(xsize,ysize,zsize):
    var="\treg clk,rst;\n\n"
    return var

def always_gen(xsize,ysize,zsize):
    always="\talways #5 clk=~clk;\n\n"
    return always

def unit_gen(xsize,ysize,zsize):
    node='''\tnetwork    net0(clk,rst);\n'''
    return node

def initial_gen(xsize,ysize,zsize):
    initial=""
    tag=""
    tmp=""

    initial+=tmp
    initial+='''	initial begin
		clk=0;
		rst=1;

		#100 rst=0;
	end\n'''
    return initial






def network_gen(xsize,ysize,zsize):
    module=module_gen()
    paramter=parameter_gen()
    var=var_gen(xsize,ysize,zsize)
    always=always_gen(xsize,ysize,zsize)
    unit=unit_gen(xsize,ysize,zsize)
    initial=initial_gen(xsize,ysize,zsize)
    return module+paramter+var+always+unit+initial+"endmodule\n"

def usage():
    print ('''Usage: ./network_tb.py -h (helper)
    ./network_tb.py -s [size] denote the size of the 3D torus network default value=2''')


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
    f=open("..\HDL\\network_tb.sv",'w')
    f.write(code)
    f.close()


if __name__=="__main__":
    main(sys.argv[1:])



