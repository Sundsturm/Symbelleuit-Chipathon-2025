// Testbench for the 1-bit comparator
module tb_comp2;

    // Inputs to the comparator (must be 'reg' in a testbench)
    reg  A_tb, B_tb;

    // Outputs from the comparator (must be 'wire' to connect to the module)
    wire L_tb, E_tb, G_tb;

    // Instantiate the Unit Under Test (UUT)
    comp2 uut (
        .A(A_tb),
        .B(B_tb),
        .L(L_tb),
        .E(E_tb),
        .G(G_tb)
    );

    // Stimulus generation block
    initial begin
        // Display a header for the output
        $display("Time | A | B || G (A>B) | E (A==B) | L (A<B)");
        $display("-------------------------------------------");
        
        // Use $monitor to print values whenever they change
        $monitor("%0t  | %b | %b ||    %b    |    %b    |    %b", $time, A_tb, B_tb, G_tb, E_tb, L_tb);

        // Test all 4 possible combinations
        A_tb = 0; B_tb = 0; #10;
        A_tb = 0; B_tb = 1; #10;
        A_tb = 1; B_tb = 0; #10;
        A_tb = 1; B_tb = 1; #10;

        // End the simulation
        $finish;
    end

endmodule