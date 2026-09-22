library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_5bits is
port(a,b:in std_logic_vector(4 downto 0);
	  sel:in std_logic;
	  opt:out std_logic_vector(4 downto 0));
end mux_2x1_5bits;

architecture rtl of mux_2x1_5bits is
begin
	opt<=((a(4) and not(sel)) &
		  (a(3) and not(sel)) &
		  (a(2) and not(sel)) &
		  (a(1) and not(sel)) &
		  (a(0) and not(sel)))
		  
		  or
		  
		  ((b(4) and (sel)) &
		  (b(3) and (sel)) &
		  (b(2) and (sel)) &
		  (b(1) and (sel)) &
		  (b(0) and (sel)));
		  
		  
end rtl;