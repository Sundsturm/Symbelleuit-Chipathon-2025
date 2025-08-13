// Define a shorthand for your specific comparator cell.
// This makes the code cleaner and easier to update if the cell name changes.
`define COMP_CELL comp2

//
// Mapping for the "Less Than" ($lt) operator
//
(* techmap_celltype = "$lt" *)
module _90_map_lt (A, B, Y);
	// This map is only for single-bit comparisons.
	parameter WIDTH = 1;
	input [WIDTH-1:0] A, B;
	output [WIDTH-1:0] Y;

	// This will cause synthesis to fail if Yosys tries to map a multi-bit
	// comparator here, which is the desired behavior.
	wire _TECHMAP_FAIL_ = WIDTH > 1;

	// Instantiate your cell.
	// Connect the abstract cell's ports (A, B, Y) to your physical cell's ports.
	// The output 'Y' of the $lt cell is mapped to the 'L' output of your comparator.
	// The other outputs (E, G) are unused for this operation, so they are left blank.
	`COMP_CELL U1 ( .A(A), .B(B), .L(Y), .E(), .G() );

endmodule

//
// Mapping for the "Greater Than" ($gt) operator
//
(* techmap_celltype = "$gt" *)
module _90_map_gt (A, B, Y);
	parameter WIDTH = 1;
	input [WIDTH-1:0] A, B;
	output [WIDTH-1:0] Y;

	wire _TECHMAP_FAIL_ = WIDTH > 1;

	// Here, the output 'Y' of the $gt cell is mapped to the 'G' output of your comparator.
	// The L and E outputs are unused.
	`COMP_CELL U1 ( .A(A), .B(B), .L(), .E(), .G(Y) );

endmodule

//
// Mapping for the "Equal To" ($eq) operator
//
(* techmap_celltype = "$eq" *)
module _90_map_eq (A, B, Y);
	parameter WIDTH = 1;
	input [WIDTH-1:0] A, B;
	output [WIDTH-1:0] Y;

	wire _TECHMAP_FAIL_ = WIDTH > 1;

	// Finally, the output 'Y' of the $eq cell is mapped to the 'E' output of your comparator.
	// The L and G outputs are unused.
	`COMP_CELL U1 ( .A(A), .B(B), .L(), .E(Y), .G() );

endmodule
