library ieee;
use ieee.std_logic_1164.all;

entity Substractor_8bits is
PORT(i_Ai, i_Bi		: in std_logic_vector(31 downto 0);
	  c_in:in std_logic;
	  o_CarryOut		: OUT	STD_LOGIC;
	  o_Sum			: OUT	std_logic_vector(31 downto 0));
end Substractor_8bits;

architecture rtl of Substractor_8bits is
signal int_i_bi,int_o_CarryOut:std_logic_vector(31 downto 0);

	component oneBitAdder IS
		PORT(
			i_CarryIn		: IN	STD_LOGIC;
			i_Ai, i_Bi		: IN	STD_LOGIC;
			o_Sum, o_CarryOut	: OUT	STD_LOGIC);
	END component;
	
begin

	int_i_bi<= i_Bi xor (31 downto 0 =>  c_in);
	b0: oneBitAdder
    PORT MAP(
        i_CarryIn  => c_in,
        i_Ai       => i_Ai(0),
        i_Bi       => int_i_bi(0),
        o_Sum      => o_Sum(0),
        o_CarryOut => int_o_CarryOut(0));

b1: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(0),
        i_Ai       => i_Ai(1),
        i_Bi       => int_i_bi(1),
        o_Sum      => o_Sum(1),
        o_CarryOut => int_o_CarryOut(1));

b2: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(1),
        i_Ai       => i_Ai(2),
        i_Bi       => int_i_bi(2),
        o_Sum      => o_Sum(2),
        o_CarryOut => int_o_CarryOut(2));

b3: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(2),
        i_Ai       => i_Ai(3),
        i_Bi       => int_i_bi(3),
        o_Sum      => o_Sum(3),
        o_CarryOut => int_o_CarryOut(3));

b4: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(3),
        i_Ai       => i_Ai(4),
        i_Bi       => int_i_bi(4),
        o_Sum      => o_Sum(4),
        o_CarryOut => int_o_CarryOut(4));

b5: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(4),
        i_Ai       => i_Ai(5),
        i_Bi       => int_i_bi(5),
        o_Sum      => o_Sum(5),
        o_CarryOut => int_o_CarryOut(5));

b6: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(5),
        i_Ai       => i_Ai(6),
        i_Bi       => int_i_bi(6),
        o_Sum      => o_Sum(6),
        o_CarryOut => int_o_CarryOut(6));

b7: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(6),
        i_Ai       => i_Ai(7),
        i_Bi       => int_i_bi(7),
        o_Sum      => o_Sum(7),
        o_CarryOut => int_o_CarryOut(7));

b8: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(7),
        i_Ai       => i_Ai(8),
        i_Bi       => int_i_bi(8),
        o_Sum      => o_Sum(8),
        o_CarryOut => int_o_CarryOut(8));

b9: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(8),
        i_Ai       => i_Ai(9),
        i_Bi       => int_i_bi(9),
        o_Sum      => o_Sum(9),
        o_CarryOut => int_o_CarryOut(9));

b10: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(9),
        i_Ai       => i_Ai(10),
        i_Bi       => int_i_bi(10),
        o_Sum      => o_Sum(10),
        o_CarryOut => int_o_CarryOut(10));

b11: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(10),
        i_Ai       => i_Ai(11),
        i_Bi       => int_i_bi(11),
        o_Sum      => o_Sum(11),
        o_CarryOut => int_o_CarryOut(11));

b12: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(11),
        i_Ai       => i_Ai(12),
        i_Bi       => int_i_bi(12),
        o_Sum      => o_Sum(12),
        o_CarryOut => int_o_CarryOut(12));

b13: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(12),
        i_Ai       => i_Ai(13),
        i_Bi       => int_i_bi(13),
        o_Sum      => o_Sum(13),
        o_CarryOut => int_o_CarryOut(13));

b14: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(13),
        i_Ai       => i_Ai(14),
        i_Bi       => int_i_bi(14),
        o_Sum      => o_Sum(14),
        o_CarryOut => int_o_CarryOut(14));

b15: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(14),
        i_Ai       => i_Ai(15),
        i_Bi       => int_i_bi(15),
        o_Sum      => o_Sum(15),
        o_CarryOut => int_o_CarryOut(15));

b16: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(15),
        i_Ai       => i_Ai(16),
        i_Bi       => int_i_bi(16),
        o_Sum      => o_Sum(16),
        o_CarryOut => int_o_CarryOut(16));

b17: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(16),
        i_Ai       => i_Ai(17),
        i_Bi       => int_i_bi(17),
        o_Sum      => o_Sum(17),
        o_CarryOut => int_o_CarryOut(17));

b18: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(17),
        i_Ai       => i_Ai(18),
        i_Bi       => int_i_bi(18),
        o_Sum      => o_Sum(18),
        o_CarryOut => int_o_CarryOut(18));

b19: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(18),
        i_Ai       => i_Ai(19),
        i_Bi       => int_i_bi(19),
        o_Sum      => o_Sum(19),
        o_CarryOut => int_o_CarryOut(19));

b20: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(19),
        i_Ai       => i_Ai(20),
        i_Bi       => int_i_bi(20),
        o_Sum      => o_Sum(20),
        o_CarryOut => int_o_CarryOut(20));

b21: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(20),
        i_Ai       => i_Ai(21),
        i_Bi       => int_i_bi(21),
        o_Sum      => o_Sum(21),
        o_CarryOut => int_o_CarryOut(21));

b22: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(21),
        i_Ai       => i_Ai(22),
        i_Bi       => int_i_bi(22),
        o_Sum      => o_Sum(22),
        o_CarryOut => int_o_CarryOut(22));

b23: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(22),
        i_Ai       => i_Ai(23),
        i_Bi       => int_i_bi(23),
        o_Sum      => o_Sum(23),
        o_CarryOut => int_o_CarryOut(23));

b24: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(23),
        i_Ai       => i_Ai(24),
        i_Bi       => int_i_bi(24),
        o_Sum      => o_Sum(24),
        o_CarryOut => int_o_CarryOut(24));

b25: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(24),
        i_Ai       => i_Ai(25),
        i_Bi       => int_i_bi(25),
        o_Sum      => o_Sum(25),
        o_CarryOut => int_o_CarryOut(25));

b26: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(25),
        i_Ai       => i_Ai(26),
        i_Bi       => int_i_bi(26),
        o_Sum      => o_Sum(26),
        o_CarryOut => int_o_CarryOut(26));

b27: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(26),
        i_Ai       => i_Ai(27),
        i_Bi       => int_i_bi(27),
        o_Sum      => o_Sum(27),
        o_CarryOut => int_o_CarryOut(27));

b28: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(27),
        i_Ai       => i_Ai(28),
        i_Bi       => int_i_bi(28),
        o_Sum      => o_Sum(28),
        o_CarryOut => int_o_CarryOut(28));

b29: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(28),
        i_Ai       => i_Ai(29),
        i_Bi       => int_i_bi(29),
        o_Sum      => o_Sum(29),
        o_CarryOut => int_o_CarryOut(29));

b30: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(29),
        i_Ai       => i_Ai(30),
        i_Bi       => int_i_bi(30),
        o_Sum      => o_Sum(30),
        o_CarryOut => int_o_CarryOut(30));

b31: oneBitAdder
    PORT MAP(
        i_CarryIn  => int_o_CarryOut(30),
        i_Ai       => i_Ai(31),
        i_Bi       => int_i_bi(31),
        o_Sum      => o_Sum(31),
        o_CarryOut => int_o_CarryOut(31));
		
		
	o_CarryOut<=int_o_CarryOut(31);

end rtl;