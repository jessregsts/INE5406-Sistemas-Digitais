library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity modwt_bloco_de_controle is 

	port(
		iniciar : in std_logic;
		reset : in std_logic;
		clock : in std_logic;
		
		computando_modwt:out std_logic;
		pronto:out std_logic
	);
end modwt_bloco_de_controle;

architecture behavior of modwt_bloco_de_controle is 
type estado is (s0,s1,s2,s3,s4,s5);

signal estado_atual:estado;

begin


	process(reset,clock)

	begin 

		if reset ='1' then

			estado_atual<=s0;

		elsif rising_edge(clock) then 
		
			case estado_atual is 
			
				when s0=>
				
					pronto <='1';
					computando_modwt<='0';
					
					if iniciar ='1' then
						estado_atual<=s1;
					else
						estado_atual<=s0;	
					end if;
					
				when s1=>
					
					computando_modwt<='1';
					
					estado_atual<=s1;
				
				when others =>
				
				estado_atual<=s0;
				
			end case;
		end if;
	end process;
	
end architecture;