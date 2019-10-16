module DeltaSigma(clk, in, out);
    parameter bits = 16;
    
    input wire clk;
    input wire [bits - 1 : 0] in;
    output reg out;

    reg [bits : 0] sum = 0;
    
    always @(posedge clk)
    begin 
        sum = sum + in;
        
        if (sum[bits])
        begin
            sum[bits] = 0;
            out = 1;
        end
        else
            out = 0;
    end
endmodule
