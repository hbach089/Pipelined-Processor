LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY threebitcounter IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC_VECTOR(2 downto 0));
END threebitcounter;

ARCHITECTURE rtl OF threebitcounter IS
	SIGNAL int_a, int_na, int_b, int_nb,int_c, int_nc : STD_LOGIC;
	SIGNAL int_notA, int_notB : STD_LOGIC;

	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	-- Concurrent Signal Assignment
	
--INCREMENT BY 1
	int_na <= (not(int_a) and int_b and int_c) or (int_a and not(int_b)) or (int_a and not(int_c));
	int_nb <= int_c xor int_b;
	int_nc <= not(int_c);

--INCREMENT BY 2
--	int_na<=(not(int_a) and int_c) or int_b;
--	int_nb<=(not(int_a) and not(int_b) and not(int_c)) or (int_a and int_c) or (int_b and int_c);
--	int_nc<='0';

msb: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_na,
			  i_enable => i_load, 
			  i_clock => i_clock,
			  o_q => int_a,
	          o_qBar => open);

midb: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_nb, 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_b,
	          o_qBar => open);

lsb: enARdFF_2
	PORT MAP (i_resetBar => i_resetBar,
			  i_d => int_nc, 
			  i_enable => i_load,
			  i_clock => i_clock,
			  o_q => int_c,
	          o_qBar => open);
	-- Output Driver
	o_Value		<= int_a & int_b & int_c;

END rtl;
