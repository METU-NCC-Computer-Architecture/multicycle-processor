module deneme(a, b, c, clk);

input clk;
input [7:0] a, b;
output reg[15:0] c;
reg [7:0] temp;

wire d = ~a + 1;

always @( posedge clk )
begin
	temp = ~a[7:0] + 1;
	c = {8'b0, temp};
end

endmodule