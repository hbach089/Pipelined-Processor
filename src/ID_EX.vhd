library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity ID_EX is
port(greset,gclock:in std_logic;
		  instruction_in:in std_logic_vector(31 downto 0);
		  control_signals_in:in std_logic_vector(8 downto 0);
		  func_field_in:in std_logic_vector(5 downto 0);
		  read_data1_in,read_data2_in:in std_logic_vector(31 downto 0);
		  address_signextend_in:in std_logic_vector(31 downto 0);
		  rs_in,rt_in,rd_in:in std_logic_vector(4 downto 0);
		  read_data1_out,read_data2_out:out std_logic_vector(31 downto 0);
		  rs_out,rt_out,rd_out:out std_logic_vector(4 downto 0);
		  control_signals_out:out std_logic_vector(8 downto 0);
		  address_signextend_out:out std_logic_vector(31 downto 0);
		  func_field_out:out std_logic_vector(5 downto 0);
		  instruction_out:out std_logic_vector(31 downto 0));
end ID_EX;

architecture rtl of ID_EX is

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
	
	
	
	read_data1_reg:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>read_data1_in,
					o_val=>read_data1_out);
					
	read_data2_reg:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>read_data2_in,
					o_val=>read_data2_out);
					
	rs_reg:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>rs_in,
					o_val=>rs_out);
					
	rt_reg:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>rt_in,
					o_val=>rt_out);
					
	rd_reg:Register_5bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>rd_in,
					o_val=>rd_out);
					
	address_signextend:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>address_signextend_in,
					o_val=>address_signextend_out);
	
	func_field:Register_6bits		
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>func_field_in,
					o_val=>func_field_out);
					
	control_signals_reg:Register_9bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>control_signals_in,
					o_val=>control_signals_out);
					
					
	instruction_val:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>instruction_in,
					o_val=>instruction_out);

end rtl;