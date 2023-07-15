`timescale 1ps/1ps
module fifo_tb ();
    reg reset,clk,w_en,r_en;
    reg [7:0]data_in;
    wire [7:0]data_out;
    wire full,empty,halffull;

    sync_fifo u1(
        .clk(clk),
        .reset(reset),
        .w_enable(w_en),
        .r_enable(r_en),
        .w_data(data_in),
        .full(full),
        .empty(empty),
        .r_data(data_out)
    );
    initial begin
        reset=0;
        clk=0;
        #1 reset=1;
        #5 reset=0;
    end

    always #20 clk=~clk;

    initial begin
        w_en=0;
        #1 w_en=1;
    end

    initial begin
        r_en=0;
        #650 r_en=1;
            w_en=0;
    end

    initial begin
        data_in=8'h0;
    #40 data_in=8'h1;
    #40 data_in=8'h2; 
    #40 data_in=8'h3; 
    #40 data_in=8'h4; 
    #40 data_in=8'h5; 
    #40 data_in=8'h6; 
    #40 data_in=8'h7; 
    #40 data_in=8'h8; 
    #40 data_in=8'h9; 
    #40 data_in=8'ha; 
    #40 data_in=8'hb; 
    #40 data_in=8'hc; 
    #40 data_in=8'hd; 
    #40 data_in=8'he; 
    #40 data_in=8'hf;
    #750 $finish;    
    end

    initial begin
        $vcdpluson;
    end

    initial begin
    $fsdbDumpfile("tb.fsdb");
    $fsdbDumpvars(0,"fifo_tb");
    end
endmodule