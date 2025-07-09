library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;


ENTITY test IS
END ENTITY test;

ARCHITECTURE TestB OF test IS
	
	CONSTANT period: TIME :=20 us;
	
	signal iniciar_t,reset_t,clock_t,pronto_t,computando_modwt_t,finished :std_logic:='0';
	signal entrada_t,ca_1_t,ca_2_t,ca_3_t,ca_4_t,cd_1_t,cd_2_t,cd_3_t,cd_4_t,saida_da_ultima_inversa_t:std_logic_vector(15 downto 0):=(others=>'0');

	
	
	
BEGIN

DUT: entity work.modwt

	PORT MAP ( iniciar_t,reset_t,clock_t,entrada_t,ca_1_t,ca_2_t,ca_3_t,ca_4_t,cd_1_t,cd_2_t,cd_3_t,cd_4_t,saida_da_ultima_inversa_t,pronto_t ,computando_modwt_t);
-----------------------------------------------------------------------------------------------------------------------------------------
	
	
	
	
	clock_t <= not clock_t after period/2 when finished /= '1' else '0';
	
	PROCESS

		FILE infile2 : TEXT IS IN "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\sweep_100_4k_fs8k.hex";
		VARIABLE in_line2 : LINE;
		VARIABLE in_val2  : std_logic_vector(15 DOWNTO 0);
		VARIABLE ReadOK2  : boolean;
	BEGIN
	
		reset_t<='1'; 
		iniciar_t<='0';
		
	 wait for 160 ns;

		reset_t<='0';
		iniciar_t<='1';
	 
	 wait for 80 ns;
	
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		WHILE NOT(ENDFILE(infile2)) LOOP
		
			READLINE(infile2, in_line2);
			
			HREAD(in_line2, in_val2, ReadOK2);
			
			WAIT FOR period ;  
					entrada_t <= in_val2;
		END LOOP;
		
	 finished <= '1';
	 
    assert false report "Test done." severity note;
	 
	 wait;
	 
	END PROCESS;
	
	-- escreve as saidas
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\ca_1.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, ca_1_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\ca_2.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, ca_2_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\ca_3.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, ca_3_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\ca_4.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, ca_4_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\cd_1.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, cd_1_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\cd_2.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, cd_2_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\cd_3.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, cd_3_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\cd_4.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t'EVENT;
		HWRITE(out_line1, cd_4_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	-------------------------------------------------------------------------------------------------
	
	
	PROCESS
		FILE outfile1 : TEXT IS OUT "C:\engenharia_trabalhos\sitemas_digitais\trabalho_final\entraga_modwt\entrada_saida_de_dados\saida_ultima_inversa.hex";
		VARIABLE out_line1 : LINE;
	BEGIN
	
		WAIT UNTIL clock_t = '1' AND clock_t 'EVENT;
		HWRITE(out_line1, saida_da_ultima_inversa_t);
		WRITELINE(outfile1, out_line1);
	END PROCESS;
	
	

END ARCHITECTURE TestB;