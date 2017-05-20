library ieee;
use ieee.std_logic_1164.all;

entity Comparator5 is
port (
	ZERO: in std_logic_vector(4 downto 0);
	CNT_B: in std_logic_vector(4 downto 0);
	END_BONUS: out std_logic
);
end Comparator5;

architecture compare5 of Comparator5 is
begin
	process(ZERO,CNT_B)
	begin
		if CNT_B = ZERO then
			END_BONUS <= '1';
		else
			END_BONUS <= '0';
		end if;
	end process;
end compare5; 