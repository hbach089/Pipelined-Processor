LIBRARY lpm,IEEE;
use IEEE.std_logic_1164.all;
USE lpm.lpm_components.all;

entity IM_ROM_tb is
end IM_ROM_tb;

architecture testbench of IM_ROM_tb is
signal gclock_tb:std_logic;
signal address_tb:std_logic_vector(7 downto 0);
signal instruction_tb:std_logic_vector(31 downto 0);

component IM_ROM is
port(gclock:in std_logic;
	  address:in std_logic_vector(7 downto 0);
	  instruction:out std_logic_vector(31 downto 0));
end component;

begin

	dut:IM_ROM
		port map(gclock=>gclock_tb,
					address=>address_tb,
					instruction=>instruction_tb);
	
	clock_process:process
	begin
		gclock_tb<='1';
		wait for 1ns;
		gclock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		address_tb<=X"00";
		wait for 2ns;
		address_tb<=X"04";
		wait for 2ns;
		address_tb<=X"0C";
		wait;
	end process;
end testbench;