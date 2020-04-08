module data_memory
(
	input [15:0] data_in,
	input [9:0] addr,
	input wen, clk,
	output [15:0] data_out
);

	// Declare the RAM variable
	reg [15:0] ram[1023:0];
	
	// Variable to hold the registered read address
	reg [9:0] addr_reg;
	
	always @ (posedge clk)
	begin
	// Write
		if (wen)
			ram[addr] <= data_in;
		
		addr_reg <= addr;
		
	end
		
	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign data_out = ram[addr_reg];
	
endmodule
