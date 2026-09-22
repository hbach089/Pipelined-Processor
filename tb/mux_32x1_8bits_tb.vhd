library ieee;
use ieee.std_logic_1164.all;

use work.mux_ipt_array_type.all;

entity mux_32x1_8bits_tb is
end mux_32x1_8bits_tb;

architecture testbench of mux_32x1_8bits_tb is
signal ipt_tb: mux_ipt_array;
signal sel_tb:std_logic_vector(4 downto 0);
signal opt_tb:std_logic_vector(31 downto 0);

component mux_32x1_8bits is
port(ipt : in mux_ipt_array;
	  sel:in std_logic_vector(4 downto 0);
	  opt:out std_logic_vector(31 downto 0));
end component;

begin
	dut:mux_32x1_8bits
		port map(ipt=>ipt_tb,
				   sel=>sel_tb,
				   opt=>opt_tb);
	
	stim:process
	begin
		ipt_tb<=(x"00000000",x"11111111",x"ffffffff",x"aaaaaaaa",others => x"00000000");
--		ipt_tb<=x"11111111";ipt_tb<=x"ffffffff";ipt_tb<=x"aaaaaaaa";
		sel_tb<="00000";
		wait for 2ns;
		sel_tb<="00001";
		wait for 2ns;
		sel_tb<="00010";
		wait for 2ns;
		sel_tb<="00011";
		wait for 2ns;
		wait;
	end process;
		  
		  
end testbench;