module sign_extend(
  input [5:0] unextended,//the msb bit is the sign bit
  input clk,
  output reg [7:0] extended 
);

always@(posedge clk)
  begin 
     extended[7:0] <= { {1{unextended[5]}}, unextended[5:0] };
  end
endmodule