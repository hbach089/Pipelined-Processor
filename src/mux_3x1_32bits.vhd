library ieee;
use ieee.std_logic_1164.all;

entity mux_3x1_32bits is
port(a,b,c:in std_logic_vector(31 downto 0);
	  sel:in std_logic_vector(1 downto 0);
	  opt:out std_logic_vector(31 downto 0));
end mux_3x1_32bits;

architecture rtl of mux_3x1_32bits is
begin
	opt <= (a and (31 downto 0 => not(sel(1)) and not(sel(0)))) or
       (b and (31 downto 0 => not(sel(1)) and sel(0))) or
       (c and (31 downto 0 => sel(1) and not(sel(0))));		  
end rtl;