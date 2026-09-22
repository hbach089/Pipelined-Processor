library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_5bits_tb is
end mux_2x1_5bits_tb;

architecture testbench of mux_2x1_5bits_tb is
signal a_tb,b_tb: std_logic_vector(4 downto 0);
signal sel_tb:std_logic;
signal opt_tb:std_logic_vector(4 downto 0);

component mux_2x1_5bits is
port(a,b:in std_logic_vector(4 downto 0);
	  sel:in std_logic;
	  opt:out std_logic_vector(4 downto 0));
end component;

begin
	dut:mux_2x1_5bits
		port map(a=>a_tb,
					b=>b_tb,
				   sel=>sel_tb,
				   opt=>opt_tb);
	
	stim:process
	begin
		a_tb<="00000";b_tb<="11111";
		sel_tb<='0';
		wait for 2ns;
		sel_tb<='1';
		wait for 2ns;
		wait;
	end process;
		  
		  
end testbench;