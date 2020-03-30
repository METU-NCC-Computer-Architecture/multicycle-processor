module DFF16(Data_Input, Enable, Reset, CLK, Data_Output);

input [15:0] Data_Input; 
input Enable;
input CLK;
input Reset;

output reg [15:0] Data_Output; 

always @(posedge CLK)
begin
	
	if (Reset)
		Data_Output <= 16'b0;
	
	if (Enable)
		Data_Output <= Data_Input;
	else
		Data_Output <= Data_Output;

end
endmodule 