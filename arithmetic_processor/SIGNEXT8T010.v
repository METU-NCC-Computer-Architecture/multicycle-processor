module SIGNEXT8T010(
  input [7:0] Unextended,
  output reg [9:0] Extended 
);

always@ *
  begin 
     Extended[9:0] <= { {2{Unextended[7]}}, Unextended[7:0] };
  end
endmodule