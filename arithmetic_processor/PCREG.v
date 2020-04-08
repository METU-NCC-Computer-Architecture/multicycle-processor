module PCREG(CLK, RST, EN, New_Address, Address);

input CLK, EN, RST;
input [9:0] New_Address;
output reg [9:0] Address;


always @(posedge CLK)
begin
	if (RST)
		Address <= 10'b0;
	else
		if (EN)
			Address <= New_Address + 1;
end
endmodule 