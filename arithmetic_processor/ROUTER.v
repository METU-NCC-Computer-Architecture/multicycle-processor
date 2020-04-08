module ROUTER(IN_16Bit, IN_8Bit, Select, Output); 

input [15:0] IN_16Bit;
input [7:0] IN_8Bit;
input Select ; 
output reg [15:0] Output;

always @ *  
	case (Select) 
		1'b0   : Output <= {IN_16Bit[15:8], IN_8Bit[7:0]}; 
		1'b1   : Output <= {IN_8Bit[7:0], IN_16Bit[7:0]};  
	endcase 

endmodule