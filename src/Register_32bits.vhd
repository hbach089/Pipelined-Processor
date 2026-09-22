library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Register_32bits is
port(greset,gclock:in std_logic;
	  i_load:in std_logic;
	  i_val:in std_logic_vector(31 downto 0);
	  o_val:out std_logic_vector(31 downto 0));
end Register_32bits;

architecture rtl of Register_32bits is

	component Rf_Register_8bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;

begin
	register_component:Rf_Register_8bits
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>i_load,
					i_val=>i_val,
					o_val=>o_val);
end rtl;