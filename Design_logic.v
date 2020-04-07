// File: quad_seven_seg.v
// This is the top level design for EE178 Lab #2.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 100 ns / 100 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module quad_seven_seg (
input wire clk,
input wire [3:0] val3,
input wire [3:0] val2,
input wire [3:0] val1,
input wire [3:0] val0,
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
assign dp = 1'b1; // remember, it's active low
//////////////////////////////////////
//////////////////////////////////////
localparam [1:0] First = 2'b00;
localparam [1:0] Second = 2'b01;
localparam [1:0] Third = 2'b10;
localparam [1:0] Fourth = 2'b11;

reg [1:0] state = First;

reg[1:0] counter;
reg[15:0] clk_counter;

always @ (posedge clk)
begin
clk_counter <= clk_counter+1;
end

always @ (posedge clk)
begin
if (clk_counter==0)
begin
counter <= counter+1;
end
end

always @ (posedge clk)
begin
    case(counter)
    First: state <= Second;
    Second: state<= Third;
    Third: state<= Fourth;
    Fourth: state <= First;
    default: state <= First;
    endcase
end



assign an0 = (state[1:0] == 2'b00) ? 0: 1 ;
assign an1 = (state[1:0] == 2'b01) ? 0: 1 ;
assign an2 = (state[1:0] == 2'b10) ? 0: 1 ;
assign an3 = (state[1:0] == 2'b11) ? 0: 1 ;



//////anode is done///////////////
//let`s work with cathode////////
reg [3:0] Digit;
always @ (state)
begin
    case(state)
    First: Digit    <= val0;
    Second: Digit   <= val1;
    Third: Digit    <= val2;
    Fourth: Digit   <= val3;
    default: Digit  <= val0;
    endcase
end

reg [6:0] gogo;

always @ (*)
begin
case(Digit)
0: gogo=7'b0000001;
1: gogo=7'b1001111;
2: gogo=7'b0010010;
3: gogo=7'b0000110;
4: gogo=7'b1001100;
5: gogo=7'b0100100;
6: gogo=7'b1100000;
7: gogo=7'b0001101;
8: gogo=7'b0000000;
9: gogo=7'b0001100;
10: gogo=7'b0001000;
11: gogo=7'b1100000;
12: gogo=7'b0110001;
13: gogo=7'b1000010;
14: gogo=7'b0110000;
15: gogo=7'b0111000;
default: gogo=7'b0000001;
endcase
end

assign ca = gogo[6];
assign cb = gogo[5];
assign cc = gogo[4];
assign cd = gogo[3];
assign ce = gogo[2];
assign cf = gogo[1];
assign cg = gogo[0];




//assign ca = (Digit[3:0] == 4'b0001)||(Digit[3:0] == 4'b0100)||(Digit[3:0] == 4'b0110) ;
//assign cb = (Digit[3:0] == 4'b0101)||(Digit[3:0] == 4'b0110) ;
//assign cc = Digit[3:0] == 4'b0010;
//assign cd = (Digit[3:0] == 4'b0001)||(Digit[3:0] == 4'b0100)||(Digit[3:0] == 4'b0111)||(Digit[3:0] == 4'b1001) ;
//assign ce = (Digit[3:0] == 4'b0001)||(Digit[3:0] == 4'b0011)||(Digit[3:0] == 4'b0100)||(Digit[3:0] == 4'b0101)||(Digit[3:0] == 4'b0111)||(Digit[3:0] == 4'b1001) ;
//assign cf = (Digit[3:0] == 4'b0001)||(Digit[3:0] == 4'b0010)||(Digit[3:0] == 4'b0101) ;
//assign cg = (Digit[3:0] == 4'b0000)||(Digit[3:0] == 4'b0001) ;

////////////////////////////////////


endmodule