library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_Clock is
	port(
		clock_50: in std_logic;
		CLK1,CLK2,CLK3,CLK4,CLK5: out std_logic
	);
end FSM_Clock;
	
architecture bhv of FSM_Clock is
		type STATES is (E0 ,E1,E2,E3,E4);
		signal EA,PE: STATES;
		signal C50: std_logic;
		signal contador: std_logic_vector(27 downto 0);
	--	TODO finish this.
	begin
		P1:process(CLOCK_50)
		begin
			if CLOCK_50'event and CLOCK_50= '0' then
				EA <= E0;
				contador <= x"0000000";
			end if;
				if C50 = '1' then
					EA <= PE;
				end if;
				contador <= contador + 1;
				if contador = x"2FAF07F" then
					contador <= x"0000000";
					C50 <='1';
				else
					C50 <='0';
				end if;
			
		end process;
		
		P2: process(EA)
		begin
			case EA is
				when E0 =>
				--	contagem <= "0001";
				--	PE <= E1;
				when E1 =>
				--	contagem <= "0010";
				--	PE <= E2;
				when E2 =>
				--	contagem <= "0011";
				--	PE <= E3;
				when E3 =>
				--	contagem <= "0100";
				--	PE <= E4;
				when E4 =>
				--	contagem <= "0101";
				--	PE <= E0;
			end case;
		end process; 
end bhv;