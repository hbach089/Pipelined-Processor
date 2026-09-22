library ieee;
use ieee.std_logic_1164.all;

entity test_tb is
end test_Tb;


architecture testbench of test_tb is
signal greset_tb,gclock_tb: std_logic;
signal MemWrite_tb,MemRead_tb:std_logic;
signal address_tb: std_logic_vector(7 downto 0);
signal write_data_tb: std_logic_vector(31 downto 0);
signal read_val1_tb,read_val2_tb: std_logic_vector(4 downto 0);
signal count_tb:std_logic_vector(7 downto 0);
signal read_data1_tb,read_data2_tb,read_val0t_tb,read_val1t_tb,read_val2t_tb,read_val3t_tb,ram_Result_tb:std_logic_vector(31 downto 0);
signal current_val_tb:integer;
signal load1_tb:std_logic;

	component test is
		port(greset,gclock:in std_logic;
			  MemWrite,MemRead:in std_logic;
			  address:in std_logic_vector(7 downto 0);
			  write_data:in std_logic_vector(31 downto 0);
			  read_val1,read_val2:in std_logic_vector(4 downto 0);
			  count:out std_logic_vector(7 downto 0);
			  read_data1,read_data2,read_val0t,read_val1t,read_val2t,read_val3t,ram_Result:out std_logic_vector(31 downto 0);
			  load1:out std_logic;
			  current_val:out integer);
	end component;
	
begin
	
	dut:test
		port map(greset=>greset_Tb,
					gclock=>gclock_tb,
					MemWrite=>MemWrite_tb,
					MemRead=>MemRead_tb,
					write_data=>write_data_tb,
					address=>address_tb,
					read_val1=>read_val1_tb,
					read_val2=>read_val2_tb,
					count=>count_tb,
					ram_result=>ram_result_tb,
					read_data1=>read_data1_tb,
					read_data2=>read_data2_tb,
					read_val0t=>read_val0t_tb,
					read_val1t=>read_val1t_tb,
					read_val2t=>read_val2t_tb,
					read_val3t=>read_val3t_tb,
					current_val=>current_val_tb,
					load1=>load1_tb);
					
	clock_process:process
	begin
		gclock_tb<='1';
		wait for 1ns;
		gclock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		greset_tb<='0','1' after 2ns;MemWrite_tb<='0';address_tb<="00000000";write_data_tb<=x"ffffffff";MemRead_tb<='0';
		wait for 20ns;
		read_val1_tb<="00000";read_val2_tb<="00001";
		wait for 10ns;
		read_val1_tb<="00000";read_val2_tb<="00011";address_tb<="00000001";
		wait for 10ns;
		MemWrite_tb<='1';address_tb<="00000001";MemRead_tb<='1';
		wait for 10ns;
		address_tb<="00000000";MemWrite_tb<='0';
		wait for 2ns;
		wait;
	end process;
	
end testbench;