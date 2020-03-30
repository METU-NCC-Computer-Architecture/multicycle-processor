module ap_function (a, b, aop, f, ovf, cin, cout, n, z); 
  input [7:0] a, b;
  input cin;
  input  [2:0] aop; 
  output [7:0] f;
  output ovf, cout, n, z;
  reg z;
  reg [7:0] temp, carry, neg_a, neg_b;
  always @*
  begin
	 neg_a = ~a+1;
	 neg_b = ~b+1;
	 
	 
    case (aop) 
      3'b000   : 
			begin 
				
				  temp [0] <= (a[0] ^ b[0] ^ cin); 
				  carry[0] <= ((a[0] & b[0]) | ((a[0] ^ b[0]) & cin) );
				 
				  temp [1] <= (a[1] ^ b[1] ^ carry[0]); 
				  carry[1] <= ((a[1] & b[1]) | ((a[1] ^ b[1]) & carry[0]));
				  
				  temp [2] <= (a[2] ^ b[2] ^ carry[1]); 
				  carry[2] <= ((a[2] & b[2]) | ((a[2] ^ b[2]) & carry[1]));
				  
				  temp [3] <= (a[3] ^ b[3] ^ carry[2]); 
				  carry[3] <= ((a[3] & b[3]) | ((a[3] ^ b[3]) & carry[2]));
				  
				  temp [4] <= (a[4] ^ b[4] ^ carry[3]); 
				  carry[4] <= ((a[4] & b[4]) | ((a[4] ^ b[4]) & carry[3]));
				  
				  temp [5] <= (a[5] ^ b[5] ^ carry[4]); 
				  carry[5] <= ((a[5] & b[5]) | ((a[5] ^ b[5]) & carry[4]));
				  
				  temp [6] <= (a[6] ^ b[6] ^ carry[5]); 
				  carry[6] <= ((a[6] & b[6]) | ((a[6] ^ b[6]) & carry[5]));
				  
				  temp [7] <= (a[7] ^ b[7] ^ carry[6]); 
				  carry[7] <= ((a[7] & b[7]) | ((a[7] ^ b[7]) & carry[6]));
				
			end
				
				
		3'b001   : 
			begin
		
			     temp [0] <= (a[0] ^ neg_b[0] ^ cin); 
				  carry[0] <= ((a[0] & neg_b[0]) | ((a[0] ^ neg_b[0]) & cin) );
				 
				  temp [1] <= (a[1] ^ neg_b[1] ^ carry[0]); 
				  carry[1] <= ((a[1] & neg_b[1]) | ((a[1] ^ neg_b[1]) & carry[0]));
				  
				  temp [2] <= (a[2] ^ neg_b[2] ^ carry[1]); 
				  carry[2] <= ((a[2] & neg_b[2]) | ((a[2] ^ neg_b[2]) & carry[1]));
				  
				  temp [3] <= (a[3] ^ neg_b[3] ^ carry[2]); 
				  carry[3] <= ((a[3] & neg_b[3]) | ((a[3] ^ neg_b[3]) & carry[2]));
				  
				  temp [4] <= (a[4] ^ neg_b[4] ^ carry[3]); 
				  carry[4] <= ((a[4] & neg_b[4]) | ((a[4] ^ neg_b[4]) & carry[3]));
				  
				  temp [5] <= (a[5] ^ neg_b[5] ^ carry[4]); 
				  carry[5] <= ((a[5] & neg_b[5]) | ((a[5] ^ neg_b[5]) & carry[4]));
				  
				  temp [6] <= (a[6] ^ neg_b[6] ^ carry[5]); 
				  carry[6] <= ((a[6] & neg_b[6]) | ((a[6] ^ neg_b[6]) & carry[5]));
				  
				  temp [7] <= (a[7] ^ neg_b[7] ^ carry[6]); 
				  carry[7] <= ((a[7] & neg_b[7]) | ((a[7] ^ neg_b[7]) & carry[6]));
		
		   end
			
			
		3'b010   : 
			begin
			
			     temp [0] <= (neg_a[0] ^ b[0] ^ cin); 
				  carry[0] <= ((neg_a[0] & b[0]) | ((neg_a[0] ^ b[0]) & cin) );
				 
				  temp [1] <= (neg_a[1] ^ b[1] ^ carry[0]); 
				  carry[1] <= ((neg_a[1] & b[1]) | ((neg_a[1] ^ b[1]) & carry[0]));
				  
				  temp [2] <= (neg_a[2] ^ b[2] ^ carry[1]); 
				  carry[2] <= ((neg_a[2] & b[2]) | ((neg_a[2] ^ b[2]) & carry[1]));
				  
				  temp [3] <= (neg_a[3] ^ b[3] ^ carry[2]); 
				  carry[3] <= ((neg_a[3] & b[3]) | ((neg_a[3] ^ b[3]) & carry[2]));
				  
				  temp [4] <= (neg_a[4] ^ b[4] ^ carry[3]); 
				  carry[4] <= ((neg_a[4] & b[4]) | ((neg_a[4] ^ b[4]) & carry[3]));
				  
				  temp [5] <= (neg_a[5] ^ b[5] ^ carry[4]); 
				  carry[5] <= ((neg_a[5] & b[5]) | ((neg_a[5] ^ b[5]) & carry[4]));
				  
				  temp [6] <= (neg_a[6] ^ b[6] ^ carry[5]); 
				  carry[6] <= ((neg_a[6] & b[6]) | ((neg_a[6] ^ b[6]) & carry[5]));
				  
				  temp [7] <= (neg_a[7] ^ b[7] ^ carry[6]); 
				  carry[7] <= ((neg_a[7] & b[7]) | ((neg_a[7] ^ b[7]) & carry[6]));
				 			 
			end
		
		
		3'b011   : 
			begin
			
				  temp <= a | b;	
				  carry [7] <= 1'b0;
			end
		
		3'b100   : 
			begin
			
				  temp <= a & b;	
				  carry [7] <= 1'b0;
			end
			
		3'b101   : 
			begin
			
				  temp <= (~a) & b;	
				  carry [7] <= 1'b0;
			end
			
		3'b110   : 
			begin
			
				  temp <= a ^ b;	
				  carry [7] <= 1'b0;
			end
			
		3'b111   : 
			begin
			
				  temp <= a ~^ b;	
				  carry [7] <= 1'b0;
			end
			
		
    endcase 
	 
	 if(temp == 8'b00000000)
		z <= 1'b1;
	 
	 else
		z <= 1'b0; 
	 
  end
  
  assign ovf = ( carry[7] ^ carry[6] );
  assign n = temp[7];
  assign cout = carry[7];
  assign f = temp;
  
endmodule