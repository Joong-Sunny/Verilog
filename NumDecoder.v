`timescale 1ns / 1ps

module NumDecoder(
input [7:0] num,
input clk,

output reg [3:0] val0,
output reg [3:0] val1,
output reg [3:0] val2,
output reg [3:0] val3
    );
    
always @ (posedge clk)
begin
if (num >= 180)
begin
    val3 <=  3;
    if (num >= 230)
        begin
        val1 <= 5;
        val0 <= num-230;
        end
    else if (num >= 220)
        begin
        val1 <= 4;
        val0 <= num-220;
        end
    else if (num >= 210)
        begin
        val1 <= 3;
        val0 <= num-210;
        end
    else if (num >= 200)
        begin
        val1 <= 2;
        val0 <= num-200;
        end
    else if (num >= 190)
        begin
        val1 <= 1;
        val0 <= num-190;
        end
    else
    begin
        val1 <= 0;
        val0 <= num-180;
    end 
end
/////////////2min///////////////////////////////////
else if (num >= 120)
begin
    val3 <=  2;
    if (num >= 170)
        begin
        val1 <= 5;
        val0 <= num-170;
        end
    else if (num >= 160)
        begin
        val1 <= 4;
        val0 <= num-160;
        end
    else if (num >= 150)
        begin
        val1 <= 3;
        val0 <= num-150;
        end
    else if (num >= 140)
        begin
        val1 <= 2;
        val0 <= num-140;
        end
    else if (num >= 130)
        begin
        val1 <= 1;
        val0 <= num-130;
        end
    else
    begin
        val1 <= 0;
        val0 <= num-120;
    end

end
else if (num >= 60)
begin
    val3 <=  1;
    if (num >= 110)
        begin
        val1 <= 5;
        val0 <= num-110;
        end
    else if (num >= 100)
        begin
        val1 <= 4;
        val0 <= num-100;
        end
    else if (num >= 90)
        begin
        val1 <= 3;
        val0 <= num-90;
        end
    else if (num >= 80)
        begin
        val1 <= 2;
        val0 <= num-80;
        end
    else if (num >= 70)
        begin
        val1 <= 1;
        val0 <= num-70;
        end
    else
        begin
        val1 <= 0;
        val0 <= num-60;
        end
end
else
begin
    val3 <=  0;
    if (num >= 50)
        begin
        val1 <= 5;
        val0 <= num-50;
        end
    else if (num >= 40)
        begin
        val1 <= 4;
        val0 <= num-40;
        end
    else if (num >= 30)
        begin
        val1 <= 3;
        val0 <= num-30;
        end
    else if (num >= 20)
        begin
        val1 <= 2;
        val0 <= num-20;
        end
    else if (num >= 10)
        begin
        val1 <= 1;
        val0 <= num-10;
        end
    else
        begin
        val1 <= 0;
        val0 <= num;
        end
end
end       
endmodule
