module prime_lut(
    input [2:0] index,
    output reg [3:0] prime 
);

always @(*) begin
    case (index)
        3'd0: prime = 4'b0010; // 2
        3'd1: prime = 4'b0011; // 3
        3'd2: prime = 4'b0101; // 5
        3'd3: prime = 4'b0111; // 7
        3'd4: prime = 4'b1011; // 11
        3'd5: prime = 4'b1101; // 13: 
        default: prime = 4'b000;
    endcase
    
end

endmodule