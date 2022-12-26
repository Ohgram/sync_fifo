module my_dp_ram (
    input   r_clk,
            r_enable,
            r_addr,
            w_clk,
            w_enable,
            w_addr,
            w_data,
    output  r_data
);
    localparam DATA_WIDTH =8;
    localparam DATA_DIPTH =512;
    localparam ADDR_WIDTH =9;// [7:0]dp_ram[0:8]
    wire [ADDR_WIDTH-1:0]    r_addr;
    wire [ADDR_WIDTH-1:0]    w_addr;
    wire [DATA_WIDTH-1:0]    w_data;
    reg  [DATA_WIDTH-1:0]    r_data;
    reg [DATA_WIDTH-1:0]memo[DATA_DIPTH-1:0];//addr=2^9=512

    always @(posedge w_clk) begin
        if (w_enable) begin
            memo[w_addr]<=w_data;
        end
    end
    always @(posedge r_clk) begin
        if (r_enable) begin
            r_data<=memo[r_addr];
        end
    end

endmodule