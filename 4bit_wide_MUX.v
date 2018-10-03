//4 bit wide multiplexer

module Lab1_part2 (SW, LEDR, LEDG, M, x, y); 
	input[9:0] SW;
	output [9:0] LEDR;
	output [7:0] LEDG;
	output [3:0] M;
	output [3:0] x;
	output [7:4] y;
	
	assign LEDR = SW;
	assign x[3:0] = SW[3:0];
	assign y[7:4] = SW[7:4];
	assign s = SW[9];
	
	assign M[0] = (~s & x[0]) | (s & y[4]);
	assign M[1] = (~s & x[1]) | (s & y[5]);
	assign M[2] = (~s & x[2]) | (s & y[6]);
	assign M[3] = (~s & x[3]) | (s & y[7]);

	assign LEDG = M;
endmodule


