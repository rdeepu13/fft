module dit_fft_8(x0r,x1r,x2r,x3r,x4r,x5r,x6r,x7r,x0i,x1i,x2i,x3i,x4i,x5i,x6i,x7i,y0r,y1r,y2r,y3r,y4r,y5r,y6r,y7r,y0i,y1i,y2i,y3i,y4i,y5i,y6i,y7i);

output wire [31:0] y0r,y1r,y2r,y3r,y4r,y5r,y6r,y7r,y0i,y1i,y2i,y3i,y4i,y5i,y6i,y7i;
wire [31:0] x20r,x20i,x21r,x21i,x22r,x22i,x23r,x23i,x24r,x24i,x25r,x25i,x26r,x26i,x27r,x27i;
wire [31:0] x10r,x10i,x11r,x11i,x12r,x12i,x13r,x13i,x14r,x14i,x15r,x15i,x16r,x16i,x17r,x17i;
input wire [31:0] x0r,x1r,x2r,x3r,x4r,x5r,x6r,x7r,x0i,x1i,x2i,x3i,x4i,x5i,x6i,x7i;

parameter w0r=32'h3f800000;//1
parameter w0i=32'h00000000;//0
parameter w1r=32'h3f34fdf4;//0.707=0.10110101
parameter w1i=32'hbf34fdf4;//-0.707=1.01001011
parameter w2r=32'h00000000;//0
parameter w2i=32'hbf800000;//-1
parameter w3r=32'hbf34fdf4;//-0.707=1.01001011
parameter w3i=32'hbf34fdf4;//-0.707=1.01001011

/*
assign x0r=32'h3f800000;
assign x1r=32'h3f800000;
assign x2r=32'h3f800000;
assign x3r=32'h3f800000;
assign x4r=32'h3f800000;
assign x5r=32'h3f800000;
assign x6r=32'h3f800000;
assign x7r=32'h3f800000;
assign x0i=32'h00000000;
assign x1i=32'h00000000;
assign x2i=32'h00000000;
assign x3i=32'h00000000;
assign x4i=32'h00000000;
assign x5i=32'h00000000;
assign x6i=32'h00000000;
assign x7i=32'h00000000;
*/
//stage1
bfly4_4 s11(x0r,x0i,x4r,x4i,w0r,w0i,x10r,x10i,x11r,x11i);
bfly4_4 s12(x2r,x2i,x6r,x6i,w0r,w0i,x12r,x12i,x13r,x13i);
bfly4_4 s13(x1r,x1i,x5r,x5i,w0r,w0i,x14r,x14i,x15r,x15i);
bfly4_4 s14(x3r,x3i,x7r,x7i,w0r,w0i,x16r,x16i,x17r,x17i);
//stage2
bfly4_4 s21(x10r,x10i,x12r,x12i,w0r,w0i,x20r,x20i,x22r,x22i);
bfly4_4 s22(x11r,x11i,x13r,x13i,w2r,w2i,x21r,x21i,x23r,x23i);
bfly4_4 s23(x14r,x14i,x16r,x16i,w0r,w0i,x24r,x24i,x26r,x26i);
bfly4_4 s24(x15r,x15i,x17r,x17i,w2r,w2i,x25r,x25i,x27r,x27i);
//stage3
bfly4_4 s31(x20r,x20i,x24r,x24i,w0r,w0i,y0r,y0i,y4r,y4i);
bfly4_4 s32(x21r,x21i,x25r,x25i,w1r,w1i,y1r,y1i,y5r,y5i);
bfly4_4 s33(x22r,x22i,x26r,x26i,w2r,w2i,y2r,y2i,y6r,y6i);
bfly4_4 s34(x23r,x23i,x27r,x27i,w3r,w3i,y3r,y3i,y7r,y7i);
endmodule

module bfly4_4(xr,xi,yr,yi,wr,wi,x0r,x0i,x1r,x1i); 
input signed [31:0]xr,xi,yr,yi;
input signed [31:0]wr,wi;
output [31:0] x0r,x0i,x1r,x1i;
wire [31:0] p1,p2,p3,p4;
wire [31:0] tmp1,tmp2,tmp3,tmp4;

multiplication m1(wr,yr,p1);
multiplication m2(wi,yi,p2);
multiplication m3(wr,yi,p3);
multiplication m4(wi,yr,p4);

Addition_Subtraction t1(p1,p2,1,tmp1);
Addition_Subtraction t2(tmp1,xr,0,x0r);

Addition_Subtraction t3(p3,p4,0,tmp2);
Addition_Subtraction t4(tmp2,xi,0,x0i);

Addition_Subtraction t5(xr,tmp1,1,x1r);
Addition_Subtraction t6(xi,tmp2,1,x1i);

endmodule