module DFF1 (Reset, Enable, D, CLK, Q);

input D; 
input Enable, Reset;
input CLK; 

output reg Q; 

always @(posedge CLK)
begin
	if (Reset)
		Q <= 1'b0;
	else
		if (Enable)
			Q <= D;
end
endmodule 