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

   always @( posedge clk ) 

     if(start==0) begin

        bit = 8;
        quotient = 0;
        dividend_copy = {8'd0,dividend};
        divider_copy = {1'b0,divider,7'd0};

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

endmodule
