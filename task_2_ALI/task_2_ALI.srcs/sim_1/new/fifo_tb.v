module fifo_tb;
    reg wnr, en, clk, rst;
    reg [3:0] in;

    wire full, empty;    
    wire [3:0] out;

    integer i;

    fifo DUT (
        .wnr(wnr), .en(en), .clk(clk), .rst(rst),
        .in(in), .full(full), .empty(empty), .out(out)
    );
    
    initial
    begin
        clk = 1;
        wnr = 0;
        rst = 1;
        #2;
        rst = 0;
        
        // Test Enable off
        en = 0;
        #2;
        
        // Test Enable On
        en = 1;
        wnr = 1;
        for (i = 0; i < 9; i = i + 1) 
        begin
            in = i;
            #2;
        end 


        // READ
        wnr = 0;        
        for (i = 0; i < 9; i = i + 1) 
        begin
            #2;
        end
        
        // WRITE
        wnr = 1;
        for (i = 0; i < 9; i = i + 1) 
        begin
            in = i;
            #2;
        end 


        // READ
        wnr = 0;        
        for (i = 0; i < 9; i = i + 1) 
        begin
            #2;
        end
        
        
        // WRITE
        wnr = 1;
        for (i = 0; i < 5; i = i + 1) 
        begin
            in = i;
            #2;
        end 

        // READ
        wnr = 0;        
        for (i = 0; i < 3; i = i + 1) 
        begin
            #2;
        end
        
        // WRITE
        wnr = 1;
        for (i = 0; i < 5; i = i + 1) 
        begin
            in = i;
            #2;
        end
         
        // READ
        wnr = 0;        
        for (i = 0; i < 8; i = i + 1) 
        begin
            #2;
        end        
        $finish;
    end
    
    always
        clk = #1 ~clk;
endmodule
