library ieee;
use ieee.std_logic_1164.all;

entity ALU is
port(ipt1,ipt2:in std_logic_vector(31 downto 0);
	  operation:in std_logic_vector(2 downto 0);
	  alu_result:out std_logic_vector(31 downto 0);
	  zero:out std_logic);
end ALU;

architecture rtl of ALU is
signal int_and_result,int_or_result,int_add_result,int_sub_result,int_SetOnLT_result:std_logic_vector(31 downto 0);
signal int_alu_result:std_logic_vector(31 downto 0);
signal int_lt,int_eq_zero:std_logic;

	component mux_5x1 is
	port(a,b,c,d,e:in std_logic_vector(31 downto 0);
		  sel:in std_logic_vector(2 downto 0);
		  opt:out std_logic_vector(31 downto 0));
	end component;
	
	component adder_8bits IS
	PORT(i_Ai, i_Bi		: in std_logic_vector(31 downto 0);
		  o_CarryOut		: OUT	STD_LOGIC;
		  o_Sum			: OUT	std_logic_vector(31 downto 0));
	END component;
	
	component Substractor_8bits IS
	PORT(i_Ai, i_Bi		: in std_logic_vector(31 downto 0);
		  c_in:in std_logic;
		  o_CarryOut		: OUT	STD_LOGIC;
		  o_Sum			: OUT	std_logic_vector(31 downto 0));
	END component;
	
	component eightBitComparator IS
	PORT(
		i_Ai, i_Bi			: IN	std_logic_vector(31 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;


begin

	int_and_result<=((ipt1(31) and ipt2(31)) &
						 (ipt1(30) and ipt2(30)) &
						 (ipt1(29) and ipt2(29)) &
						 (ipt1(28) and ipt2(28)) &
						 (ipt1(27) and ipt2(27)) &
						 (ipt1(26) and ipt2(26)) &
						 (ipt1(25) and ipt2(25)) &
						 (ipt1(24) and ipt2(24)) &
						 (ipt1(23) and ipt2(23)) &
						 (ipt1(22) and ipt2(22)) &
						 (ipt1(21) and ipt2(21)) &
						 (ipt1(20) and ipt2(20)) &
						 (ipt1(19) and ipt2(19)) &
						 (ipt1(28) and ipt2(18)) &
						 (ipt1(17) and ipt2(17)) &
						 (ipt1(16) and ipt2(16)) &
						 (ipt1(15) and ipt2(15)) &
						 (ipt1(14) and ipt2(14)) &
						 (ipt1(13) and ipt2(13)) &
						 (ipt1(12) and ipt2(12)) &
						 (ipt1(11) and ipt2(11)) &
						 (ipt1(10) and ipt2(10)) &
						 (ipt1(9) and ipt2(9)) &
						 (ipt1(8) and ipt2(8)) &
						 (ipt1(7) and ipt2(7)) &
						 (ipt1(6) and ipt2(6)) &
						 (ipt1(5) and ipt2(5)) &
						 (ipt1(4) and ipt2(4)) &
						 (ipt1(3) and ipt2(3)) &
						 (ipt1(2) and ipt2(2)) &
						 (ipt1(1) and ipt2(1)) &
						 (ipt1(0) and ipt2(0)));
						 
	int_or_result<=((ipt1(31) or ipt2(31)) &
						 (ipt1(30) or ipt2(30)) &
						 (ipt1(29) or ipt2(29)) &
						 (ipt1(28) or ipt2(28)) &
						 (ipt1(27) or ipt2(27)) &
						 (ipt1(26) or ipt2(26)) &
						 (ipt1(25) or ipt2(25)) &
						 (ipt1(24) or ipt2(24)) &
						 (ipt1(23) or ipt2(23)) &
						 (ipt1(22) or ipt2(22)) &
						 (ipt1(21) or ipt2(21)) &
						 (ipt1(20) or ipt2(20)) &
						 (ipt1(19) or ipt2(19)) &
						 (ipt1(28) or ipt2(18)) &
						 (ipt1(17) or ipt2(17)) &
						 (ipt1(16) or ipt2(16)) &
						 (ipt1(15) or ipt2(15)) &
						 (ipt1(14) or ipt2(14)) &
						 (ipt1(13) or ipt2(13)) &
						 (ipt1(12) or ipt2(12)) &
						 (ipt1(11) or ipt2(11)) &
						 (ipt1(10) or ipt2(10)) &
						 (ipt1(9) or ipt2(9)) &
						 (ipt1(8) or ipt2(8)) &
						 (ipt1(7) or ipt2(7)) &
						 (ipt1(6) or ipt2(6)) &
						 (ipt1(5) or ipt2(5)) &
						 (ipt1(4) or ipt2(4)) &
						 (ipt1(3) or ipt2(3)) &
						 (ipt1(2) or ipt2(2)) &
						 (ipt1(1) or ipt2(1)) &
						 (ipt1(0) or ipt2(0)));
						 
	adder:adder_8bits
		port map(i_Ai=>ipt1, 
					i_Bi=>ipt2,
					o_CarryOut=>open,
					o_Sum=>int_add_result);
						 
	substractor:Substractor_8bits
		port map(i_Ai=>ipt1, 
					i_Bi=>ipt2,
					c_in=>'1',
					o_CarryOut=>open,
					o_Sum=>int_sub_result);
					
	comparator_twoinputs:eightBitComparator 
	PORT map(i_Ai=>ipt1, 
				i_Bi=>ipt2,
				o_GT=>open, 
				o_LT=>int_lt, 
				o_EQ=>open);
				
	int_SetOnLT_result<=((ipt1(31) and int_lt) &
								(ipt1(30) and int_lt) &
								(ipt1(29) and int_lt) &
								(ipt1(28) and int_lt) &
								(ipt1(27) and int_lt) &
								(ipt1(26) and int_lt) &
								(ipt1(25) and int_lt) &
								(ipt1(24) and int_lt) &
								(ipt1(23) and int_lt) &
								(ipt1(22) and int_lt) &
								(ipt1(21) and int_lt) &
								(ipt1(20) and int_lt) &
								(ipt1(19) and int_lt) &
								(ipt1(18) and int_lt) &
								(ipt1(17) and int_lt) &
								(ipt1(16) and int_lt) &
								(ipt1(15) and int_lt) &
								(ipt1(14) and int_lt) &
								(ipt1(13) and int_lt) &
								(ipt1(12) and int_lt) &
								(ipt1(11) and int_lt) &
								(ipt1(10) and int_lt) &
								(ipt1(9) and int_lt) &
								(ipt1(8) and int_lt) &
								(ipt1(7) and int_lt) &
								(ipt1(6) and int_lt) &
								(ipt1(5) and int_lt) &
								(ipt1(4) and int_lt) &
								(ipt1(3) and int_lt) &
								(ipt1(2) and int_lt) &
								(ipt1(1) and int_lt) &
								(ipt1(0) and int_lt));
	
	mux:mux_5x1
		port map(a=>int_and_result,
					b=>int_or_result,
					c=>int_add_result,
					d=>int_sub_result,
					e=>int_SetOnLT_result,
					sel=>operation,
					opt=>int_alu_result);
	alu_result<=int_alu_result;
					
	comparator_zero:eightBitComparator 
	PORT map(i_Ai=>int_alu_result, 
				i_Bi=>x"00000000",
				o_GT=>open, 
				o_LT=>open, 
				o_EQ=>int_eq_zero);
	zero<=int_eq_zero;
end rtl;