library ieee;
use ieee.std_logic_1164.all;

entity demux_1x32_8bits_tb is
end demux_1x32_8bits_tb;

architecture testbench of demux_1x32_8bits_tb is
signal ipt_tb:std_logic_vector(4 downto 0);
signal opt0_tb,  opt1_tb,  opt2_tb,  opt3_tb,
       opt4_tb,  opt5_tb,  opt6_tb,  opt7_tb,
       opt8_tb,  opt9_tb,  opt10_tb, opt11_tb,
       opt12_tb, opt13_tb, opt14_tb, opt15_tb,
       opt16_tb, opt17_tb, opt18_tb, opt19_tb,
       opt20_tb, opt21_tb, opt22_tb, opt23_tb,
       opt24_tb, opt25_tb, opt26_tb, opt27_tb,
       opt28_tb, opt29_tb, opt30_tb, opt31_tb : std_logic;
		 
	component demux_1x32_8bits is
	port(ipt:in std_logic_vector(4 downto 0);
		  opt0,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,opt11,opt12,opt13,opt14,opt15,opt16,opt17,opt18,opt19,opt20,opt21,opt22,opt23,opt24,opt25,opt26,opt27,opt28,opt29,opt30,opt31:out std_logic);
	end component;

begin
	dut : demux_1x32_8bits
		 port map(
			  ipt   => ipt_tb,
			  opt0  => opt0_tb,
			  opt1  => opt1_tb,
			  opt2  => opt2_tb,
			  opt3  => opt3_tb,
			  opt4  => opt4_tb,
			  opt5  => opt5_tb,
			  opt6  => opt6_tb,
			  opt7  => opt7_tb,
			  opt8  => opt8_tb,
			  opt9  => opt9_tb,
			  opt10 => opt10_tb,
			  opt11 => opt11_tb,
			  opt12 => opt12_tb,
			  opt13 => opt13_tb,
			  opt14 => opt14_tb,
			  opt15 => opt15_tb,
			  opt16 => opt16_tb,
			  opt17 => opt17_tb,
			  opt18 => opt18_tb,
			  opt19 => opt19_tb,
			  opt20 => opt20_tb,
			  opt21 => opt21_tb,
			  opt22 => opt22_tb,
			  opt23 => opt23_tb,
			  opt24 => opt24_tb,
			  opt25 => opt25_tb,
			  opt26 => opt26_tb,
			  opt27 => opt27_tb,
			  opt28 => opt28_tb,
			  opt29 => opt29_tb,
			  opt30 => opt30_tb,
			  opt31 => opt31_tb);
					
	stim:process
	begin
		ipt_tb<="00000";
		wait for 2ns;
		ipt_tb<="00001";
		wait for 2ns;
		ipt_tb<="00010";
		wait for 2ns;
		ipt_tb<="00011";
		wait for 2ns;
		ipt_tb<="00111";
		wait for 2ns;
		ipt_tb<="00100";
		wait for 2ns;
		wait;
	end process;
	
end testbench;
