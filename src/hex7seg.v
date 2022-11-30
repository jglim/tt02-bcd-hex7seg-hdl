
/*
      -- 1 --
     |       |
     6       2
     |       |
      -- 7 --
     |       |
     5       3
     |       |
      -- 4 --
*/

module hex7seg (
    input wire [3:0] counter,
    input wire dot,
    input wire inv,
    output reg [7:0] segments
);
    reg [7:0] inter;

    always @(*) begin    
        case(counter)
            //              7654321
            0:   inter = 8'b0111111; // 3F
            1:   inter = 8'b0000110; // 06
            2:   inter = 8'b1011011; // 5B
            3:   inter = 8'b1001111; // 4F
            4:   inter = 8'b1100110; // 66
            5:   inter = 8'b1101101; // 6D
            6:   inter = 8'b1111101; // 7D
            7:   inter = 8'b0000111; // 07
            8:   inter = 8'b1111111; // 7F
            9:   inter = 8'b1101111; // 6F
            10:  inter = 8'b1110111; // A  77
            11:  inter = 8'b1111100; // b  7C
            12:  inter = 8'b0111001; // C  39
            13:  inter = 8'b1011110; // d  5E
            14:  inter = 8'b1111001; // E  79
            15:  inter = 8'b1110001; // F  71
            
            default:    
                inter = 8'b0000000;
        endcase
      
        inter[7] = dot;

        if (inv) begin
            segments = ~inter;
        end else begin
            segments = inter;
        end

    end
endmodule