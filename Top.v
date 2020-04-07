`timescale 1ns / 1ps

module Top(
input wire emergency,
input wire [1:0] signal,
input wire clk,

output wire [2:0] santa,
output wire [2:0] intersection,
output wire [2:0] pedestrian,

output wire an3,
output wire an2,
output wire an1,
output wire an0,
output wire ca,
output wire cb,
output wire cc,
output wire cd,
output wire ce,
output wire cf,
output wire cg,
output wire dp
    );
  
wire [3:0] val0;
wire [3:0] val1;
wire [3:0] val2;
wire [3:0] val3;

wire [2:0] color;
wire [7:0] num;   
    
Core myCore(
.emergency(emergency),
.signal(signal),
.clk(clk),
.color(color),
.num(num) 
    );

NumDecoder myNumDecoder(
.num(num),
.clk(clk),
.val0(val0),
.val1(val1),
.val2(val2),
.val3(val3)
);

Color myColor(
.color(color),
.santa(santa),
.intersection(intersection),
.pedestrian(pedestrian)
);

LED myLED(
.clk(clk),
.val3(val3),
.val2(val2),
.val1(val1),
.val0(val0),
.an3(an3),
.an2(an2),
.an1(an1),
.an0(an0),
.ca(ca),
.cb(cb),
.cc(cc),
.cd(cd),
.ce(ce),
.cf(cf),
.cg(cg),
.dp(dp)
);  
  
    
endmodule
