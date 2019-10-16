// Unsigned triangle waveform
// NOTE: Not perfect symmetric triangle waveform. It uses xor instead of subtraction (which would require the MSB to be set to 1 only when the phase is exactly "01XXX" (pi / 2))

module Triangle(clk, phase, wave);
    parameter phaseBits = 12;
    parameter waveBits  = 12;
    
    input  wire clk;
    input  wire [phaseBits - 1 : 0] phase;
    output reg  [waveBits  - 1 : 0] wave = 0; 
    
    always @(posedge clk)
    begin
        if (phaseBits <= waveBits + 1)
            wave = phase[phaseBits - 3 : 0] << (waveBits - phaseBits + 1);
        else
            wave = phase[phaseBits - 3 : 0] >> (phaseBits - waveBits - 1);
        
        case (phase[phaseBits - 1 : phaseBits - 2])
            2'b00:
                wave = wave | (1 << (waveBits - 1));
            2'b01:
                wave = wave ^ {(waveBits - 1){1'b1}} | (1 << (waveBits - 1));
            2'b10:
                wave = wave ^ {(waveBits - 1){1'b1}};
        endcase
    end
endmodule
