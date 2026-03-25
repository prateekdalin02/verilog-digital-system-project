module four_bit_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] SUM,
    output COUT
);

wire c1;
wire c2;
wire c3;



half_adder HA(
    .a(A[0]),
    .b(B[0]),
    .sum(SUM[0]),
    .carry(c1)
);

full_adder FA2(
    .a(A[1]),
    .b(B[1]),
    .cin(c1),
    .sum(SUM[1]),
    .cout(c2)
);

full_adder FA3(
    .a(A[2]),
    .b(B[2]),
    .cin(c2),
    .sum(SUM[2]),
    .cout(c3)
);

full_adder FA4(
    .a(A[3]),
    .b(B[3]),
    .cin(c3),
    .sum(SUM[3]),
    .cout(COUT)
);

endmodule

