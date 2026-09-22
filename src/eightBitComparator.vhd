LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightBitComparator IS
	PORT(
		i_Ai, i_Bi			: IN	std_logic_vector(31 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
END eightBitComparator;

ARCHITECTURE rtl OF eightBitComparator IS
	SIGNAL int_GT, int_LT : std_logic_vector(31 downto 0);
	SIGNAL gnd : STD_LOGIC;

	COMPONENT oneBitComparator
	PORT(
		i_GTPrevious, i_LTPrevious	: IN	STD_LOGIC;
		i_Ai, i_Bi			: IN	STD_LOGIC;
		o_GT, o_LT			: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	-- Concurrent Signal Assignment
	gnd <= '0';

comp31: oneBitComparator
	PORT MAP (i_GTPrevious => gnd, 
	          i_LTPrevious => gnd,
			  i_Ai => i_Ai(31),
			  i_Bi => i_Bi(31),
			  o_GT => int_GT(31),
			  o_LT => int_LT(31));
			  
comp30: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(31), 
	          i_LTPrevious => int_LT(31),
			  i_Ai => i_Ai(30),
			  i_Bi => i_Bi(30),
			  o_GT => int_GT(30),
			  o_LT => int_LT(30));
			  
comp29: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(30), 
	          i_LTPrevious => int_LT(30),
			  i_Ai => i_Ai(29),
			  i_Bi => i_Bi(29),
			  o_GT => int_GT(29),
			  o_LT => int_LT(29));
	
comp28: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(29), 
	          i_LTPrevious => int_LT(29),
			  i_Ai => i_Ai(28),
			  i_Bi => i_Bi(28),
			  o_GT => int_GT(28),
			  o_LT => int_LT(28));
			  
			  
comp27: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(28), 
	          i_LTPrevious => int_LT(28),
			  i_Ai => i_Ai(27),
			  i_Bi => i_Bi(27),
			  o_GT => int_GT(27),
			  o_LT => int_LT(27));
			  
comp26: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(27), 
	          i_LTPrevious => int_LT(27),
			  i_Ai => i_Ai(26),
			  i_Bi => i_Bi(26),
			  o_GT => int_GT(26),
			  o_LT => int_LT(26));

comp25: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(26), 
	          i_LTPrevious => int_LT(26),
			  i_Ai => i_Ai(25),
			  i_Bi => i_Bi(25),
			  o_GT => int_GT(25),
			  o_LT => int_LT(25));

comp24: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(25), 
	          i_LTPrevious => int_LT(25),
			  i_Ai => i_Ai(24),
			  i_Bi => i_Bi(24),
			  o_GT => int_GT(24),
			  o_LT => int_LT(24));

comp23: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(24), 
	          i_LTPrevious => int_LT(24),
			  i_Ai => i_Ai(23),
			  i_Bi => i_Bi(23),
			  o_GT => int_GT(23),
			  o_LT => int_LT(23));
			  
comp22: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(23), 
	          i_LTPrevious => int_LT(23),
			  i_Ai => i_Ai(22),
			  i_Bi => i_Bi(22),
			  o_GT => int_GT(22),
			  o_LT => int_LT(22));
			  
comp21: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(22), 
	          i_LTPrevious => int_LT(22),
			  i_Ai => i_Ai(21),
			  i_Bi => i_Bi(21),
			  o_GT => int_GT(21),
			  o_LT => int_LT(21));
	
comp20: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(21), 
	          i_LTPrevious => int_LT(21),
			  i_Ai => i_Ai(20),
			  i_Bi => i_Bi(20),
			  o_GT => int_GT(20),
			  o_LT => int_LT(20));
			  
			  
comp19: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(20), 
	          i_LTPrevious => int_LT(20),
			  i_Ai => i_Ai(19),
			  i_Bi => i_Bi(19),
			  o_GT => int_GT(19),
			  o_LT => int_LT(19));
			  
comp18: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(19), 
	          i_LTPrevious => int_LT(19),
			  i_Ai => i_Ai(18),
			  i_Bi => i_Bi(18),
			  o_GT => int_GT(18),
			  o_LT => int_LT(18));

comp17: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(18), 
	          i_LTPrevious => int_LT(18),
			  i_Ai => i_Ai(17),
			  i_Bi => i_Bi(17),
			  o_GT => int_GT(17),
			  o_LT => int_LT(17));

comp16: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(17), 
	          i_LTPrevious => int_LT(17),
			  i_Ai => i_Ai(16),
			  i_Bi => i_Bi(16),
			  o_GT => int_GT(16),
			  o_LT => int_LT(16));
			  
comp15: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(16), 
	          i_LTPrevious => int_LT(16),
			  i_Ai => i_Ai(15),
			  i_Bi => i_Bi(15),
			  o_GT => int_GT(15),
			  o_LT => int_LT(15));
comp14: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(15), 
	          i_LTPrevious => int_LT(15),
			  i_Ai => i_Ai(14),
			  i_Bi => i_Bi(14),
			  o_GT => int_GT(14),
			  o_LT => int_LT(14));

			  
comp13: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(14), 
	          i_LTPrevious => int_LT(14),
			  i_Ai => i_Ai(13),
			  i_Bi => i_Bi(13),
			  o_GT => int_GT(13),
			  o_LT => int_LT(13));
			  
	
comp12: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(13), 
	          i_LTPrevious => int_LT(13),
			  i_Ai => i_Ai(12),
			  i_Bi => i_Bi(12),
			  o_GT => int_GT(12),
			  o_LT => int_LT(12));
			  
			  
comp11: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(12), 
	          i_LTPrevious => int_LT(12),
			  i_Ai => i_Ai(11),
			  i_Bi => i_Bi(11),
			  o_GT => int_GT(11),
			  o_LT => int_LT(11));
			  
comp10: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(11), 
	          i_LTPrevious => int_LT(11),
			  i_Ai => i_Ai(10),
			  i_Bi => i_Bi(10),
			  o_GT => int_GT(10),
			  o_LT => int_LT(10));

comp9: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(10), 
	          i_LTPrevious => int_LT(10),
			  i_Ai => i_Ai(9),
			  i_Bi => i_Bi(9),
			  o_GT => int_GT(9),
			  o_LT => int_LT(9));

comp8: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(9), 
	          i_LTPrevious => int_LT(9),
			  i_Ai => i_Ai(8),
			  i_Bi => i_Bi(8),
			  o_GT => int_GT(8),
			  o_LT => int_LT(8));

comp7: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(8), 
	          i_LTPrevious => int_LT(8),
			  i_Ai => i_Ai(7),
			  i_Bi => i_Bi(7),
			  o_GT => int_GT(7),
			  o_LT => int_LT(7));
			  
comp6: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(7), 
	          i_LTPrevious => int_LT(7),
			  i_Ai => i_Ai(6),
			  i_Bi => i_Bi(6),
			  o_GT => int_GT(6),
			  o_LT => int_LT(6));
			  
comp5: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(6), 
	          i_LTPrevious => int_LT(6),
			  i_Ai => i_Ai(5),
			  i_Bi => i_Bi(5),
			  o_GT => int_GT(5),
			  o_LT => int_LT(5));
	
comp4: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(5), 
	          i_LTPrevious => int_LT(5),
			  i_Ai => i_Ai(4),
			  i_Bi => i_Bi(4),
			  o_GT => int_GT(4),
			  o_LT => int_LT(4));
			  
			  
comp3: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(4), 
	          i_LTPrevious => int_LT(4),
			  i_Ai => i_Ai(3),
			  i_Bi => i_Bi(3),
			  o_GT => int_GT(3),
			  o_LT => int_LT(3));
			  
comp2: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(3), 
	          i_LTPrevious => int_LT(3),
			  i_Ai => i_Ai(2),
			  i_Bi => i_Bi(2),
			  o_GT => int_GT(2),
			  o_LT => int_LT(2));

comp1: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(2), 
	          i_LTPrevious => int_LT(2),
			  i_Ai => i_Ai(1),
			  i_Bi => i_Bi(1),
			  o_GT => int_GT(1),
			  o_LT => int_LT(1));

comp0: oneBitComparator
	PORT MAP (i_GTPrevious => int_GT(1), 
	          i_LTPrevious => int_LT(1),
			  i_Ai => i_Ai(0),
			  i_Bi => i_Bi(0),
			  o_GT => int_GT(0),
			  o_LT => int_LT(0));

	-- Output Driver

	o_GT <= int_GT(0);
	o_LT <= int_LT(0);
	o_EQ <= int_GT(0) nor int_LT(0);

END rtl;
