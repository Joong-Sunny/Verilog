`timescale 1 ns / 1 ps

module two_input_xor (
input wire in1,     //same as LAB1
input wire in2,     //same as LAB1
input wire clk,             //added code
output wire out     //same as LAB1
);

assign out = in1 ^ in2;     //same as LAB 1

//added code below
reg [1:0] state;            //declare two bit
always begin@(posedge clk)  //positive edge trigger
state = state+1;            //state becomes plus 1, (0,1,2,3,0,1,2,3....)
end

endmodule