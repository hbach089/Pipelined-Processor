library ieee;
use ieee.std_logic_1164.all;

entity ShiftLeft_by2_28bits is
port(greset,gclock:in std_logic;
	  i_val:in std_logic_vector(25 downto 0);
	  o_val:out std_logic_vector(27 downto 0));
end ShiftLeft_by2_28bits;

architecture rtl of ShiftLeft_by2_28bits is
signal int_o_q:std_logic_vector(27 downto 0);
	
BEGIN

	int_o_q<=i_val & "00";
		
	o_val<=int_o_q;
end rtl;