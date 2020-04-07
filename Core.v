`timescale 1ns / 1ps


module Core(
input emergency,
input [1:0] signal,
input clk,

output reg[7:0] num,
output reg[2:0] color
    );

reg [2:0] next_state =0;
reg [2:0] state=0;

localparam [2:0] S1 = 3'b001;
localparam [2:0] S2 = 3'b010;
localparam [2:0] S3 = 3'b011;
localparam [2:0] S4 = 3'b100;
localparam [2:0] S5 = 3'b101;
localparam [2:0] S6 = 3'b110;
localparam [2:0] S7 = 3'b111;
localparam [2:0] S8 = 3'b000;
    
    localparam [7:0] one_sec = 8'b00000010;
    localparam [7:0] thirty_sec = 8'b00011110;
    localparam [7:0] two_min = 8'b01111000;
    localparam [7:0] four_min = 8'b11110000;

reg index=1;
reg [21:0] clk_counter =0;
reg counter=0;

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
/////////////////////now...logic start////////////////
always @(posedge clk)   /////
begin                   /////
if(emergency==1)        ////
state <=S7;             ////
else                    ////
state <=  next_state;   ////
end                     ////
/////////////////////////////////////complex logic below
always @(posedge counter)
begin
case(state)
S1:
begin
if ((signal==0)&(emergency==0))
    next_state=S1;
else if (index==1)
    begin
    num=thirty_sec;
    index=0;
    end
else
    if(num==0)
        begin
        next_state=S2;
        index=1;
    end
    else
    num=num-1;
end
S2:
begin
if (index==1)
    begin
    num=thirty_sec;
    index=0;
    end
else
    if(num==0)
        begin
        next_state=S7;
        index=1;
        end
    else
        num=num-1; 
end
S3:
begin
    if(index==1)
        begin
        num=two_min;
        index=0;
        end
    else
        if(num==0)
            begin
            next_state=S4;
            index=1;
            end
        else
            num=num-1;
end
S4:
begin
    if(index==1)
        begin
        num=thirty_sec;
        index=0;
        end
    else
        if(num==0)
            begin
            next_state=S8;
            index=1;
            end
        else
            num=num-1;
end
S5:
begin
    if(index==1)
        begin
        num=four_min;
        index=0;
        end
    else
        if(num==0)
            begin
            next_state=S6;
            index=1;
            end
        else
            num=num-1;
end
S6:

begin
    if(index==1)
        begin
        num=thirty_sec;
        index=0;
        end
    else
        if(num==0)
            begin
            next_state=S8;
            index=1;
            end
        else
            num=num-1;
end
S7:
begin
    if(emergency==1)
        begin
        next_state=S3;
        index=1;
        end
    else if(signal==2'b10)
        begin
        next_state=S3;
        index=1;
        end
    else
        next_state=S5;
end
S8:
begin
    next_state=S1;
    index=1;
end
endcase
end
////////////////////////////////////////////////////color blow
always @ (*)
begin
case (state)                 //what color start
S1:
color = 3'b000;
S2:
color = 3'b001;
S3:                 
color = 3'b010;
S4:
color = 3'b011;
S5:
color = 3'b100;
S6:
color = 3'b101;
S7:
color = 3'b110;
S8:
color = 3'b111;
default:
color = 3'b111;          //What corlor end
endcase
end
    
endmodule
