library ieee;
use ieee.std_logic_1164.all;

entity PC_tb is
end PC_tb;

architecture testbench of PC_tb is
signal greset_tb,gclock_tb: std_logic;
signal PCLoad_tb:std_logic;
signal i_val_tb:std_logic_vector(31 downto 0);
signal o_val_tb:std_logic_vector(31 downto 0);
	
	component PC is
	port(greset,gclock:in std_logic;
		  PCLoad:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;

begin
	dut:PC
		port map(greset=>greset_tb,
					gclock=>gclock_tb,
					PCLoad=>PCLoad_tb,
					i_val=>i_val_tb,
					o_val=>o_val_tb);
					
	clk_process:process
	begin
		gclock_tb<='1';
		wait for 1ns;
		gclock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		greset_tb<='0','1' after 2ns;
		i_val_tb<=x"EE000E00";PCLoad_tb<='0';
		wait for 2ns;
		wait for 2ns;
		PCLoad_tb<='1';
		wait for 10ns;
		i_val_tb<=x"FFFFFF00";
		wait for 2ns;
		wait;
	end process;
					
end testbench;
