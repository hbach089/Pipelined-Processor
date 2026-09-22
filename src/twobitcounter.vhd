LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY twobitcounter IS
	PORT(
		i_resetBar, i_writeRam	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC_VECTOR(1 downto 0);
		gt_eq_1:out std_logic);
END twobitcounter;

ARCHITECTURE rtl OF twobitcounter IS
	signal int_i_resetBar,int_load:std_logic;
	signal int_lt_1,int_eq_1:std_logic;
	SIGNAL int_a, int_na, int_b, int_nb : STD_LOGIC;
	SIGNAL int_notA, int_notB : STD_LOGIC;
	signal int_o_value:std_logic_vector(1 downto 0);
	signal int_clear:std_logic;
	
	COMPONENT enARdFF_2
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;
	
	COMPONENT twobitcomparator IS
	PORT(
		i_Ai, i_Bi			: IN	STD_LOGIC_VECTOR(1 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END COMPONENT;


BEGIN

	-- Concurrent Signal Assignment
	int_load<=(i_writeRam and int_lt_1) or int_clear;
	
	int_clear<=not(int_lt_1);
--INCREMENT BY 1
	int_na <= (int_a xor int_b) and not(int_clear);
	int_nb <= not(int_b) and not(int_clear);
	
--int_i_resetBar<=i_resetBar and i_writeRam;
int_i_resetBar<=i_resetBar;
msb: enARdFF_2
	PORT MAP (i_resetBar => int_i_resetBar,
			  i_d => int_na,
			  i_enable => int_load, 
			  i_clock => i_clock,
			  o_q => int_a,
	          o_qBar => open);


lsb: enARdFF_2
	PORT MAP (i_resetBar => int_i_resetBar,
			  i_d => int_nb, 
			  i_enable => int_load,
			  i_clock => i_clock,
			  o_q => int_b,
	          o_qBar => open);
	-- Output Driver
	int_o_value		<= int_a & int_b;
	o_Value<=int_o_Value;
	
	comparator:twobitcomparator 
		PORT map(i_Ai=>int_o_value, 
					i_Bi=>"01",
					o_GT=>open, 
					o_LT=>int_lt_1, 
					o_EQ=>int_eq_1);
		
	gt_eq_1<=not(int_lt_1);

END rtl;
