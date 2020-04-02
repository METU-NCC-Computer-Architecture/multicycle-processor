module RegisterFile8x8
  (input CLK,
   input WriteEN,
	input RST,
   input [2:0] Write_Address,
   input [7:0] Write_Data,
   input [2:0] Read_AddressA,
   output [7:0] Read_DataA,
   input [2:0] Read_AddressB,
   output [7:0] Read_DataB);

   reg [7:0] 	 reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;

   assign Read_DataA = Read_AddressA == 0 ? reg0 :
		    Read_AddressA == 1 ? reg1 :
		    Read_AddressA == 2 ? reg2 :
		    Read_AddressA == 3 ? reg3 :
			 Read_AddressA == 4 ? reg4 :
			 Read_AddressA == 5 ? reg5 :
			 Read_AddressA == 6 ? reg6 :
			 Read_AddressA == 7 ? reg7 : 0;
			 
   assign Read_DataB = Read_AddressB == 0 ? reg0 :
		    Read_AddressB == 1 ? reg1 :
		    Read_AddressB == 2 ? reg2 :
		    Read_AddressB == 3 ? reg3 :
			 Read_AddressB == 4 ? reg4 :
			 Read_AddressB == 5 ? reg5 :
			 Read_AddressB == 6 ? reg6 :
			 Read_AddressB == 7 ? reg7 : 0;

   always @(posedge CLK) begin
		if (RST)
		begin
			reg0 <= 8'b0;
			reg1 <= 8'b0;
			reg2 <= 8'b0;
			reg3 <= 8'b0;
			reg4 <= 8'b0;
			reg5 <= 8'b0;
			reg6 <= 8'b0;
			reg7 <= 8'b0;
		end
			
      if (WriteEN) 
			case (Write_Address) 
			  0: begin
				  reg0 <= Write_Data;
			  end
			  1: begin
				  reg1 <= Write_Data;
			  end
			  2: begin
				  reg2 <= Write_Data;
			  end
			  3: begin
				  reg3 <= Write_Data;
			  end
			  4: begin
				  reg4 <= Write_Data;
			  end
			  5: begin
				  reg5 <= Write_Data;
			  end
			  6: begin
				  reg6 <= Write_Data;
			  end
			  7: begin
				  reg7 <= Write_Data;
			  end
			endcase
   end
endmodule