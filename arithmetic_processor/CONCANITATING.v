module CONCANITATING(IN_2Bit, IN_8Bit, Output); 

input [1:0] IN_2Bit;
input [7:0] IN_8Bit;
output reg [9:0] Output;

always @ *  
	Output <= {IN_2Bit[1:0], IN_8Bit[7:0]}; 
endmodule