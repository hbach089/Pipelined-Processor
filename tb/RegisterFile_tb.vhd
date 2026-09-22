library ieee;
use ieee.std_logic_1164.all;

entity RegisterFile_Tb is
end RegisterFile_tb;

architecture rtl of RegisterFile_tb is
signal greset_tb,gclock_tb:std_logic;
signal RegWrite_tb:std_logic;
signal read_val1_tb,read_val2_tb:std_logic_vector(4 downto 0);
signal write_val_tb:std_logic_vector(4 downto 0);
signal write_data_tb:std_logic_vector(31 downto 0);
signal read_data1_tb,read_data2_tb:std_logic_vector(31 downto 0);
signal read_val0t_tb,read_val1t_Tb,read_val2t_tb,read_val3t_tb,read_val4t_tb: std_logic_vector(31 downto 0);

	component RegisterFile is
		port(greset,gclock:in std_logic;
			  RegWrite:in std_logic;
			  read_val1,read_val2:in std_logic_vector(4 downto 0);
			  write_val:in std_logic_vector(4 downto 0);
			  write_data:in std_logic_vector(31 downto 0);
			  read_data1,read_data2:out std_logic_vector(31 downto 0);
			  read_val0t,read_val1t,read_val2t,read_val3t,read_val4t:out std_logic_vector(31 downto 0));
	end component;
	
BEGIN

	dut:RegisterFile
		port map(greset=>greset_tb,
					gclock=>gclock_tb,
					RegWrite=>RegWrite_tb,
					read_val1=>read_val1_tb,
					read_val2=>read_val2_tb,
					write_val=>write_val_tb,
					write_data=>write_data_tb,
					read_data1=>read_data1_tb,
					read_data2=>read_data2_tb,
					read_val0t=>read_val0t_tb,
					read_val1t=>read_val1t_tb,
					read_val2t=>read_val2t_tb,
					read_val3t=>read_val3t_Tb,
					read_val4t=>read_val4t_Tb);
					
	clock_process:process
	begin
		gclock_tb<='1';
		wait for 1ns;
		gclock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		greset_tb<='0','1' after 2ns;
		read_val1_tb<="00000";read_val2_tb<="00000";
		RegWrite_tb<='1';
		write_val_tb<="00011";
		write_data_tb<=x"ffff0011";
		wait for 2ns;
		read_val1_tb<="00011";
		RegWrite_tb<='0';
		wait for 10ns;
		RegWrite_tb<='1';
		write_val_tb<="00001";
		write_data_tb<=x"11111111";
		read_val2_tb<="00001";
		wait for 2ns;
		wait;
	end process;

end rtl;