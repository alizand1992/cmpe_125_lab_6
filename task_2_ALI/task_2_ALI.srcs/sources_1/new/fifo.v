module fifo(
    input wnr, en, clk, rst,
    input [3:0] in,
    output reg full, empty,
    output reg [3:0] out
);

    reg [3:0] queue [7:0];
    reg [3:0] size;
    reg [3:0] head;
    
    always@(posedge clk)
    begin
        if (rst) 
        begin
            size = 0;
            head = 0;
            full = 0;
            empty = 1;
        end
            
        if (en) 
        begin
            if (wnr == 0)  // READ
            begin
                if (empty != 1) 
                begin
                    out = queue[head];
                    head = (head + 1) % 8;
                    size = size - 1;
                    
                    if (size < 8)
                        full = 0;
                    if (size == 0)
                        empty = 1;
                end
            end
            else           // WRITE
            begin
                if (full != 1) 
                begin
                    queue[(head + size) % 8] = in;
                    
                    size = size + 1;
                    if (size == 8)
                    begin 
                        full = 1;
                    end
                    if (size != 0) 
                        empty = 0;
                end
            end
        end
    end    
endmodule
