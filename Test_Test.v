 `timescale 1 ns / 1 ps

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
output wire dp,
output reg [4:0] clk_counter
);

reg clk_counter = 0;
reg [1:0] count = 0;

always@(posedge clk)
    begin
        clk_counter <= clk_counter + 1;
    end

always@(posedge clk)
    begin
        if(clk_counter == 0)
            begin
                count <= count + 1;
            end
    end

reg [3:0] state;

always@(*)
    begin
        case(count)
            0: state = 4'b1110;
            1: state = 4'b1101;
            2: state = 4'b1011;
            3: state = 4'b0111;
            default: state = 4'bxxxx;
        endcase
    end
   
assign an3 = state[3];
assign an2 = state[2];
assign an1 = state[1];
assign an0 = state[0];


reg [3:0]val;

always@(*)
    begin
        case(count)
            0: val = val0;
            1: val = val1;
            2: val = val2;
            3: val = val3;
            default: val = 4'bxxxx;
        endcase
    end

reg [15:0] ssd;

always@(*)
begin
case(val)
0: ssd = 8'b1000_0001;
1: ssd = 8'b1100_1111;
2: ssd = 8'b1001_0010;
3: ssd = 8'b1000_0110;
4: ssd = 8'b1100_1100;
5: ssd = 8'b1010_0100;
6: ssd = 8'b1010_0000;
7: ssd = 8'b1000_1111;
8: ssd = 8'b1000_0000;
9: ssd = 8'b1000_0100;
10: ssd = 8'b1000_1000;
11: ssd = 8'b1110_0000;
12: ssd = 8'b1011_0001;
13: ssd = 8'b1100_0010;
14: ssd = 8'b1011_0000;
15: ssd = 8'b1011_1000;
default: ssd = 8'b1111_1110;
endcase
end

assign dp = ssd[7];
assign ca = ssd[6];
assign cb = ssd[5];
assign cc = ssd[4];
assign cd = ssd[3];
assign ce = ssd[2];
assign cf = ssd[1];
assign cg = ssd[0];

endmodule