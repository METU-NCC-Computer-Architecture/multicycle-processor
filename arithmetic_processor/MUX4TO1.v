module MUX4TO1 (IN0, IN1, IN2, IN3, Select, Output); 

input [7:0] IN0, IN1, IN2, IN3; 
input [1:0] Select ; 
output reg [7:0] Output;  

always @ *  
	case (Select) 
		2'b00   : Output = IN0; 
		2'b01   : Output = IN1; 
		2'b10   : Output = IN2; 
		2'b11   : Output = IN3; 
	endcase 

endmodule