`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module piano (
input wire clk,
input wire hush,
input wire [3:0] note,
output wire speaker
);

localparam  A4 = 113635;
localparam  Aq= 107257;
localparam  B= 101237;
localparam  C= 95555;
localparam  Cq= 90192;
localparam  D= 85130;
localparam  Dq= 80352;
localparam  E= 75842;
localparam  F= 71585;
localparam  Fq= 67568;
localparam  G= 63775;
localparam  Gq= 60196;
localparam  A5= 56817;
localparam  Aq5= 53628;
localparam  B5= 50618;
localparam  C5= 47777;

reg [16:0] counter=0;
reg [16:0] KEY=0;
reg clk_out=0;
reg reset=0;


always @ (posedge clk)
begin
case(note)
4'b0000:
        KEY = A4;
4'b0001:
        KEY = Aq;
4'b0010:
        KEY = B;
4'b0011:
        KEY = C;
4'b0100:
        KEY = Cq;
4'b0101:
        KEY = D;
4'b0110:
        KEY = Dq;
4'b0111:
        KEY = E;
4'b1000:
        KEY = F;
4'b1001:
        KEY = Fq;
4'b1010:
        KEY = G;
4'b1011:
        KEY = Gq;
4'b1100:
        KEY = A5;
4'b1101:
        KEY = Aq5;
4'b1110:
        KEY = B5;
4'b1111:
        KEY = C5;
default: KEY= A4;
endcase
end

///////////////////////////////////////////////////////
always @ (posedge clk)
begin      
    if (hush==1)
       counter <= counter + 0;
       
    else if (reset==0)
        counter <= counter+1;
    else
        counter =0;

end
//////////////////////////////////////
always @ (posedge clk)
begin
    if (counter == KEY)
        begin
            clk_out <= clk_out +1;
            reset <= 1;
        end
    else
        reset <= 0;
end///////////////////it`s for output signal
////////////////////////////////////
assign speaker = clk_out;

endmodule