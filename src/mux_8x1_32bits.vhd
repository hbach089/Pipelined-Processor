library ieee;
use ieee.std_logic_1164.all;

entity mux_8x1_32bits is
port(a,b,c,d,e,f,g,h:in std_logic_vector(31 downto 0);
	  sel:in std_logic_vector(2 downto 0);
	  opt:out std_logic_vector(31 downto 0));
end mux_8x1_32bits;

architecture rtl of mux_8x1_32bits is
begin
	opt <= (a and (31 downto 0 => not(sel(2)) and not(sel(1)) and not(sel(0)))) or
			 (b and (31 downto 0 => not(sel(2)) and not(sel(1)) and     sel(0))) or
			 (c and (31 downto 0 => not(sel(2)) and     sel(1)  and not(sel(0)))) or
			 (d and (31 downto 0 => not(sel(2)) and     sel(1)  and (sel(0)))) or
			 (e and (31 downto 0 =>  sel(2)  and not(sel(1))  and not(sel(0)))) or
			 (f and (31 downto 0 => (sel(2)) and not(sel(1)) and (sel(0)))) or
			 (g and (31 downto 0 => (sel(2)) and     sel(1)  and not(sel(0)))) or
			 (h and (31 downto 0 => (sel(2)) and     sel(1)  and (sel(0))));
		  
end rtl;