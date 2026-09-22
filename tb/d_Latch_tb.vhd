LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_Latch_tb IS
END d_Latch_tb;

ARCHITECTURE testbench OF d_Latch_tb IS
signal greset_tb:std_logic;
signal i_d_tb : STD_LOGIC;
signal i_enable_tb :  STD_LOGIC;
signal o_q_tb, o_qBar_tb : STD_LOGIC;

component d_Latch is
	PORT(greset:in std_logic;
	i_d : IN STD_LOGIC;
	i_enable : IN STD_LOGIC;
	o_q, o_qBar : OUT STD_LOGIC);
end component;

BEGIN
	dut:d_Latch
		port map(greset=>greset_tb,
					i_d=>i_d_tb,
					i_enable=>i_enable_tb,
					o_q=>o_q_tb,
					o_qBar=>o_qbar_tb);
					
	stim:process
	begin
		greset_tb<='0','1' after 2ns;
		i_d_tb<='0';
		i_enable_tb<='0';
		wait for 2ns;
		i_d_tb<='1';
		wait for 8ns;
		i_enable_tb<='1';
		wait for 2ns;
		I_d_tb<='0';
		wait for 2ns;
		i_enable_tb<='0';
		i_d_tb<='1';
		wait for 8ns;
		i_d_tb<='0';
		wait for 40ns;
		i_enable_tb<='1';
		wait;
	end process;
END testbench;