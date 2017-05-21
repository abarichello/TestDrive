library ieee;
use ieee.std_logic_1164.all;

entity Comparator1 is
	port (
		CNT_D:    in std_logic_vector(9 downto 0);
		END_TIME: out std_logic
	);
end Comparator1;

architecture compare1 of Comparator1 is
begin
	process(CNT_D)
	begin
		if (CNT_D = "0000000000")  then
			END_TIME <= '1';
		else
			END_TIME <= '0';
		end if;
	end process;
end compare1; 