// 2-bit comparator module
module bit2_comparator(
    input [1:0] a, // input a
    input [1:0] b, // input b
    output a_gt_b, // output a greater than b
    output a_eq_b, // output a equal to b
    output a_lt_b // output a less than b
);

//compare signals
assign a_gt_b = (a > b); // a is greater than b
assign a_eq_b = (a == b); // a is equal to b
assign a_lt_b = (a < b); // a is less than b

endmodule