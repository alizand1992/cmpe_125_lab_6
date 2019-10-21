module regfile2_tb;
    reg clk;
    
    initial
    begin
        
    end

    always@(*)
        clk = #5 ~clk; 
    
endmodule
