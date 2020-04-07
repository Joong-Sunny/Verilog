`timescale 1ns / 1ps

module Color(
input [2:0] color,

output reg [2:0] santa,
output reg [2:0] intersection,
output reg [2:0] pedestrian
    );

       //color decoder start
  always @ (*)
    begin
    case(color)
    3'b000:                             //S1
        begin
        santa = 3'b010;
        intersection = 3'b100;
        pedestrian = 3'b100;
        end
    3'b001:
            begin
            santa = 3'b110;              //S2
            intersection = 3'b100;
            pedestrian = 3'b100;
            end
    3'b010:
        begin
        santa = 3'b100;
        intersection = 3'b010;               //S3
        pedestrian = 3'b100;
    end
    3'b011:
        begin
        santa = 3'b100;                  //S4
        intersection = 3'b110;
        pedestrian = 3'b100;
    end
    3'b100:
        begin                       //S5
        santa = 3'b100;
        intersection = 3'b010;
        pedestrian = 3'b010;
    end
    3'b101:
        begin
        santa = 3'b100;
        intersection = 3'b110;           //S6
        pedestrian = 3'b110;
    end
    3'b110:
        begin
        santa = 3'b100;                  //S7
        intersection = 3'b100;
        pedestrian = 3'b100;
    end
    3'b111:
        begin
        santa = 3'b100;
        intersection = 3'b100;               //S8
        pedestrian = 3'b100;
    end
    endcase
    
    end
    //color decoder end
    
    
endmodule
