library ieee;
use ieee.std_logic_1164.all;

entity Comparator2 is
	port (
		CNT_U:  in std_logic_vector(9 downto 0);
		TARGET: out std_logic
	);
end Comparator2;

architecture compare2 of Comparator2 is
begin
	process(CNT_U)
	begin
		if (CNT_U = "0010000000") then
			TARGET <= '1';
		else
			TARGET <= '0';
		end if;
	end process;
end compare2; 