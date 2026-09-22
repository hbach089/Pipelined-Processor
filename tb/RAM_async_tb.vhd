library ieee;
use ieee.std_logic_1164.all;

entity RAM_async_tb is
end RAM_async_tb;

architecture testbench of RAM_async_tb is
signal greset_tb,gclock_tb: std_logic;
signal RegWrite_tb:std_logic;
signal read_val_tb:std_logic_vector(4 downto 0);
signal write_val_tb:std_logic_vector(4 downto 0);
signal write_data_tb:std_logic_vector(31 downto 0);
signal read_data_tb: std_logic_vector(31 downto 0);
signal read_val0t_tb,read_val1t_tb,read_val2t_tb,read_val3t_tb: std_logic_vector(31 downto 0);
signal load0_tb,load1_tb,load2_tb: std_logic;
signal load3_tb:integer;

	component RAM_async is
	port(greset,gclock:in std_logic;
		  RegWrite:in std_logic;
		  read_val:in std_logic_vector(4 downto 0);
		  write_val:in std_logic_vector(4 downto 0);
		  write_data:in std_logic_vector(31 downto 0);
		  read_data:out std_logic_vector(31 downto 0);
		  read_val0t,read_val1t,read_val2t,read_val3t:out std_logic_vector(31 downto 0);
		  load0,load1,load2:out std_logic;
		  load3:out integer);
	end component;
begin

	dut:RAM_async
		port map(greset=>greset_tb,
					gclock=>gclock_tb,
					RegWrite=>RegWrite_tb,
					read_val=>read_val_tb,
					write_val=>write_val_tb,
					write_data=>write_data_tb,
					read_data=>read_data_tb,
					read_val0t=>read_val0t_tb,
					read_val1t=>read_val1t_tb,
					read_val2t=>read_val2t_tb,
					read_val3t=>read_val3t_tb,
					load0=>load0_tb,
					load1=>load1_tb,
					load2=>load2_tb,
					load3=>load3_tb);
					
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
		read_val_tb<="00000";
		RegWrite_tb<='1';
		write_val_tb<="00011";
		write_data_tb<=x"00000FFF";
		wait for 8ns;
		write_val_tb<="00010";
		write_data_tb<=x"000EEEEE";
		wait for 8ns;
		read_val_tb<="00000";
		wait for 8ns;
		read_val_tb<="00001";
--		write_data_tb<=x"000000AA";
		wait;
	end process;
end testbench;