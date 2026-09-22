library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_8bits is
port(a,b:in std_logic_vector(31 downto 0);
	  sel:in std_logic;
	  opt:out std_logic_vector(31 downto 0));
end mux_2x1_8bits;

architecture rtl of mux_2x1_8bits is
begin
	opt<=(a and (31 downto 0 => not(sel)))
		  
		  or
		  
		  (b and (31 downto 0 => (sel)));
		  
		  
end rtl;