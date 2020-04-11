module MUX4TO1_10BIT (IN0, IN1, IN2, IN3, Select, Output); 

input [9:0] IN0, IN1, IN2, IN3; 
input [1:0] Select ; 
output reg [9:0] Output;  

always @ *  
	case (Select) 
		2'b00   : Output <= IN0; 
		2'b01   : Output <= IN1; 
		2'b10   : Output <= IN2; 
		2'b11   : Output <= IN3; 
	endcase 

endmodule