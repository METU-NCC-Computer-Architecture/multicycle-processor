module ControlUnit(LDM, LDA, LDQ, ASEL, BSEL, SRSEL, SR, SL, MULST, MULSEL, RST, uOP, CLK); 

output reg LDM, LDA, LDQ, SRSEL, SR, SL, MULST, MULSEL, RST;
output reg [1:0] ASEL, BSEL;

input CLK;
input [4:0] uOP; 

reg [3:0] Count;

initial
begin
	RST <= 1'b1;
	Count <= 4'b0;
	MULSEL <= 1'b0;
end

always @(posedge CLK)
begin
	case(uOP) 
		5'b00000:
			RST <= 1'b1;
			
		5'b00001:
		begin
			LDM <= 1'b1;
			LDA <= 1'b0;
			LDQ <= 1'b0;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b00010:
		begin
			LDM <= 1'b0;
			LDA <= 1'b0;
			LDQ <= 1'b1;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b00011:
		begin
			LDM <= 1'b0;
			LDA <= 1'b0;
			LDQ <= 1'b0;
			SL <= 1'b1;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b00100:
		begin
			LDM <= 1'b0;
			LDA <= 1'b0;
			LDQ <= 1'b0;
			SR <= 1'b1;
			SL <= 1'b0;
			SRSEL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b00101:
		begin
			LDM <= 1'b0;
			LDA <= 1'b0;
			LDQ <= 1'b0;
			SR <= 1'b1;
			SL <= 1'b0;
			SRSEL <= 1'b1;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b00110:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			SR <= 1'b0;
			SL <= 1'b0;
			ASEL <= 2'b0;
			BSEL <= 2'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b00111:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b0;
			BSEL <= 2'b01;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01000:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b0;
			BSEL <= 2'b10;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01001:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b0;
			BSEL <= 2'b11;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01010:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b01;
			BSEL <= 2'b0;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01011:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b01;
			BSEL <= 2'b01;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01100:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b01;
			BSEL <= 2'b10;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01101:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b01;
			BSEL <= 2'b11;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01110:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b10;
			BSEL <= 2'b0;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b01111:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b10;
			BSEL <= 2'b01;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10000:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b10;
			BSEL <= 2'b10;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10001:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b10;
			BSEL <= 2'b11;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10010:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b11;
			BSEL <= 2'b0;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10011:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b11;
			BSEL <= 2'b01;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10100:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b11;
			BSEL <= 2'b10;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10101:
		begin
			LDM <= 1'b0;
			LDA <= 1'b1;
			LDQ <= 1'b0;
			ASEL <= 2'b11;
			BSEL <= 2'b11;
			SR <= 1'b0;
			SL <= 1'b0;
			RST <= 1'b0;
			MULSEL <= 1'b0;
		end
		5'b10110:
		begin
		
			if (Count == 4'b0) begin
				MULST <= 1'b1;
			end else if (Count == 4'b0001) begin
				MULST <= 1'b0;
			end else if (Count == 4'b1001) begin
				LDA <= 1'b1;
				LDQ <= 1'b1;
				MULSEL <= 1'b1;
				RST <= 1'b0;
			end else begin
				RST <= 1'b0;
				LDA <= 1'b0;
				LDQ <= 1'b0;
			end
				
			Count <= Count + 1;		
		end
		
		default:
			RST <= 1'b1;
	endcase 
end
endmodule