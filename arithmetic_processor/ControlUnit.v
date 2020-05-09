module ControlUnit(instruction,
PC_RST,
RST,
CLK,
RF_EN,
MULT_EN,
LDA, LDQ,
PC_MUX_SEL,
SR_SEL,
PLUS1_SEL,
SR,
SL,
A_SEL,
B_SEL,
PC_EN,
MUL_SEL,
INST_TYPE_MUX_SEL,
D_SEL,
OAP,
DATA_MEM_SEL,
Cin,
WB_SEL,
UL_SEL,
WR_EN,
INST_REG_EN,
Z_FLAG,
N_FLAG,
counterchk); 

output reg RST, RF_EN, MULT_EN, LDA, LDQ, SR_SEL, PLUS1_SEL, SR, SL, PC_EN, MUL_SEL, INST_TYPE_MUX_SEL, DATA_MEM_SEL, Cin, WB_SEL, UL_SEL, WR_EN, INST_REG_EN;
output reg [1:0] PC_MUX_SEL, A_SEL, B_SEL, D_SEL;
output reg [2:0] OAP;
output reg [3:0] counterchk;

input CLK, PC_RST, Z_FLAG, N_FLAG;
input [15:0] instruction;


integer Count;
integer available, fetch;

initial
begin
	RST = 1'b1;
	Count = 0;
	MUL_SEL = 1'b0;
	available = 0;
	PC_MUX_SEL = 0;
	INST_REG_EN = 0;
	PC_EN = 0;
	fetch = 1;
	available = 0;
	
	
end

always @(posedge CLK)
begin
	RST = 1'b0;
	counterchk = Count;
	
	if (available == 0) begin
		Count = 0;
	end
	counterchk = Count;
	
	if(fetch == 0) begin
		INST_REG_EN = 0;
		PC_EN = 0;
	end
	
	if(fetch) begin
		INST_REG_EN = 1;
		PC_EN = 1;
		fetch = 0;
		available = 1;
	end
	
	if (available) begin
		Count = Count + 1;
	end
	counterchk = Count;
	
		
	/*if (Count == 4) begin
		Count = 4'b0;
		available = 0;
	end */
	
	case (instruction[15:12])
		4'b0001: // ADDI
		begin
			case(Count)
			4'b0010:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b11;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 0;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 0;
						OAP = 3'b0;
						fetch = 0;
				end
			4'b0011:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b11;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 1;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 0;
						OAP = 3'b0;
						fetch = 0;
				end
			4'b0100:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b11;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 0;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 1;
						OAP = 3'b0;
						fetch = 1;
						available = 0;
				end	
			default: 
				begin
				end
			endcase
		end
		4'b0010: // ANDI
		begin
			case(Count)
			4'b0010:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b11;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 1;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 0;
						OAP = 3'b100;
						fetch = 0;
				end
			4'b0011:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b11;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 1;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 0;
						OAP = 3'b100;
						fetch = 0;
				end
			4'b0100:
				begin

						A_SEL = 2'b10;
						B_SEL = 2'b11;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 0;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 1;
						OAP = 3'b100;
						available = 0;
						fetch = 1;

				end
			default: 
				begin
				end
			endcase
		end
		
		4'b0000: // R-type
		begin
			case(Count)
			4'b0010:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b10;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 1;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 0;
						OAP = instruction[2:0];
						fetch = 0;
				end
			4'b0011:
				begin
						A_SEL = 2'b10;
						B_SEL = 2'b10;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 1;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 0;
						OAP = instruction[2:0];
						fetch = 0;
				end
			4'b0100:
				begin

						A_SEL = 2'b10;
						B_SEL = 2'b10;
						D_SEL = 2'b01;
						INST_TYPE_MUX_SEL = 0;
						LDA = 0;
						LDQ = 0;
						MULT_EN = 0;
						MUL_SEL = 0;
						PC_MUX_SEL = 0;
						PLUS1_SEL = 0;
						RF_EN = 1;
						OAP = instruction[2:0];
						available = 0;
						fetch = 1;

				end
			default: 
				begin
				end
			endcase
		end
		default: 
			begin
				//PC_EN = 0;
				//INST_REG_EN = 0;
				fetch = 0;
			end
		
		endcase
end
endmodule