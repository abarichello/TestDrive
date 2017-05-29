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
		signal cont1,cont2,cont3,cont4,cont5: integer := 1;
begin
	
P1:process(CLOCK_50)
	begin
		cont1 <= cont1 + 1;
		cont2 <= cont2 + 1;
		cont3 <= cont3 + 1;
		cont4 <= cont4 + 1;
		cont5 <= cont5 + 1;
		
		if cont1 = 50000000 then
			CLK1 <= '1';
			cont1 <= 0;
		else
			CLK1 <= '0';
		end if;
		
		if cont2 = 25000000 then
			CLK1 <= '1';
			cont1 <= 0;
		else
			CLK1 <= '0';
		end if;
		
		if cont3 = 16666666 then
			CLK3 <= '1';
			cont3 <= 0;
		else
			CLK3 <= '0';
		end if;
		
		if cont4 = 12500000 then
			CLK4 <= '1';
			cont4 <= 0;
		else
			CLK4 <= '0';
		end if;
		
		if cont5 = 10000000 then
			CLK5 <= '1';
			cont5 <= 0;
		else
			CLK5 <= '0';
		end if;
	end process; 
end bhv;