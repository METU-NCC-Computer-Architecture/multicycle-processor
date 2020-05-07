module Front_Panel(RUN, CLR, A_M, MAN_CLK, CLK, clock, RUN_ind, CLR_ind, A_M_ind, PC_RST); 

output reg CLK;
output reg RUN_ind, CLR_ind, A_M_ind, PC_RST; 


input RUN, CLR, A_M, MAN_CLK, clock;



always @*
begin
	if(RUN)
	begin
		RUN_ind <= 1'b1;
		if(A_M==0)
			begin
			CLK <= clock;
			A_M_ind <= 1'b1;
			end
		if(A_M==1)
			begin
			 CLK <= MAN_CLK;
			A_M_ind <= 1'b0;
			end
	end
	
	if(RUN==0)
	begin
	RUN_ind <= 1'b0;
	end
	
	if(CLR==1)
	begin
	CLR_ind <= 1'b1;
	PC_RST <= 1'b1;
	end
	
	if(CLR==0)
	begin
	CLR_ind <= 1'b0;
	PC_RST <= 1'b0;
	end
	
	
end
endmodule