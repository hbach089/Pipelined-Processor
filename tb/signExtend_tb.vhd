library ieee;
use ieee.std_logic_1164.all;

entity signExtend_Tb is
end signExtend_tb;

architecture testbench of signExtend_tb is

signal ipt_tb:std_logic_vector(15 downto 0);
signal opt_tb:std_logic_vector(31 downto 0);

	component signExtend is
	port(ipt:in std_logic_vector(15 downto 0);
		  opt:out std_logic_vector(31 downto 0));
	end component;

begin
	dut:signExtend
		port map(ipt=>ipt_tb,
					opt=>opt_tb);
					
	stim:process
	begin	
		ipt_tb<="1000000111101010";
		wait for 2ns;
		ipt_tb<="0111111111111110";
		wait for 2ns;
		wait;
	end process;
end testbench;