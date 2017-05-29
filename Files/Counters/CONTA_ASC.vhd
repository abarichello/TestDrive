library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTA_ASC is
	port(
		SPEED: in std_logic_vector(2 downto 0);
		CLOCK_M,RST,EN_TIME: in std_logic;
		CNT_U: out std_logic_vector(9 downto 0)
	);
end CONTA_ASC;
	
architecture bhv of CONTA_ASC is
	signal counter: std_logic_vector(9 downto 0);
	signal enter: std_logic;
begin

enter <= (SPEED(2) or SPEED(1) or SPEED(0)) and (EN_TIME);

P1:process(CLOCK_M,RST)
	begin
		if RST = '1' then
			counter <= "0000000000";
		elsif CLOCK_M'EVENT and CLOCK_M = '1' and enter = '1' then 
			counter <= counter + '1';
			if counter(4 downto 0) = "01111" then
				counter(4 downto 0) <= "00000";
				counter(9 downto 5) <= counter(9 downto 5) + '1';
			end if;
		end if;
	end process; 
	CNT_U <= counter;
end bhv;