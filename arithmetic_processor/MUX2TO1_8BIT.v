module MUX2TO1_8BIT (IN0, IN1, Select, Output); 

input [7:0] IN0, IN1; 
input Select ; 
output reg [7:0] Output;

always @ *  
	case (Select) 
		1'b0   : Output <= IN0; 
		1'b1   : Output <= IN1;
	endcase 

endmodule