module sync_fifo(
    clk,
    reset,
    w_enable,
    r_enable,
    w_data,
    r_data

);
    input clk,reset,w_enable,r_enable;
    input w_data;
    output wire r_data;
endmodule