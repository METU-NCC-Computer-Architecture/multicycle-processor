module Multiplier(Product, Busy, Multiplicand, Multiplier, CLK, Start);

	input [7:0] Multiplicand, Multiplier;
	input CLK, Start;
	
	output [15:0] Product;
	output Busy;

	reg [7:0] A, Q, M;
	reg Q_1;
	reg [4:0] Count;

	wire [7:0] Sum, Difference;


always @(posedge CLK)
begin
	if (Start) begin
	
	A <= 8'b0;      
	M <= Multiplicand;
	Q <= Multiplier;
	Q_1 <= 1'b0;      
	
	Count <= 5'b0;
	
	end
	else begin
	
	case ({Q[0], Q_1})
	2'b0_1 : {A, Q, Q_1} <= {Sum[7], Sum, Q};
	2'b1_0 : {A, Q, Q_1} <= {Difference[7], Difference, Q};
	default: {A, Q, Q_1} <= {A[7], A, Q};
	endcase
	
	Count <= Count + 1'b1;
	
	end
end

ALU Adder (Sum, A, M, 1'b0);
ALU Subtractor (Difference, A, ~M, 1'b1);

assign Product = {A, Q};
assign Busy = (Count <= 6);

endmodule

