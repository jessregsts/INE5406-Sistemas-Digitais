LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY demux1para4 IS
PORT (
f : IN std_logic;
sel : IN std_logic_vector (1 DOWNTO 0);
a, b, c, d : OUT std_logic
);
END demux1para4;

ARCHITECTURE arch OF demux1para4 IS
BEGIN

		a <= f WHEN sel = "00" ELSE '0';
		b <= f WHEN sel = "01" ELSE '0';
		c <= f WHEN sel = "10" ELSE '0';
		d <= f WHEN sel = "11" ELSE '0';
	
END arch;
