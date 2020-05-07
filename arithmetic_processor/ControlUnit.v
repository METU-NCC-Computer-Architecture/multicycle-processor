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
N_FLAG); 

output reg RST, RF_EN, MULT_EN, LDA, LDQ, SR_SEL, PLUS1_SEL, SR, SL, PC_EN, MUL_SEL, INST_TYPE_MUX_SEL, DATA_MEM_SEL, Cin, WB_SEL, UL_SEL, WR_EN, INST_REG_EN;
output reg [1:0] PC_MUX_SEL, A_SEL, B_SEL, D_SEL;
output reg [2:0] OAP;

input CLK, PC_RST, Z_FLAG, N_FLAG;
input [15:0] instruction;


reg [3:0] Count;
reg Avaible;

initial
begin
	RST <= 1'b1;
	Count <= 4'b0;
	MUL_SEL <= 1'b0;
	Avaible <= 0;
	PC_MUX_SEL <= 0;
end

always @(posedge CLK)
begin
	RST <= 1'b0;
	
	if (Avaible) begin
		Count <= Count + 1'b1;
	end
	else begin
		Count <= 4'b0;
	end
		
	if (Count == 4) begin
		Count <= 4'b0;
		Avaible <= 0;
	end
	
	case (instruction[15:12])
		4'b0001: // ADDI
		begin
			Avaible <= 1;
			case(Count)
			4'b0000:
				begin
						PC_EN <= 1;
						INST_REG_EN <= 1;
						A_SEL <= 2'b00;
						B_SEL <= 2'b00;
						D_SEL <= 2'b00;
						INST_TYPE_MUX_SEL <= 0;
						LDA <= 0;
						LDQ <= 0;
						MULT_EN <= 0;
						MUL_SEL <= 0;
						PC_MUX_SEL <= 0;
						PLUS1_SEL <= 0;
						RF_EN <= 0;
						OAP <= instruction[2:0];
				end
			4'b0001:
				begin
						PC_EN <= 0;
						INST_REG_EN <= 0;
						A_SEL <= 2'b10;
						B_SEL <= 2'b11;
						D_SEL <= 2'b00;
						INST_TYPE_MUX_SEL <= 0;
						LDA <= 1;
						LDQ <= 0;
						MULT_EN <= 0;
						MUL_SEL <= 0;
						PC_MUX_SEL <= 0;
						PLUS1_SEL <= 0;
						RF_EN <= 0;
						OAP <= 3'b0;
				end
			4'b0010:
				begin
						PC_EN <= 0;
						INST_REG_EN <= 0;
						A_SEL <= 2'b10;
						B_SEL <= 2'b11;
						D_SEL <= 2'b01;
						INST_TYPE_MUX_SEL <= 0;
						LDA <= 0;
						LDQ <= 0;
						MULT_EN <= 0;
						MUL_SEL <= 0;
						PC_MUX_SEL <= 0;
						PLUS1_SEL <= 0;
						RF_EN <= 1;
						OAP <= 3'b0;
						Avaible <= 0;
						Count <= 4'b0;
				end
			endcase
		end
		4'b0010: // ANDI
		begin
			Avaible <= 1;
			case(Count)
			4'b0000:
				begin
						PC_EN <= 1;
						INST_REG_EN <= 1;
						A_SEL <= 2'b00;
						B_SEL <= 2'b00;
						D_SEL <= 2'b00;
						INST_TYPE_MUX_SEL <= 0;
						LDA <= 0;
						LDQ <= 0;
						MULT_EN <= 0;
						MUL_SEL <= 0;
						PC_MUX_SEL <= 0;
						PLUS1_SEL <= 0;
						RF_EN <= 0;
						OAP <= instruction[2:0];
				end
			4'b0001:
				begin
						PC_EN <= 0;
						INST_REG_EN <= 0;
						A_SEL <= 2'b10;
						B_SEL <= 2'b11;
						D_SEL <= 2'b00;
						INST_TYPE_MUX_SEL <= 0;
						LDA <= 1;
						LDQ <= 0;
						MULT_EN <= 0;
						MUL_SEL <= 0;
						PC_MUX_SEL <= 0;
						PLUS1_SEL <= 0;
						RF_EN <= 0;
						OAP <= 3'b100;
				end
			4'b0010:
				begin
						PC_EN <= 0;
						INST_REG_EN <= 0;
						A_SEL <= 2'b10;
						B_SEL <= 2'b11;
						D_SEL <= 2'b01;
						INST_TYPE_MUX_SEL <= 0;
						LDA <= 0;
						LDQ <= 0;
						MULT_EN <= 0;
						MUL_SEL <= 0;
						PC_MUX_SEL <= 0;
						PLUS1_SEL <= 0;
						RF_EN <= 1;
						OAP <= 3'b0;
						Avaible <= 0;

				end
			endcase
		end
		
		
		endcase
end
endmodule