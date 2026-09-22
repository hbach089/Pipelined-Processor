LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY twobitcounter_tb IS
END twobitcounter_tb;

ARCHITECTURE testbench OF twobitcounter_tb IS
signal i_resetBar_tb, i_writeRam_tb	: STD_LOGIC;
signal i_clock_tb			: 	STD_LOGIC;
signal o_Value_Tb			: 	STD_LOGIC_VECTOR(1 downto 0);
signal gt_eq_1_tb: std_logic;

	COMPONENT twobitcounter IS
		PORT(
			i_resetBar, i_writeRam	: IN	STD_LOGIC;
			i_clock			: IN	STD_LOGIC;
			o_Value			: OUT	STD_LOGIC_VECTOR(1 downto 0);
			gt_eq_1:out std_logic);
	END COMPONENT;


BEGIN

	dut:twobitcounter
		port map(i_resetbar=>i_resetbar_tb,
					i_writeRam=>i_writeRam_tb,
					i_clock=>i_clock_tb,
					o_value=>o_value_tb,
					gt_eq_1=>gt_eq_1_tb);
					
	clock_process:process
	begin
		i_clock_tb<='1';
		wait for 1ns;
		i_clock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		i_resetbar_tb<='0','1' after 2ns;
		i_writeRam_tb<='0';
		wait for 8ns;
		i_writeRam_tb<='1';
		wait for 20ns;
		i_writeRam_tb<='0';
		wait for 2ns;
		wait;
	end process;
END testbench;
