library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity EX_MEM is
port(greset,gclock:in std_logic;
	     instruction_in:in std_logic_vector(31 downto 0);
		  control_signals_in:in std_logic_vector(4 downto 0);
		  rd_exmem:in std_logic_vector(4 downto 0);
		  ram_address_in,alu_output_in:in std_logic_vector(31 downto 0);
		  writeregister_val_in:in std_logic_vector(4 downto 0);
		  ram_address_out,alu_output_out:out std_logic_vector(31 downto 0);
		  writeregister_val_out:out std_logic_vector(4 downto 0);
		  rd_exmem_out:out std_logic_vector(4 downto 0);
		  control_signals_out:out std_logic_vector(4 downto 0);
		  instruction_out:out std_logic_vector(31 downto 0));
end EX_MEM;

architecture rtl of EX_MEM is

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

begin
	
	rd:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>rd_exmem,
					o_val=>rd_exmem_out);
	
	alu_output:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>alu_output_in,
					o_val=>alu_output_out);
					
	ram_address:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>ram_address_in,
					o_val=>ram_address_out);
					
	control_signals:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>control_signals_in,
					o_val=>control_signals_out);
					
	writeregister_val:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>writeregister_val_in,
					o_val=>writeregister_val_out);
					
	instruction_val:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>instruction_in,
					o_val=>instruction_out);
						
end rtl;