module comp2 (
    input  A, B,
    output L,
    output E,
    output G
);
    // The logic remains the same. These signals are implicitly wires.
    assign L = (~A)&B;
    assign E = ~(A^B);
    assign G = A&(~B);

endmodule
