library ieee;
use ieee.std_logic_1164.all;

entity REG_IN_15 is
port( SET_ROL,EN_TIME,CLOCK_M,RST: in std_logic;
		SPEED: in std_logic_vector(2 downto 0);
		REG_OUT_EXIT: out std_logic_vector(31 downto 0)
		);
end REG_IN_15;

architecture bhv of REG_IN_15 is
	signal enable: std_logic;
	signal signalshift: std_logic_vector((N-1) downto 0);

begin --incomplete
enable <= ((SPEED(2) or SPEED(1) or SPEED(0)) and EN_TIME);

	process(CLOCK_M,RST,SET_ROL)
	begin
		if RST = '1' then
			REG_OUT_EXIT <= (others => '0');
		elsif(CLOCK_M'event and CLOCK_M = '1') and enable = '1'then
			signalshift((N-2 downto 0) <= ((N-1 downto 1)));
			signalshift(N-1) <= '0';
		end if;
	end process;
	REG_OUT_EXIT <= signalshift;
end bhv;