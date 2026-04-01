// Testbench for integrated digital system
// Includes counter, register, adder, LUT
// Author: Prateek Dalin
`timescale 1ns/1ps

module testbench;

reg clk;
reg reset;
wire [3:0] A;
reg [3:0] B;
wire [3:0] SUM;
wire COUT;
wire [3:0] count;
wire [3:0] B_comp;
wire greater;
wire [2:0] index;
wire [3:0] prime_out;
wire prime_greater;




//clock generation
always #5 clk = ~clk;

initial clk = 0;

initial begin
    reset = 1;      // start in reset
    #10 reset = 0;  // release reset after 10 ns
end

//constant input
initial begin
    B = 4'b0101;
end

//counter
counter_4bit counter_inst(
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Register
register_4bit reg_inst(
    .clk(clk),
    .d(count),
    .reset(reset),
    .q(A)
);

assign index = count % 6;

prime_lut lut_inst(
    .index(index),
    .prime(prime_out)
);

assign prime_greater = (prime_out > A);

twos_complement tc(
    .in(B),
    .out(B_comp)
);

four_bit_adder uut(
    .A(A),
    .B(B_comp),
    .SUM(SUM),
    .COUT(COUT)
);

assign greater = COUT & (SUM != 4'b0000);


initial begin
    $dumpfile("wave4.vcd");
    $dumpvars(0,testbench);
    #200 $finish;
end

initial begin
    $monitor("t=%0t | count=%d | A=%d | prime=%d | B=%d | A>B=%b | prime>A=%b", 
         $time, count, A, prime_out, B, greater, prime_greater);end



endmodule
