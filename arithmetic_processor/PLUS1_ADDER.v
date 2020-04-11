module PLUS1_ADDER(
  input [2:0] Plus1,
  input [2:0] Plus0,
  input PLUS1_CTL,
  output reg [2:0] Output 
);

always@ *
  begin 
     case (PLUS1_CTL) 
		1'b0   : Output = Plus0; 
		1'b1   : Output = Plus1 + 1;
		endcase 
  end
endmodule