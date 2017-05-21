library ieee;
use ieee.std_logic_1164.all;

entity Comparator3 is
	port (
		CNT_B:     in std_logic_vector(4 downto 0);
		END_BONUS: out std_logic
	);
end Comparator3;

architecture compare3 of Comparator3 is
begin
	process(CNT_B)
	begin
		if (CNT_B = "00000") then
			END_BONUS <= '1';
		else
			END_BONUS <= '0';
		end if;
	end process;
end compare3; 