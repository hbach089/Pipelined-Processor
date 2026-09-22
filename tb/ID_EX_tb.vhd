library ieee;
use ieee.std_logic_1164.all;

entity ID_EX_tb is
end ID_EX_tb;

architecture testbench of ID_EX_tb is
signal greset_tb,gclock_tb: std_logic;
signal control_signals_in_tb: std_logic_vector(8 downto 0);
signal func_field_in_tb:std_logic_vector(5 downto 0);
signal read_data1_in_tb,read_data2_in_tb:std_logic_vector(31 downto 0);
signal address_signextend_in_tb:std_logic_vector(31 downto 0);
signal rs_in_tb,rt_in_tb,rd_in_tb:std_logic_vector(31 downto 0);
signal read_data1_out_tb,read_data2_out_tb:std_logic_vector(31 downto 0);
signal rs_out_tb,rt_out_tb,rd_out_tb:std_logic_vector(31 downto 0);
signal control_signals_out_tb:std_logic_vector(8 downto 0);	
signal address_signextend_out_tb: std_logic_vector(31 downto 0);
signal func_field_out_tb:std_logic_vector(5 downto 0);
	
	component ID_EX is
	port(greset,gclock:in std_logic;
		  control_signals_in:in std_logic_vector(8 downto 0);
		  func_field_in:in std_logic_vector(5 downto 0);
		  read_data1_in,read_data2_in:in std_logic_vector(31 downto 0);
		  address_signextend_in:in std_logic_vector(31 downto 0);
		  rs_in,rt_in,rd_in:in std_logic_vector(31 downto 0);
		  read_data1_out,read_data2_out:out std_logic_vector(31 downto 0);
		  rs_out,rt_out,rd_out:out std_logic_vector(31 downto 0);
		  control_signals_out:out std_logic_vector(8 downto 0);
		  address_signextend_out:out std_logic_vector(31 downto 0);
		  func_field_out:out std_logic_vector(5 downto 0));
	end component;

begin
	dut:ID_EX
		port map(greset=>greset_tb,
					gclock=>gclock_tb,
					control_signals_in=>control_signals_in_tb,
					func_field_in=>func_field_in_tb,
					read_data1_in=>read_data1_in_tb,
					read_data2_in=>read_data2_in_tb,
					address_signextend_in=>address_signextend_in_tb,
					rs_in=>rs_in_tb,
					rt_in=>rt_in_tb,
					rd_in=>rd_in_tb,
					read_data1_out=>read_data1_out_tb,
					read_data2_out=>read_data2_out_tb,
					rs_out=>rs_out_tb,
					rt_out=>rt_out_Tb,
					rd_out=>rd_out_tb,
					control_signals_out=>control_signals_out_Tb,
					address_signextend_out=>address_signextend_out_Tb,
					func_field_out=>func_field_out_tb);
					
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
		control_signals_in_tb<="001110101";
		address_signextend_in_tb<=x"11110004";
		func_field_in_tb<="00000";
--		wait for 8ns;
		read_data1_in_tb<=x"FFFFFAFA";
		read_data2_in_tb<=x"BBBBBAFA";
--		wait for 8ns;
		rs_in_tb<=x"EEEEEEEE";
		rt_in_tb<=x"C0C0C0C0";
		rd_in_tb<=x"00000000";
		wait for 2ns;
		wait;
	end process;
					
end testbench;
