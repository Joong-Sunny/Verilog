`timescale 1ns / 1ps

module LED(
input clk,
input [3:0] val3,
input [3:0] val2,
input [3:0] val1,
input [3:0] val0,

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

reg [15:0] clk_counter=0;
assign dp = 1'b1; // remember, it's active low
//////////////////////////////////////
//////////////////////////////////////
localparam [3:0] First = 4'b1110;
localparam [3:0] Second = 4'b1101;
localparam [3:0] Third = 4'b1111;
localparam [3:0] Fourth = 4'b0111;

reg [3:0] state = First;
reg[1:0] counter=0;

always @ (posedge clk)
    begin
        clk_counter <= clk_counter+1;
    end

always @ (posedge clk)
begin
    if (clk_counter==1)
        begin
            counter <= counter+1;
        end
end

always @ (*)
begin
    case(counter)
    0: state <= First;
    1: state<= Second;
    2: state<= Third;
    3: state <= Fourth;
    default: state <= First;
    endcase
end

assign an0 = state[0];
assign an1 = state[1];
assign an2 = state[2];
assign an3 = state[3];

//////anode is done///////////////
//let`s work with cathode////////
reg [3:0] Digit;
always @ (*)
begin
    case(counter)
    0: Digit <= val0;
    1: Digit <= val1;
    2: Digit <= val2;
    3: Digit <= val3;
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
10: gogo=7'b1111111;    //10is modified for Quiz 2
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

endmodule

