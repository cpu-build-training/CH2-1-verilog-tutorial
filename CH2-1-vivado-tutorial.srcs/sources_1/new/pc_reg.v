`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2019/10/14 12:00:02
// Design Name:
// Module Name: pc_reg
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module pc_reg(
           input wire clk, wire rst,
           output reg[5:0]  pc, reg ce
       );

always @(posedge clk) begin // activated at postive edge
    if (rst == 1'b1) begin  // if rst is true, then disable ce
        ce <= 1'b0;
    end else begin
        ce <= 1'b1;         // if rst is false, enable ce
    end
end

always @(posedge clk) begin
    if (ce == 1'b0) begin   // if ce is not enable, keep pc to zero
        pc <= 6'h00;
    end
    else begin          // else let it accumulate 1 every posedge
        pc <= pc + 1'b1;
    end
end

endmodule
