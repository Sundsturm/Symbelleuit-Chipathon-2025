// Dataflow model without the 'wire' keyword
module comp2 (
    input  A, B,
    output L,
    output E,
    output G
);
    // The logic remains the same. These signals are implicitly wires.
    assign G = A > B;
    assign L = A < B;
    assign E = A == B;

endmodule