module REG16(D, Q, CLK, RST, EN);

input CLK, EN, RST;
input [15:0] D;
output reg [9:0] Q;


always @(posedge CLK)
begin
	if (RST)
		Q <= 16'b0;
	else
		if (EN)
			Q <= D;
end
endmodule 