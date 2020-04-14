module DFF2(Reset, Enable, D, CLK, Q);

input [1:0] D; 
input Enable, Reset;
input CLK; 

output reg [1:0] Q; 

always @(posedge CLK)
begin
	if (Reset)
		Q <= 2'b0;
	else
		if (Enable)
			Q <= D;
end
endmodule 