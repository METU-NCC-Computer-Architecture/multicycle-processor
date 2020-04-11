module SIGNEXT6T08(
  input [5:0] Unextended,
  output reg [7:0] Extended 
);

always@ *
  begin 
     Extended[7:0] <= { {2{Unextended[5]}}, Unextended[5:0] };
  end
endmodule