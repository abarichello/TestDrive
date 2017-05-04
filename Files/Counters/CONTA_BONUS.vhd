library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTA_BONUS is
	port(
		REG_OUT_31,CLOCK_M,RST,EN_TIME: in std_logic;
		CNT_B: 								  out std_logic_vector(4 downto 0)
	);
end CONTA_BONUS;
	
architecture bhv of CONTA_BONUS is
	signal counter: std_logic_vector(4 downto 0);
	signal enter: std_logic;
	
begin
enter <= REG_OUT_31 and EN_TIME;
process(CLOCK_M,RST)
	begin
		if RST = '1' then
			counter <= "00011";
		elsif CLOCK_M'EVENT and CLOCK_M = '1' and enter = '1' then 
			counter <= counter - '1';
		end if;
	end process; 
CNT_B <= counter;
end bhv;