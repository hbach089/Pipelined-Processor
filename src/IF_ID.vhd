library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity IF_ID is
port(greset,gclock:in std_logic;
	  if_id_load,if_flush:in std_logic;
	  pc_offset_4_in,instruction_in:in std_logic_vector(31 downto 0);
	  pc_offset_4_out,instruction_out:out std_logic_vector(31 downto 0));
end IF_ID;

architecture rtl of IF_ID is
signal int_pc_val_in,int_instruction_val_in:std_logic_vector(31 downto 0);
signal int_pc_val,int_instruction_val:std_logic_vector(31 downto 0);

	component Register_32bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;

begin
	
	
	int_pc_val_in<=pc_offset_4_in and (31 downto 0 => not(if_flush));
	int_instruction_val_in<=instruction_in and (31 downto 0 => not(if_flush));
   
	pc_offset_val:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>if_id_load,
					i_val=>int_pc_val_in,
					o_val=>int_pc_val);
					
	instruction_val:Register_32bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>if_id_load,
					i_val=>int_instruction_val_in,
					o_val=>int_instruction_val);
					
	pc_offset_4_out<=int_pc_val;
	instruction_out<=int_instruction_val;
end rtl;