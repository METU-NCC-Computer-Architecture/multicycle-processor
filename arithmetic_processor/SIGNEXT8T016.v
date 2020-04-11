module SIGNEXT8T016(
  input [7:0] Unextended,
  output reg [15:0] Extended 
);

always@ *
  begin 
     Extended[15:0] <= { {8{Unextended[7]}}, Unextended[7:0] };
  end
endmodule