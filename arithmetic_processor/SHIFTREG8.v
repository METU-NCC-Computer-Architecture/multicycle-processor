module SHIFTREG8(CLK, Reset, Enable, ShiftRL, SIR, SIL, SOR, SOL, D, Q);

input CLK, Enable, Reset;

input [1:0] ShiftRL;

input SIR, SIL;
output SOR, SOL;

wire SOR, SOL;

input [7:0] D;
output reg [7:0] Q;

always @(posedge CLK)
begin	
	if (Reset)
		Q <= 8'b0;
	else
		if (Enable)
			Q <= D;
		else if (ShiftRL == 2'b10) // Shift Right
			{Q} <= {SIR, Q[7:1]};
		else if (ShiftRL == 2'b01) // Shift Left
			{Q} <= {Q[6:0], SIL};
end

assign SOR = Q[0];
assign SOL = Q[7];

endmodule 