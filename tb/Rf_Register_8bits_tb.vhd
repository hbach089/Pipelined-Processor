library ieee;
use ieee.std_logic_1164.all;

entity Rf_Register_8bits_tb is
end Rf_Register_8bits_tb;

architecture testbench of Rf_Register_8bits_tb is
signal greset_tb,gclock_tb: std_logic;
signal i_load_tb: std_logic;
signal i_val_tb:std_logic_vector(7 downto 0);
signal o_val_tb:std_logic_vector(7 downto 0);
	
	component Rf_Register_8bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(7 downto 0);
		  o_val:out std_logic_vector(7 downto 0));
	end component;

begin
	dut:Rf_Register_8bits
		port map(greset=>greset_tb,
					gclock=>gclock_tb,
					i_load=>i_load_tb,
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
		i_load_tb<='1';
		i_val_tb<="11000100";
		wait for 2ns;
		i_val_tb<="11001111";
		wait for 2ns;
		i_val_tb<="00000100";
		wait for 2ns;
		wait;
	end process;
					
end testbench;
