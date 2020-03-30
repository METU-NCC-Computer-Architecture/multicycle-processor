module DFF8(Reset, Enable, D, CLK, Q);

input [7:0] D; 
input Enable, Reset;
input CLK; 

output reg [7:0] Q; 

always @(posedge CLK)
begin
	if (Reset)
		Q <= 8'b0;
	else
		if (Enable)
			Q <= D;
end
endmodule 