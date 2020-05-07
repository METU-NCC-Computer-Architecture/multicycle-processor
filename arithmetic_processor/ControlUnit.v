module ControlUnit(instruction, PC_RST, CLR, RUN, RST, CLK, RF_EN, MULT_EN, LDA, LDQ, PC_MUX_SEL, SR_SEL, PLUS1_SEL, SR, SL, A_SEL, B_SEL, PC_EN, MUL_SEL, INST_TYPE_MUX_SEL, D_SEL, OAP, DATA_MEM_SE, Cin, WB_SEL); 

output reg RST, RF_EN, MULT_EN, LDA, LDQ, SR_SEL, PLUS1_SEL, SR, SL, PC_EN, MUL_SEL, INST_TYPE_MUX_SEL, DATA_MEM_SE, Cin, WB_SEL;
output reg [1:0] PC_MUX_SEL, A_SEL, B_SEL, D_SEL;
output reg [2:0] OAP;

input CLR, RUN, CLK, PC_RST;
input [15:0] instruction;


reg [3:0] Count;
reg Operation;

initial
begin
	RST <= 1'b1;
	Count <= 4'b0;
	MUL_SEL <= 1'b0;
end

always @(posedge CLK)
begin
	if (Operation == 1)
		Count <= Count + 1'b1;
	else
	Count <= 4'b0;
	
	case (instruction [15:12])
		4'b0000: 
		begin
			Operation = 1;
			case(Count)
			4'b0000:
				begin
						PC_EN <= 1;
						
				end
			
			endcase
			
		end
		
		
		endcase
end
endmodule