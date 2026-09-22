library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

package mux_ipt_array_type is
    type mux_ipt_array is array(0 to 31) of std_logic_vector (31 downto 0);
end package mux_ipt_array_type;
