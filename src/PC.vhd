library ieee;
use ieee.std_logic_1164.all;

entity PC is
port(greset,gclock:in std_logic;
	  PCLoad:in std_logic;
	  i_val:in std_logic_vector(31 downto 0);
	  o_val:out std_logic_vector(31 downto 0));
end PC;

architecture rtl of PC is
signal int_i_val,int_o_q:std_logic_vector(31 downto 0);
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

					
--	int_load_ff<='1';
	int_load_ff<=PCLoad;
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
					
	b2:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(2),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(2),
					o_qbar=>open);
					
	b3:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(3),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(3),
					o_qbar=>open);
					
	b4:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(4),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(4),
					o_qbar=>open);
					
	b5:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(5),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(5),
					o_qbar=>open);
					
	b6:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(6),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(6),
					o_qbar=>open);
					
	b7:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(7),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(7),
					o_qbar=>open);
					
	b8:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(8),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(8),
					o_qbar=>open);
					
	b9:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(9),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(9),
					o_qbar=>open);
					
	b10:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(10),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(10),
					o_qbar=>open);
					
	b11:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(11),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(11),
					o_qbar=>open);
					
	b12:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(12),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(12),
					o_qbar=>open);
					
	b13:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(13),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(13),
					o_qbar=>open);
					
	b14:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(14),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(14),
					o_qbar=>open);
					
	b15:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(15),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(15),
					o_qbar=>open);
					
	b16:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(16),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(16),
					o_qbar=>open);
					
	b17:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(17),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(17),
					o_qbar=>open);
					
	b18:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(18),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(18),
					o_qbar=>open);
					
	b19:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(19),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(19),
					o_qbar=>open);
					
	b20:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(20),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(20),
					o_qbar=>open);
					
	b21:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(21),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(21),
					o_qbar=>open);
					
	b22:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(22),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(22),
					o_qbar=>open);
					
	b23:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(23),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(23),
					o_qbar=>open);
					
	b24:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(24),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(24),
					o_qbar=>open);
					
	b25:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(25),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(25),
					o_qbar=>open);
					
	b26:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(26),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(26),
					o_qbar=>open);
					
	b27:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(27),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(27),
					o_qbar=>open);
					
	b28:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(28),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(28),
					o_qbar=>open);
					
	b29:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(29),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(29),
					o_qbar=>open);
					
	b30:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(30),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(30),
					o_qbar=>open);
					
	b31:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_i_val(31),
					i_enable=>int_load_ff,
					i_clock=>gclock,
					o_q=>int_o_q(31),
					o_qbar=>open);
					


	o_val<=int_o_q;
end rtl;