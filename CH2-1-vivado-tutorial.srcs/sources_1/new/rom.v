`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2019/10/14 12:00:02
// Design Name:
// Module Name: rom
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


module rom(
           input wire ce,
           input wire[5:0] addr,
           output reg[31:0] inst
       );
reg[31:0] rom[63:0];    // use 2-D vector to define register heap
// every register is 32 bit long.

initial begin
    $readmemh ("rom.data", rom);
    // rom[1] = 32'h01010101;
    $display("%x\n",rom[1]);
end


always @(*) begin       // execute if any input signal change.
    if (ce == 1'b0) begin   // if disabled, output 0
        inst <= 32'h0;
    end
    else begin      // else rom[addr]
        inst <= rom[addr];
    end
end
endmodule
