module divider (quotient,remainder,ready,dividend,divider,start,clk);
   
   input [7:0]  dividend,divider;
   input         start, clk;
   output        quotient,remainder;
   output        ready;

   reg [7:0]    quotient;
   reg [15:0]    dividend_copy, divider_copy, diff;
   wire [7:0]   remainder = dividend_copy[15:0];

   reg [4:0]     bit; 
   wire          ready = !bit;
   
   initial bit = 0;
	integer signflag = 0;
	reg [7:0] dividend_cpy, divider_cpy;
	

   always @( posedge clk ) 
	begin
		if(dividend[7:6] == 1'b1)
		begin
			dividend_cpy=~dividend+1;
			signflag=signflag+1;
		end
		if(divider[7:6] == 1'b1)
		begin
			divider_cpy=~divider+1;
			signflag=signflag+1;
		end
		else
		dividend_cpy=dividend;
		divider_cpy=divider;
		begin
		
		end

     if(start==0) begin

        bit = 8;
        quotient = 0;
        dividend_copy = {8'd0,dividend_cpy};
        divider_copy = {1'b0,divider_cpy,7'd0};

     end else begin

        diff = dividend_copy - divider_copy;

        quotient = quotient << 1;

        if( !diff[15] ) begin

           dividend_copy = diff;
           quotient[0] = 1'd1;

        end

        divider_copy = divider_copy >> 1;
        bit = bit - 1;

     end
	  if(ready==1 && signflag==1)
	  begin
	  quotient=~quotient+1;
	  end
end
endmodule
