library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_9bits is
port(a,b:in std_logic_vector(8 downto 0);
	  sel:in std_logic;
	  opt:out std_logic_vector(8 downto 0));
end mux_2x1_9bits;

architecture rtl of mux_2x1_9bits is
begin
	opt<=(a and (8 downto 0 => not(sel)))
		  
		  or
		  
		  (b and (8 downto 0 => (sel)));
		  
		  
end rtl;