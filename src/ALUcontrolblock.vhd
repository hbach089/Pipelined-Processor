library ieee;
use ieee.std_logic_1164.all;

entity ALUcontrolblock is
port(ALUop:in std_logic_vector(1 downto 0);
	  func: in std_logic_vector(5 downto 0);
	  operation:out std_logic_vector(2 downto 0));
end ALUcontrolblock;

architecture rtl of ALUcontrolblock is
signal int_operation:std_logic_vector(2 downto 0);
signal int_and_gate,int_or_gate:std_logic;

begin
int_and_gate<=ALUop(1) and func(1);
int_operation(2)<=ALUop(0) or int_and_gate;

int_operation(1)<=not(func(2)) or not(ALUop(1));

int_or_gate<=func(3) or func(0);
int_operation(0)<=ALUop(1) and int_or_gate;

operation<=int_operation(2) & int_operation(1) & int_operation(0);
end rtl;