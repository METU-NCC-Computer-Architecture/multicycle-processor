module SIGNEXT6T08(
  input [5:0] Unextended,
  output reg [7:0] Extended 
);

always@ *
  begin 
     extended[7:0] <= { {2{Unextended[5]}}, unextended[5:0] };
  end
endmodule