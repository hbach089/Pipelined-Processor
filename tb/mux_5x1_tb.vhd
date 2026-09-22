library ieee;
use ieee.std_logic_1164.all;

entity mux_5x1_tb is
end mux_5x1_tb;

architecture testbench of mux_5x1_tb is
signal a_tb,b_tb,c_tb,d_tb,e_Tb:std_logic_vector(7 downto 0);
signal sel_tb:std_logic_vector(2 downto 0);
signal opt_tb:std_logic_vector(7 downto 0);

component mux_5x1 is
port(a,b,c,d,e:in std_logic_vector(7 downto 0);
	  sel:in std_logic_vector(2 downto 0);
	  opt:out std_logic_vector(7 downto 0));
end component;

begin
	dut:mux_5x1
		port map(a=>a_tb,
					b=>b_tb,
					c=>c_tb,
					d=>d_tb,
					e=>e_tb,
					sel=>sel_tb,
					opt=>opt_Tb);

	stim:process
	begin
		a_tb<="00000000";
		b_tb<="00000001";
		c_tb<="00000010";
		d_tb<="00000100";
		e_Tb<="11111111";
		sel_tb<="000";
		wait for 2ns;
		sel_tb<="001";
		wait for 2ns;
		sel_tb<="010";
		wait for 2ns;
		sel_tb<="110";
		wait for 2ns;
		sel_tb<="111";
		wait for 2ns;
		sel_tb<="011";
		wait for 2ns;
		wait;
	end process;
end testbench;