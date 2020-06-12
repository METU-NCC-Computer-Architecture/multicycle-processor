module divider (quotient, remainder, ready, dividend, divider, start, clk);

input [7:0] dividend, divider;
input start, clk;
output [7:0] quotient,remainder;
output ready;

reg [7:0] quotient;
reg [15:0] dividend_copy, divider_copy, diff;
wire [7:0] remainder = dividend_copy[7:0];

reg [5:0] bit;
reg sign_flag;
wire ready = !bit;

reg [7:0] dividend_comp, divider_comp ;

initial bit = 0;

always @( posedge clk )

if ( ready && start )
begin

	bit = 8;
	quotient = 0;
	sign_flag = 0;
	
	if(dividend[7])
	begin
		dividend_comp = ~dividend + 1;
		dividend_copy = {8'b0, dividend_comp};
		sign_flag = sign_flag ^ 1;
	end
	else
	begin
		dividend_copy = {8'd0, dividend};
	end
	
	if(divider[7])
	begin
		divider_comp = ~divider_comp + 1;
		divider_copy = {1'b0, divider_comp, 7'b0};
		sign_flag = sign_flag ^ 1;
	end
	else
	begin
		divider_copy = {1'b0, divider, 7'b0};
	end
	
end
else
begin

	diff = dividend_copy - divider_copy;
	quotient = { quotient[6:0], ~diff[15] };
	divider_copy = { 1'b0, divider_copy[15:1] };
	if ( !diff[15] ) dividend_copy = diff;
	bit = bit - 1;
	
	if(bit == 0 && sign_flag == 1)
	begin
	quotient= ~quotient + 1;
	end
	
end

endmodule
