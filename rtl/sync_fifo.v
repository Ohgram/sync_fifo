module sync_fifo(
    clk,
    reset,
    w_enable,
    r_enable,
    w_data,
    full,
    empty,
    r_data

);
    input clk,reset,w_enable,r_enable;
    input [7:0]w_data;
    output wire full,empty;
    output reg [7:0]r_data;
    reg [7:0]memo[15:0];//16*8RAM
    reg [4:0]w_addr,r_addr;//not [7+1:0] should=log2(16)
    //empty assign should be used to shift the clock left by one cycle
    // always @(posedge clk or posedge reset) begin
    //     if(reset)
    //         empty<=1'b1;
    //     else if(w_addr==r_addr)
    //         empty<=1'b1;
    //         else
    //         empty<=1'b0;
    // end
    //full assign should be used to shift the clock left by one cycle
    // always @(posedge clk or posedge reset) begin
    //     if(reset)
    //         full<=1'b0;
    //     else if((w_addr[3:0]==r_addr[3:0])&&(w_addr[4]!=r_addr))
    //         full<=1'b1;
    //         else
    //         full<=1'b0;
    // end

    //empty
    assign empty=(w_addr==r_addr);
    assign full=(w_addr[3:0]==r_addr[3:0])&&(w_addr[4]!=r_addr);
    //w_addr
    always @(posedge clk or posedge reset) begin
        if(reset)
            w_addr<=9'b0;
        else if(w_enable&&!full)
            w_addr<=w_addr+1'b1;
            else
            w_addr<=w_addr;
    end
    //r_addr
    always @(posedge clk or reset) begin
        if(reset)
            r_addr<=9'b0;
        else if(r_enable&&!empty)
            r_addr<=r_addr+1'b1;
            else
            r_addr<=r_addr;
    end
    //data
    always @(posedge clk) begin
        if(w_enable&&!full)
            memo[w_addr]<=w_data;
        else if(r_enable&&!empty)
            r_data<=memo[r_addr];
    end
endmodule