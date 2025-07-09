library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity modwt is 

		GENERIC (
			num_bits_ent : INTEGER :=16; -- numero de bits da entrada
			num_bits_coef : INTEGER:=16 ; -- numero de bits dos coeficientes
				
			nivel:integer:=4
		);

	port(
		iniciar: in std_logic;
		reset  : in std_logic;
		clock  : in std_logic;
		
		entrada:in std_logic_vector(num_bits_ent-1 downto 0);
		
		ca_1:out std_logic_vector(num_bits_ent-1 downto 0);
		ca_2:out std_logic_vector(num_bits_ent-1 downto 0);
		ca_3:out std_logic_vector(num_bits_ent-1 downto 0);
		ca_4:out std_logic_vector(num_bits_ent-1 downto 0);
		
		cd_1:out std_logic_vector(num_bits_ent-1 downto 0);
		cd_2:out std_logic_vector(num_bits_ent-1 downto 0);
		cd_3:out std_logic_vector(num_bits_ent-1 downto 0);
		cd_4:out std_logic_vector(num_bits_ent-1 downto 0);
		
		saida_da_ultima_inversa: out std_logic_vector (num_bits_ent-1 downto 0);
		
		pronto :out std_logic;
		computando_modwt :out std_logic
		
	);
end modwt;

architecture behavior of modwt is 

signal ca_1_s,ca_2_s,ca_3_s,ca_4_s,cd_1_s,cd_2_s,cd_3_s,cd_4_s,saida_da_ultima_inversa_s:signed(num_bits_ent-1 downto 0);

component modwt_bloco_de_controle

	port(
		iniciar : in std_logic;
		reset : in std_logic;
		clock : in std_logic;
		
		computando_modwt:out std_logic;
		pronto:out std_logic
	);
	
end component;

component modwt_bloco_operativo

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

end component;

begin

ca_1<=std_logic_vector(ca_1_s);
ca_2<=std_logic_vector(ca_2_s);
ca_3<=std_logic_vector(ca_3_s);
ca_4<=std_logic_vector(ca_4_s);

cd_1<=std_logic_vector(cd_1_s);
cd_2<=std_logic_vector(cd_2_s);
cd_3<=std_logic_vector(cd_3_s);
cd_4<=std_logic_vector(cd_4_s);

saida_da_ultima_inversa<=std_logic_vector(saida_da_ultima_inversa_s);




 b_operativo: modwt_bloco_operativo generic map(num_bits_ent,num_bits_coef,nivel) port map(signed(entrada),clock,ca_1_s,ca_2_s,ca_3_s,ca_4_s,cd_1_s,cd_2_s,cd_3_s,cd_4_s,saida_da_ultima_inversa_s,reset);
 
 b_controle: modwt_bloco_de_controle port map(iniciar,reset,clock,computando_modwt,pronto);




	
end architecture;