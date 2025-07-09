 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;



entity modwt_bloco_operativo is 
	GENERIC (
					W1 : INTEGER ; -- Input and output bit width 
					W2 : INTEGER ; -- multiplication bit width
					
					level:integer

			);

			port(
			
			in_x : IN signed(w1-1 DOWNTO 0);
			clock			: in std_logic;
	
			ca_1: out signed(W1-1 downto 0);
			ca_2: out signed(W1-1 downto 0);
			ca_3: out signed(W1-1 downto 0);
			ca_4: out signed(W1-1 downto 0);
			
			cd_1:out signed(W1-1 downto 0);
			cd_2:out signed(W1-1 downto 0);
			cd_3:out signed(W1-1 downto 0);
			cd_4:out signed(W1-1 downto 0);
			
			out_y :out signed(W1-1 downto 0);
			reset_m: in std_logic	
			);

end modwt_bloco_operativo;

architecture main of modwt_bloco_operativo is


component modwt_transformada_direta

GENERIC (
					W1 : INTEGER ; -- Input and output bit width   
					W2 : INTEGER ;--32 -- coeficients width	
					num_coef: INTEGER;
					n_delay:integer
			);

			port(
			
			x_in : in signed(W1-1 DOWNTO 0):=(others=>'0');
			clk  : in std_logic;
			reset: in std_logic;
			output_low_des : out signed(W1-1 DOWNTO 0);
			output_high_des : out signed(W1-1 downto 0)
			);

end component;


component modwt_transformada_inversa 
	GENERIC (
					W1 : integer ; -- Input and output bit width   
					W2 : integer ;--32 -- coeficients width	
					num_coef: integer;
					n_delay:integer
					
			);

			port(
			
			rec_low_in : IN signed(w2-1 DOWNTO 0);
			rec_high_in : IN signed(W2-1 downto 0);
			reset: in std_logic;
			clk			: in std_logic;
			y_out: out signed(W2-1 downto 0)
			);
			
end component;
			

component shift_register
			GENERIC (
				data_num_bits : integer; -- multiplication bit width (W1*2)
				DELAY_W: integer  --15 ate 25 fs/2			
			);
			

			port(
				x_in : IN signed(w1-1 DOWNTO 0);
				clock :  in std_logic;
				reset: in std_logic;
				enable: in std_logic;
				x_out : out signed(w1-1 downto 0)
			);
end component;








type vector_2 is array(level-1 downto 0) of signed(W1-1 downto 0);
signal low_des,high_des,out_delay:vector_2; 


signal out_s:vector_2;





	begin
	
	


		comp_nivel_1:
		
			if level = 1 generate
			
				descontruction_0: modwt_transformada_direta generic map (16,16,10,1) port map(x_in=>in_x,clk=>clock ,reset=>reset_m,output_low_des=>low_des(0),output_high_des=>high_des(0));
				reconstruction_0: modwt_transformada_inversa generic map (16,16,10,1)  port map(rec_low_in=>low_des(0),rec_high_in=>high_des(0),reset=>reset_m,clk=>clock,y_out=>out_s(0));
				
				--saidas
				
				ca_1<=low_des(0);
				ca_2<=(others=>'0');
				ca_3<=(others=>'0');
				ca_4<=(others=>'0');
				
				cd_1<=high_des(0);
				cd_2<=(others=>'0');
				cd_3<=(others=>'0');
				cd_4<=(others=>'0');
				
				
				out_y<=out_s(level-1);
			
			end generate;
			
		comp_nivel_2:
		
			if level = 2 generate
			
			
				descontruction_0: modwt_transformada_direta generic map(16,16,10,1) port map(x_in=>in_x,clk=>clock ,reset=>reset_m,output_low_des=>low_des(0),output_high_des=>high_des(0));
				descontruction_1: modwt_transformada_direta generic map(16,16,10,2) port map(x_in=>low_des(0),clk=>clock ,reset=>reset_m,output_low_des=>low_des(1),output_high_des=>high_des(1));
				
				shift_reg1: shift_register generic map(16,20) port map(x_in=>high_des(0),clock=>clock,reset=>reset_m,enable=>'1',x_out=>out_delay(0));
				
				reconstruction_0: modwt_transformada_inversa generic map (16,16,10,2)  port map(rec_low_in=>low_des(1),rec_high_in=>high_des(1),reset=>reset_m,clk=>clock,y_out=>out_s(0));
				reconstruction_1: modwt_transformada_inversa generic map (16,16,10,1)  port map(rec_low_in=>out_s(0),rec_high_in=>out_delay(0),reset=>reset_m,clk=>clock,y_out=>out_s(1));
				
				--saidas
				ca_1<=low_des(0);
				ca_2<=low_des(1);
				ca_3<=(others=>'0');
				ca_4<=(others=>'0');
				
				cd_1<=high_des(0);
				cd_2<=high_des(1);
				cd_3<=(others=>'0');
				cd_4<=(others=>'0');
				
				
				out_y<=out_s(level-1);
				
			end generate;
			
		 comp_nivel_3:
		
			if level = 3 generate
			
			
				descontruction_0: modwt_transformada_direta generic map(16,16,10,1) port map(x_in=>in_x,clk=>clock ,reset=>reset_m,output_low_des=>low_des(0),output_high_des=>high_des(0));
				descontruction_1: modwt_transformada_direta generic map(16,16,10,2) port map(x_in=>low_des(0),clk=>clock ,reset=>reset_m,output_low_des=>low_des(1),output_high_des=>high_des(1));
				descontruction_2: modwt_transformada_direta generic map(16,16,10,4) port map(x_in=>low_des(1),clk=>clock ,reset=>reset_m,output_low_des=>low_des(2),output_high_des=>high_des(2));
				
				shift_reg1: shift_register generic map(16,58) port map(x_in=>high_des(0),clock=>clock,reset=>reset_m,enable=>'1',x_out=>out_delay(0));
				shift_reg2: shift_register generic map(16,38) port map(x_in=>high_des(1),clock=>clock,reset=>reset_m,enable=>'1',x_out=>out_delay(1));
				
				reconstruction_0: modwt_transformada_inversa generic map (16,16,10,4)  port map(rec_low_in=>low_des(2),rec_high_in=>high_des(2),reset=>reset_m,clk=>clock,y_out=>out_s(0));
				reconstruction_1: modwt_transformada_inversa generic map (16,16,10,2)  port map(rec_low_in=>out_s(0),rec_high_in=>out_delay(1),reset=>reset_m,clk=>clock,y_out=>out_s(1));
				reconstruction_2: modwt_transformada_inversa generic map (16,16,10,1)  port map(rec_low_in=>out_s(1),rec_high_in=>out_delay(0),reset=>reset_m,clk=>clock,y_out=>out_s(2));
				
				-- saidas
				
				ca_1<=low_des(0);
				ca_2<=low_des(1);
				ca_3<=low_des(2);
				ca_4<=(others=>'0');
				
				cd_1<=high_des(0);
				cd_2<=high_des(1);
				cd_3<=high_des(2);
				cd_4<=(others=>'0');
				
				out_y<=out_s(level-1);
				
			end generate;
			
			comp_nivel_4:
			
			if level = 4 generate
			
			
				descontruction_0: modwt_transformada_direta generic map(16,16,10,1) port map(x_in=>in_x,clk=>clock ,reset=>reset_m,output_low_des=>low_des(0),output_high_des=>high_des(0));
				descontruction_1: modwt_transformada_direta generic map(16,16,10,2) port map(x_in=>low_des(0),clk=>clock ,reset=>reset_m,output_low_des=>low_des(1),output_high_des=>high_des(1));
				descontruction_2: modwt_transformada_direta generic map(16,16,10,4) port map(x_in=>low_des(1),clk=>clock ,reset=>reset_m,output_low_des=>low_des(2),output_high_des=>high_des(2));
				descontruction_3: modwt_transformada_direta generic map(16,16,10,8) port map(x_in=>low_des(2),clk=>clock ,reset=>reset_m,output_low_des=>low_des(3),output_high_des=>high_des(3));
				
				shift_reg1: shift_register generic map(16,132) port map(x_in=>high_des(0),clock=>clock,reset=>reset_m,enable=>'1',x_out=>out_delay(0));
				shift_reg2: shift_register generic map(16,112) port map(x_in=>high_des(1),clock=>clock,reset=>reset_m,enable=>'1',x_out=>out_delay(1));
				shift_reg3: shift_register generic map(16,74) port map(x_in=>high_des(2),clock=>clock,reset=>reset_m,enable=>'1',x_out=>out_delay(2));
				
				reconstruction_0: modwt_transformada_inversa generic map (16,16,10,8)  port map(rec_low_in=>low_des(3),rec_high_in=>high_des(3),reset=>reset_m,clk=>clock,y_out=>out_s(0));
				reconstruction_1: modwt_transformada_inversa generic map (16,16,10,4)  port map(rec_low_in=>out_s(0),rec_high_in=>out_delay(2),reset=>reset_m,clk=>clock,y_out=>out_s(1));
				reconstruction_2: modwt_transformada_inversa generic map (16,16,10,2)  port map(rec_low_in=>out_s(1),rec_high_in=>out_delay(1),reset=>reset_m,clk=>clock,y_out=>out_s(2));
				reconstruction_3: modwt_transformada_inversa generic map (16,16,10,1)  port map(rec_low_in=>out_s(2),rec_high_in=>out_delay(0),reset=>reset_m,clk=>clock,y_out=>out_s(3));
				
				ca_1<=low_des(0);
				ca_2<=low_des(1);
				ca_3<=low_des(2);
				ca_4<=low_des(3);
				
				cd_1<=high_des(0);
				cd_2<=high_des(1);
				cd_3<=high_des(2);
				cd_4<=high_des(3);
				
				out_y<=out_s(level-1);
				
			end generate;
			


		
	
	
	
	

	
				

end main;