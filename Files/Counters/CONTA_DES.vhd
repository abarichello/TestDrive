library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTA_DES is
	port(
		EN_TIME,CLK1,RST: in std_logic;
		CNT_D: out std_logic_vector(9 downto 0)
	);
end CONTA_DES;
	
architecture bhv of CONTA_DES is
	signal counter: std_logic_vector(9 downto 0);
	
begin
P1:process(CLK1,RST)
	begin
		if RST = '0' then
			counter <= "01100011";
		else 
			counter <= counter - '1';
		end if;
	end process; 
	CNT_D <= counter;
end bhv;