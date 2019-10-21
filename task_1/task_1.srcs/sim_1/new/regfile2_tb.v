module regfile2_tb;
    reg clk, we1, we2;
    reg [4:0] ra1, ra2, wa1, wa2;
    reg [31:0] wd1, wd2;
    wire [31:0] rd1, rd2;
    
    integer value, i;

    regfile2 DUT(
        .clk(clk), .ra1(ra1), .ra2(ra2), .wa1(wa1), 
        .wa2(wa2), .rd1(rd1), .rd2(rd2), .wd1(wd1), 
        .wd2(wd2), .we1(we1), .we2(we2));
    
    initial
    begin
        // Initialize
        clk = 0;
        wa1 = 0;
        wa2 = 0;
        we1 = 0;
        we2 = 0;

    
        // Edge cases:
        // ra1 = ra2 = wa1
        value = 'h1111;
        wd1 = value;
        we1 = 1;
        wa1 = 5'b00010;
        ra1 = 5'b00010;
        ra2 = 5'b00010;
        #4;
        
        // Standard Test
        for (i = 0; i < 31; i = i + 1) 
        begin
            wa1 = i;
            wa2 = i + 1;
            
            wd1 = value;
            value = value + 1;
            wd2 = value;
            we1 = ~we1;
            we2 = ~we2;
            ra1 = wa1;
            ra2 = wa2;
            #4;
        end 
        
        we1 = 1;
        we2 = 1;
        wa1 = 1;
        wa2 = 1;
        ra1 = 1;
        ra2 = 1;
        
        wd1 = 123;
        wd2 = $random;
        #4;
    end

    always
        #2 clk = ~clk; 
endmodule
