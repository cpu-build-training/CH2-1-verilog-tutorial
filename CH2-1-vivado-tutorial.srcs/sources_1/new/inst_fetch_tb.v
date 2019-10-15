module inst_fetch_tb;

// define the data structure

reg CLOCK; // Excitation Signal
reg rst;   // Excitation Signal
wire [31:0]inst; // output


// initial data
// 定义 CLOCK 信号，每个 10 个时间单位，CLOCK 的值翻转，由此得到一个周期信号。
// 在仿真的时候，一个时间单位默认是 1ns，所以 CLOCK 的值每 10ns 翻转一次，对应
// 就是 50MHz 的始终
initial begin
    CLOCK = 1'b0;
    forever begin
        #10 CLOCK = ~CLOCK;
    end
end


// 定义 rst 信号，最开始为 1，表示复位信号有效，过了 195 个时间单位，即195ns
// 设置 rst 信号的职位 0，复位信号无效，复位结束，在运行1000ns，暂停仿真
initial begin
    rst = 1'b1;
    #195 rst = 0'b0; // 原书在此处有误
    #1000 $stop;
end

// instantiate

inst_fetch inst_fetch0(
               .clk(CLOCK),
               .rst(rst),
               .inst_out(inst)
           );


endmodule // inst_fetch_tb
