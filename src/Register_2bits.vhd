library ieee;
use ieee.std_logic_1164.all;

entity Register_2bits is
port(greset,gclock:in std_logic;
	  i_load:in std_logic;
	  i_val:in std_logic_vector(1 downto 0);
	  o_val:out std_logic_vector(1 downto 0));
end Register_2bits;

architecture rtl of Register_2bits is
signal int_i_val,int_o_q:std_logic_vector(1 downto 0);
signal int_load_ff:std_logic;

	component enARdFF_2 IS
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END component;
	
BEGIN

					
	int_load_ff<=i_load;
	int_i_val<=i_val;
	
	b0:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(0),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(0),
					o_qbar=>open);
					
	b1:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(1),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(1),
					o_qbar=>open);
					
					
	o_val<=int_o_q;
end rtl;