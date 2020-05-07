module ControlUnit(PC_RST, CLR, RUN, RST, CLK, RF_EN, MULT_EN, LDA, LDQ, PC_MUX_SEL, SR_SEL, PLUS1_SEL, SR, SL, A_SEL, B_SEL, PC_EN, MUL_SEL, INST_TYPE_MUX_SEL, D_SEL, OAP, DATA_MEM_SE, Cin, WB_SEL); 

output reg RST, RF_EN, MULT_EN, LDA, LDQ, SR_SEL, PLUS1_SEL, SR, SL, PC_EN, MUL_SEL, INST_TYPE_MUX_SEL, DATA_MEM_SE, Cin, WB_SEL;
output reg [1:0] PC_MUX_SEL, A_SEL, B_SEL, D_SEL;
output reg [2:0] OAP;

input CLR, RUN, CLK, PC_RST;

reg [3:0] Count;

initial
begin
	RST <= 1'b1;
	Count <= 4'b0;
	MUL_SEL <= 1'b0;
end

always @(posedge CLK)
begin
	
end
endmodule