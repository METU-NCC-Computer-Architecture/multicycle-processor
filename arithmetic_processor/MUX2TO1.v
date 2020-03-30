module MUX2TO1 (IN0, IN1, Select, Output); 

input IN0, IN1; 
input Select ; 
output reg Output;

always @ *  
	case (Select) 
		1'b0   : Output = IN0; 
		1'b1   : Output = IN1;
	endcase 

endmodule