library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

use work.mux_ipt_array_type.all;

entity mux_32x1_8bits is
port(ipt : in mux_ipt_array;
	  sel:in std_logic_vector(4 downto 0);
	  opt:out std_logic_vector(31 downto 0));
end mux_32x1_8bits;

architecture rtl of mux_32x1_8bits is
begin
	opt<=(ipt(0) and (31 downto 0 => not(sel(0)) and not(sel(1)) and not(sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(1) and (31 downto 0 => (sel(0)) and not(sel(1)) and not(sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(2) and (31 downto 0 => not(sel(0)) and (sel(1)) and not(sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(3) and (31 downto 0=> (sel(0)) and (sel(1)) and not(sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(4) and (31 downto 0 => not(sel(0)) and not(sel(1)) and (sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(5) and (31 downto 0 => (sel(0)) and not(sel(1)) and (sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(6) and (31 downto 0 => not(sel(0)) and (sel(1)) and (sel(2)) and not(sel(3)) and not(sel(4))))
		 
		  or
		  
		  (ipt(7) and (31 downto 0=> (sel(0)) and (sel(1)) and (sel(2)) and not(sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(8) and (31 downto 0 => not(sel(0)) and not(sel(1)) and not(sel(2)) and (sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(9) and (31 downto 0 => (sel(0)) and not(sel(1)) and not(sel(2)) and (sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(10) and (31 downto 0 => not(sel(0)) and (sel(1)) and not(sel(2)) and (sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(11) and (31 downto 0=> (sel(0)) and (sel(1)) and not(sel(2)) and (sel(3)) and not(sel(4))))

		  or
		  
		  (ipt(12) and (31 downto 0 => not(sel(0)) and not(sel(1)) and (sel(2)) and (sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(13) and (31 downto 0 => (sel(0)) and not(sel(1)) and (sel(2)) and (sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(14) and (31 downto 0 => not(sel(0)) and (sel(1)) and (sel(2)) and (sel(3)) and not(sel(4))))
		  
		  or
		  
		  (ipt(15) and (31 downto 0=> (sel(0)) and (sel(1)) and (sel(2)) and (sel(3)) and not(sel(4))))

		  or
		  
		  (ipt(16) and (31 downto 0 => not(sel(0)) and not(sel(1)) and not(sel(2)) and not(sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(17) and (31 downto 0 => (sel(0)) and not(sel(1)) and not(sel(2)) and not(sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(18) and (31 downto 0 => not(sel(0)) and (sel(1)) and not(sel(2)) and not(sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(19) and (31 downto 0=> (sel(0)) and (sel(1)) and not(sel(2)) and not(sel(3)) and (sel(4))))

		  or
		  
		  (ipt(20) and (31 downto 0 => not(sel(0)) and not(sel(1)) and (sel(2)) and not(sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(21) and (31 downto 0 => (sel(0)) and not(sel(1)) and (sel(2)) and not(sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(22) and (31 downto 0 => not(sel(0)) and (sel(1)) and (sel(2)) and not(sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(23) and (31 downto 0=> (sel(0)) and (sel(1)) and (sel(2)) and not(sel(3)) and (sel(4))))

		  or
		  
		  (ipt(24) and (31 downto 0 => not(sel(0)) and not(sel(1)) and not(sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(25) and (31 downto 0 => (sel(0)) and not(sel(1)) and not(sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(26) and (31 downto 0 => not(sel(0)) and (sel(1)) and not(sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(27) and (31 downto 0=> (sel(0)) and (sel(1)) and not(sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(28) and (31 downto 0 => not(sel(0)) and not(sel(1)) and (sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(29) and (31 downto 0 => (sel(0)) and not(sel(1)) and (sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(30) and (31 downto 0 => not(sel(0)) and (sel(1)) and (sel(2)) and (sel(3)) and (sel(4))))
		  
		  or
		  
		  (ipt(31) and (31 downto 0=> (sel(0)) and (sel(1)) and (sel(2)) and (sel(3)) and (sel(4))));  
		  
end rtl;