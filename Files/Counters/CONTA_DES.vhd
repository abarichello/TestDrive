library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTA_DES is
	port(
		EN_TIME,CLK1,RST: in std_logic;
		CNT_D: 				out std_logic_vector(9 downto 0)
	);
end CONTA_DES;
	
architecture bhv of CONTA_DES is
	signal counter: std_logic_vector(9 downto 0);
begin

process(CLK1,RST)
	begin
		if RST = '1' then
			counter <= "0100101001"; --resets to 99
		elsif CLK1'EVENT and CLK1 = '1' and EN_TIME = '1' then 
			counter <= counter - '1'; 
			if counter(4 downto 0) = "00000" then --If the first decimal is 0 decrease 1 from the LS number.
				counter(4 downto 0) <= "01001";
				counter(9 downto 5) <= counter(9 downto 5) - '1';
			end if;
		end if;
	end process; 
CNT_D <= counter;
end bhv;