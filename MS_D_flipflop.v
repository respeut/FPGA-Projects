//Master Slave D flip flop

module Lab3_part3 (LEDR, LEDG, SW);
		input [1:0] SW;
		output [1:0] LEDR, LEDG;
		
		
		assign LEDR= SW;
		masterslave M0 (SW[0], SW[1], LEDG[0]);
		
endmodule

module D_latch (D, Clk, Q);
		input Clk, D;
		output Q;

		wire S, R, S_g, R_g, Qa, Qb /*synthesis keep*/;
		
		assign R = ~D;
		assign S = D;
		assign S_g = ~(S & Clk);
		assign R_g = ~(R & Clk);
		assign Qa = ~(S_g & Qb);
		assign Qb = ~(R_g & Qa);
		assign Q = Qa;
		
endmodule

module masterslave (D, Clk, Qs);
		input Clk, D;
		output Qs;
		
		wire Qm;
		D_latch latch0 (D, ~Clk, Qm);
		D_latch latch1 (Qm, Clk, Qs);
endmodule
		
