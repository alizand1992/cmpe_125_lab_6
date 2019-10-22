module fifo_fpga(
    input clk100MHz, clk, rst, en, wnr,
    input [3:0] in,
    output full, empty,
    output [3:0] out
);

    wire db_clk, db_rst, DONT_USE, clk_5KHz;

    clk_gen CLK (
        .clk100MHz(clk100MHz),
        .rst(rst),
        .clk_4sec(DONT_USE),
        .clk_5KHz(clk_5KHz)
    );

    button_debouncer db1 (
        .clk(clk_5KHz),
        .button(clk),
        .debounced_button(db_clk)
    );

    button_debouncer db2 (
        .clk(clk_5KHz),
        .button(rst),
        .debounced_button(db_rst)
    );

    fifo f (
        .wnr(wnr), .en(en), .clk(db_clk),
        .rst(db_rst), .in(in), .full(full),
        .empty(empty), .out(out)
    );
endmodule
