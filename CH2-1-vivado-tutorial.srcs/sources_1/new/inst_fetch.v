module inst_fetch(
    input wire clk, wire rst,
    output wire[31:0] inst_out
);
    wire[5:0] pc;
    wire rom_ce;

    // PC mod
    pc_reg pc_reg0(.clk(clk), .rst(rst), .pc(pc), .ce(rom_ce));

    // rem mod
    rom rom0(.ce(rom_ce), .addr(pc), .inst(inst_out));

endmodule // inst_fetch