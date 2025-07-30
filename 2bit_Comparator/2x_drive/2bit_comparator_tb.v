`timescale 1ps/1ps

module bit2_comparator_tb;
    reg [1:0] a, b;
    wire a_gt_b, a_eq_b, a_lt_b;

    //DUT instantiation
    bit2_comparator uut(
        .a(a),
        .b(b),
        .a_gt_b(a_gt_b),
        .a_eq_b(a_eq_b),
        .a_lt_b(a_lt_b)
    );

    initial begin
        $dumpfile("2bit_comparator_tb.vcd");
        $dumpvars(0, bit2_comparator_tb);

        //testing for inputs 0-3
        a = 0; b= 0; #2;
        a = 0; b= 1; #2;
        a = 0; b= 2; #2;
        a = 0; b= 3; #2;
        a = 1; b= 0; #2;
        a = 1; b= 1; #2;
        a = 1; b= 2; #2;
        a = 1; b= 3; #2;
        a = 2; b= 0; #2;
        a = 2; b= 1; #2;
        a = 2; b= 2; #2;
        a = 2; b= 3; #2;
        a = 3; b= 0; #2;
        a = 3; b= 1; #2;
        a = 3; b= 2; #2;
        a = 3; b= 3; #2;
        $finish;
    end
endmodule
