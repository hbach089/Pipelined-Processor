library ieee;
use ieee.std_logic_1164.all;

entity test is
port(greset,gclock:in std_logic;
	  MemWrite,MemRead:in std_logic;
	  address:in std_logic_vector(7 downto 0);
	  write_data:in std_logic_vector(31 downto 0);
	  read_val1,read_val2:in std_logic_vector(4 downto 0);
	  count:out std_logic_vector(7 downto 0);
	  read_data1,read_data2,read_val0t,read_val1t,read_val2t,read_val3t,ram_Result:out std_logic_vector(31 downto 0);
	  load1:out std_logic;
	  current_val:out integer);
end test;


architecture rtl of test is
signal int_MemRead:std_logic;
signal int_count:std_logic_vector(2 downto 0);
signal int_read_data_ram,int_alu_result,int_write_data:std_logic_vector(31 downto 0);
signal int_count8bits:std_logic_vector(7 downto 0);
signal int_writeval:std_logic_vector(4 downto 0);
signal int_current_Val:integer;

	component RegisterFile is
	port(greset,gclock:in std_logic;
		  RegWrite:in std_logic;
		  read_val1,read_val2:in std_logic_vector(4 downto 0);
		  write_val:in std_logic_vector(4 downto 0);
		  write_data:in std_logic_vector(31 downto 0);
		  read_data1,read_data2:out std_logic_vector(31 downto 0);
		  read_val0t,read_val1t,read_val2t,read_val3t:out std_logic_vector(31 downto 0);
		  loadreg3:out std_logic);
	end component;
	
	component ALU is
	port(ipt1,ipt2:in std_logic_vector(7 downto 0);
		  operation:in std_logic_vector(2 downto 0);
		  alu_result:out std_logic_vector(7 downto 0);
		  zero:out std_logic);
	end component;
	
	component DM_RAM is
	port(greset,gclock:in std_logic;
		  MemWrite,MemRead:in std_logic;
		  address:in std_logic_vector(7 downto 0);
		  write_data:in std_logic_vector(31 downto 0);
		  read_data:out std_logic_vector(31 downto 0));
	end component;
	
	component RAM_async is
		port(greset,gclock:in std_logic;
			  MemWrite,MemRead:in std_logic;
			  address:in std_logic_vector(7 downto 0);
			  write_data:in std_logic_vector(31 downto 0);
			  read_data:out std_logic_vector(31 downto 0);
			  read_val0t,read_val1t,read_val2t,read_val3t:out std_logic_vector(31 downto 0);
			  load0,load1,load2:out std_logic;
			  load3:out integer);
	end component;
	
	component threebitcounter IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC_VECTOR(2 downto 0));
	END component;
	
begin
	
	int_writeval<="00" & int_count;
	RegisterFile_comp:RegisterFile
		port map(greset=>greset,
					gclock=>gclock,
					RegWrite=>'1',--RegWrite
					read_val1=>read_val1,
					read_val2=>read_val2,
					write_val=>int_writeval,
					write_data=>int_read_data_ram,
					read_val0t=>read_val0t,
					read_val1t=>open,
					read_val2t=>open,
					read_val3t=>open,
					loadreg3=>open);
					
--	alu_comp:ALU
--		port map(ipt1=>x"00",
--					ipt2=>x"01",
--					operation=>"010",
--					alu_result=>int_alu_result,
--					zero=>open);
				
	
	counter:threebitcounter 
		PORT map(i_resetBar=>greset, 
					i_load=>'1',
					i_clock=>gclock,
					o_Value=>int_count);
	int_count8bits<="00000" & int_count;
	
	int_MemRead<=(not(int_count(2)) and not(int_count(1)) and int_count(0)) or
					 (not(int_count(2)) and not(int_count(1)) and not(int_count(0)));

	ram:RAM_async 
		port map(greset=>greset,
					gclock=>gclock,
					MemWrite=>MemWrite,
					MemRead=>MemRead,
--					read_val=>int_count8bits,
					address=>address,
					write_data=>write_data,
					read_data=>int_read_data_ram,
					read_val0t=>open,
					read_val1t=>read_val1t,
					read_val2t=>read_val2t,
					read_val3t=>read_val3t,
					load0=>open,
					load1=>load1,
					load2=>open,
					load3=>int_current_Val);
	current_val<=int_current_val;
	
	count<=int_count8bits;				
	ram_Result<=int_read_data_ram;
--	ram_Result<=int_read_data_ram and (31 downto 0 => (greset));
end rtl;