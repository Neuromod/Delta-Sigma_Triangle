module Top(clk, btn, rgb, led, pin);
    localparam clkFrequency  = 12_000_000;
    localparam waveFrequency = 1_000;
   
    localparam phaseBits = 20;
    localparam waveBits  = 16;
    
    localparam [phaseBits - 1 : 0] dPhase = (2.0 ** phaseBits) / (clkFrequency / waveFrequency);
      
    input  wire clk;   
    input  wire [1 : 0] btn;
    output reg  [2 : 0] rgb = 3'b111;
    output reg  [3 : 0] led = 4'b0000;
    output wire pin;
    
    reg  [phaseBits - 1 : 0] phase = 0;
    wire [waveBits  - 1 : 0] wave;

    Triangle #(phaseBits, waveBits) triangle(clk, phase, wave);

    DeltaSigma #(waveBits) deltaSigma(clk, wave, pin);
   
    always @(posedge clk)
        phase = phase + dPhase;
endmodule
