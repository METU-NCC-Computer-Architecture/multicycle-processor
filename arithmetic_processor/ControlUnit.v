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
counterchk,
DIV_EN); 

output reg RST, RF_EN, MULT_EN, LDA, LDQ, SR_SEL, PLUS1_SEL, SR, SL, PC_EN, DIV_EN, INST_TYPE_MUX_SEL, DATA_MEM_SEL, Cin, WB_SEL, UL_SEL, WR_EN, INST_REG_EN;
output reg [1:0] PC_MUX_SEL, A_SEL, B_SEL, D_SEL, MUL_SEL;
output reg [2:0] OAP;
output reg [3:0] counterchk;

input CLK, PC_RST, Z_FLAG, N_FLAG;
input [15:0] instruction;


integer Count, ShiftCount, MultCount ,DivCount;
integer available, fetch, shift_available, mult_available, div_available, temp_Z;

initial
begin
	RST = 1'b1;
	Count = 0;
	ShiftCount = 0;
	MultCount = 0;
	DivCount = 0;
	MUL_SEL = 2'b00;
	MULT_EN = 0; DIV_EN = 0;
	DIV_EN = 0;
	available = 0;
	PC_MUX_SEL = 0;
	INST_REG_EN = 0;
	PC_EN = 0;
	fetch = 1;
	available = 0;
	shift_available = 0;
	mult_available = 0;
	div_available = 0;
end

always @(posedge CLK)
begin
	RST = 1'b0;
	
	if (available == 0) begin
		Count = 0;
		ShiftCount = 0;
		MultCount = 0;
		DivCount = 0;
	end
	
	if (fetch == 0) begin
		INST_REG_EN = 0;
		PC_EN = 0;
	end
	
	if (ShiftCount !== 0) begin
		ShiftCount = ShiftCount - 1;
		Count = Count - 1;
	end
	
	if (MultCount !== 0) begin
		MultCount = MultCount - 1;
		Count = Count - 1;
	end
	
	if (DivCount !== 0) begin
		DivCount = DivCount - 1;
		Count = Count - 1;
	end
	
	if (fetch) begin
		INST_REG_EN = 1;
		PC_EN = 1;
		fetch = 0;
		available = 1;
	end
	
	if (available) begin
		Count = Count + 1;
	end
	
	counterchk = Count;
	
	case (instruction[15:12])
	4'b0000: // R-type
	begin
		if(instruction[2:0] == 3'b111) begin // DIV
			case(Count)
			4'b0010:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0;
				DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0011:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0;
				DIV_EN = 1;
				MUL_SEL = 2'b10;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				MUL_SEL = 2'b10;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0100:
			begin
				if(DivCount == 0 && div_available == 0) begin
					DivCount = 6;
					div_available = 1;
				end
				if( div_available == 1 ) begin
					if(DivCount == 0) begin
						div_available= 0;
					end
					else begin
					end
				end
				DIV_EN = 1;
				D_SEL = 2'b01;
			end
			4'b0101:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 1;
				MULT_EN = 0; DIV_EN = 0;
				DIV_EN = 0;
				MUL_SEL = 2'b10;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				MUL_SEL = 2'b10;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0110:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				DIV_EN = 0;
				MUL_SEL = 2'b10;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 1;
				MUL_SEL = 2'b10;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0111:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b00;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				DIV_EN = 0;
				MUL_SEL = 2'b10;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 1;
				RF_EN = 1;
				MUL_SEL = 2'b10;
				OAP = 3'b0;
				available = 0;
				fetch = 1;
			end
			endcase
		end
		else if(instruction[2:0] == 3'b010) begin // MUL
			case(Count)
			4'b0010:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0011:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 1;
				MUL_SEL = 2'b01;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				MUL_SEL = 2'b01;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0100:
			begin
				if(MultCount == 0 && mult_available == 0) begin
					MultCount = 7;
					mult_available = 1;
				end
				if( mult_available == 1 ) begin
					if(MultCount == 0) begin
						mult_available= 0;
					end
					else begin
					end
				end
				MULT_EN = 0; DIV_EN = 0;
				D_SEL = 2'b01;
			end
			4'b0101:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 1;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b01;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				MUL_SEL = 2'b01;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0110:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b01;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 1;
				MUL_SEL = 2'b01;
				OAP = 3'b0;
				fetch = 0;
			end
			4'b0111:
			begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b00;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b01;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 1;
				RF_EN = 1;
				MUL_SEL = 2'b01;
				OAP = 3'b0;
				available = 0;
				fetch = 1;
			end
			endcase
		end
		else if(instruction[2:0] == 3'b101) begin // SLT
			case(Count)
			4'b0010:
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b10;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b001;
				fetch = 0;
			end
			4'b0011:
			begin
			if(N_FLAG == 1 ) begin
				A_SEL = 2'b00;
				B_SEL = 2'b01;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = instruction[2:0];
				fetch = 0;
			end
			if(N_FLAG == 0 ) begin
				A_SEL = 2'b00;
				B_SEL = 2'b00;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b001;
				fetch = 0;
			end
			end
			4'b0100:
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b10;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 0;
				PLUS1_SEL = 0;
				RF_EN = 1;
				OAP = 3'b001;
				available = 0;
				fetch = 1;
			end
			default: 
				begin
				end
			endcase
		end
		else begin //ADD,SUB,OR,AND,XOR
			case(Count)
			4'b0010:
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b10;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
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
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
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
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
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
	end
	4'b1101: // BREQ
	begin
		case(Count)
		4'b0010:
		begin
			INST_TYPE_MUX_SEL = 1;
			A_SEL = 2'b10;
			B_SEL = 2'b10;
			D_SEL = 2'b01;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b001;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b10;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b0;
			PC_EN = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b001;
			fetch = 0;
		end
		4'b0100:
		begin
		if(Z_FLAG == 1)
			begin
				temp_Z = Z_FLAG;
				A_SEL = 2'b01;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b10;
				PC_EN = 0 ;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		if(Z_FLAG == 0)
			begin
				temp_Z = Z_FLAG;
				A_SEL = 2'b01;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b00;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		end
		4'b0101:
		begin
		if(temp_Z == 1)
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b10;
				PC_EN = 1;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		if(temp_Z == 0)
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b00;
				PC_EN = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		end	
		4'b0110:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b00;
			PC_EN = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b000;
			fetch = 1;
			available = 0;
		end
		default: 
			begin
			end	
		endcase
	end
	4'b1110: // BRNE
	begin
		case(Count)
		4'b0010:
		begin
			INST_TYPE_MUX_SEL = 1;
			A_SEL = 2'b10;
			B_SEL = 2'b10;
			D_SEL = 2'b01;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b001;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b10;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b0;
			PC_EN = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b001;
			fetch = 0;
		end
		4'b0100:
		begin
		if(Z_FLAG == 0)
			begin
				temp_Z = Z_FLAG;
				A_SEL = 2'b01;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b10;
				PC_EN = 0 ;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		if(Z_FLAG == 1)
			begin
				temp_Z = Z_FLAG;
				A_SEL = 2'b01;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 1;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b00;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		end
		4'b0101:
		begin
		if(temp_Z == 0)
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b10;
				PC_EN = 1;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		if(temp_Z == 1)
			begin
				A_SEL = 2'b10;
				B_SEL = 2'b11;
				D_SEL = 2'b01;
				INST_TYPE_MUX_SEL = 0;
				LDA = 0;
				LDQ = 0;
				MULT_EN = 0; DIV_EN = 0;
				MUL_SEL = 2'b00;
				PC_MUX_SEL = 2'b00;
				PC_EN = 0;
				PLUS1_SEL = 0;
				RF_EN = 0;
				OAP = 3'b000;
				fetch = 0;
			end
		end	
		4'b0110:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b00;
			PC_EN = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b000;
			fetch = 1;
			available = 0;
		end
		default: 
			begin
			end
		endcase
	end
	4'b1111: // JUMP
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b01;
			PC_EN = 0;
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
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b01;
			PC_EN = 1;
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b00;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b0;
			fetch = 1;
			available = 0;
		end
		default: 
			begin
			end
		endcase
	end
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 1;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 1;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b100;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b0100: // SLL
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b00;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 1;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			if(ShiftCount == 0 && shift_available == 0) begin
				ShiftCount = instruction[5:0];
				shift_available = 1;
				SL = 1;
			end
			if( shift_available == 1 ) begin
				if(ShiftCount == 0) begin
					shift_available= 0;
					SL = 0;
					RF_EN = 1;
					available = 0;
					fetch = 1;
				end
				else begin
					SL = 1;
				end
			end
			A_SEL = 2'b10;
			B_SEL = 2'b00;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			SR = 0;
			SR_SEL = 0;
			OAP = 3'b0;
		end
		default: 
		begin
		end
		endcase
	end
	4'b0101: // SRL
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b00;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 1;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			if(ShiftCount == 0 && shift_available == 0) begin
				ShiftCount = instruction[5:0];
				shift_available = 1;
				SR = 1;
			end
			if( shift_available == 1 ) begin
				if(ShiftCount == 0) begin
					shift_available= 0;
					SR = 0;
					RF_EN = 1;
					available = 0;
					fetch = 1;
				end
				else begin
					SR = 1;
				end
			end
			A_SEL = 2'b10;
			B_SEL = 2'b00;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b000;
		end
		default: 
		begin
		end
		endcase
	end
	4'b0110: // SRA
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b00;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 1;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			if(ShiftCount == 0 && shift_available == 0) begin
				ShiftCount = instruction[5:0];
				shift_available = 1;
				SR = 1;
				SR_SEL = 1;
			end
			if( shift_available == 1 ) begin
				if(ShiftCount == 0) begin
					shift_available= 0;
					SR = 0;
					SR_SEL = 0;
					RF_EN = 1;
					available = 0;
					fetch = 1;
				end
				else begin
					SR = 1;
					SR_SEL = 1;
				end
			end
			A_SEL = 2'b10;
			B_SEL = 2'b00;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			SL = 0;
			OAP = 3'b0;
		end
		default: 
		begin
		end
		endcase
	end
	4'b0111: // LW
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 1;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 1;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0101:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b10;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 1;
			RF_EN = 1;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b1000: // LWU
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 1;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b10;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 1;
			RF_EN = 1;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b1001: // LWL
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 1;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0101:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b11;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 1;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			OAP = 3'b0;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b1010: // SW
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 1;
			LDQ = 1;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b10;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 1;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 1;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 1;
			WB_SEL = 1;
			UL_SEL = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0101:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b10;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 1;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 1;
			WB_SEL = 1;
			UL_SEL = 1;
			OAP = 3'b0;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b1011: // SWU
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 1;
			LDQ = 1;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b10;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 1;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 1;
			WB_SEL = 1;
			UL_SEL = 1;
			OAP = 3'b0;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b1100: // SWL
	begin
		case(Count)
		4'b0010:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 1;
			LDA = 1;
			LDQ = 1;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 0;
			OAP = 3'b0;
			fetch = 0;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b10;
			INST_TYPE_MUX_SEL = 1;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 0;
			PLUS1_SEL = 1;
			RF_EN = 0;
			SR = 0;
			SL = 0;
			SR_SEL = 0;
			WR_EN = 1;
			WB_SEL = 1;
			UL_SEL = 0;
			OAP = 3'b0;
			available = 0;
			fetch = 1;
		end
		default: 
		begin
		end
		endcase
	end
	4'b0011: // DMADDR
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
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b00;
			PC_EN = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b0;
			fetch = 0;
			DATA_MEM_SEL = 0;
		end
		4'b0011:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b00;
			PC_EN = 0;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b0;
			fetch = 0;
			DATA_MEM_SEL = 1;
		end
		4'b0100:
		begin
			A_SEL = 2'b10;
			B_SEL = 2'b11;
			D_SEL = 2'b01;
			INST_TYPE_MUX_SEL = 0;
			LDA = 0;
			LDQ = 0;
			MULT_EN = 0; DIV_EN = 0;
			MUL_SEL = 2'b00;
			PC_MUX_SEL = 2'b00;
			PLUS1_SEL = 0;
			RF_EN = 0;
			OAP = 3'b0;
			DATA_MEM_SEL = 0;
			fetch = 1;
			available = 0;
		end
		default: 
			begin
			end
		endcase
	end
	
	default: 
	begin
		//fetch = 0;
	end
	endcase
end
endmodule