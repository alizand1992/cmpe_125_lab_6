module regfile2(
    input clk, we1, we2, 
    input [4:0] ra1, ra2, wa1, wa2, 
    input [31:0] wd1, wd2,
    output [31:0] rd1, rd2);
    
    reg [31:0] reg_data [31:0];
    
    always @(posedge clk)
    begin 
        if (wa1 != wa2)
        begin
            if (we1)
                reg_data[wa1] <= wd1;
                
            if (we2)
                reg_data[wa2] <= wd2;
        end        
    end 
  
    assign rd1 = (ra1 != 0) ? reg_data[ra1] : 0;
    assign rd2 = (ra2 != 0) ? reg_data[ra2] : 0;
endmodule
