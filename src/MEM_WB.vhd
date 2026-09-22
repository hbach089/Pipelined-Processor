library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity MEM_WB is
	port(greset,gclock:in std_logic;
		  instruction_in:in std_logic_vector(31 downto 0);
		  control_signals_in:in std_logic_vector(1 downto 0);
		  rd_memwb,writeregister_val_in:in std_logic_vector(4 downto 0);
		  read_ram_in,write_data_in:in std_logic_vector(31 downto 0);
		  read_ram_out,write_data_out:out std_logic_vector(31 downto 0);
		  rd_memwb_out,writeregister_val_out:out std_logic_vector(4 downto 0);
		  control_signals_out:out std_logic_vector(1 downto 0);
		  instruction_out:out std_logic_vector(31 downto 0));
end MEM_WB;

architecture rtl of MEM_WB is

	component Register_32bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;
	
	component Register_9bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(8 downto 0);
		  o_val:out std_logic_vector(8 downto 0));
	end component;
	
	component Register_5bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(4 downto 0);
		  o_val:out std_logic_vector(4 downto 0));
	end component;
	
	component Register_6bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(5 downto 0);
		  o_val:out std_logic_vector(5 downto 0));
	end component;

	component Register_2bits is
		port(greset,gclock:in std_logic;
			  i_load:in std_logic;
			  i_val:in std_logic_vector(1 downto 0);
			  o_val:out std_logic_vector(1 downto 0));
	END component;


begin
	
	
	control_signal:Register_2bits 
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>control_signals_in,
					o_val=>control_signals_out);
					
	read_ram:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>read_ram_in,
					o_val=>read_ram_out);
	
	write_data:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>write_data_in,
					o_val=>write_data_out);
					
	writeregister_val:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>writeregister_val_in,
					o_val=>writeregister_val_out);
	
	rd:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>rd_memwb,
					o_val=>rd_memwb_out);
					
	instruction_val:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>instruction_in,
					o_val=>instruction_out);
					
end rtl;