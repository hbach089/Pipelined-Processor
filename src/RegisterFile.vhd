library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

use work.mux_ipt_array_type.all;

entity RegisterFile is
port(greset,gclock:in std_logic;
	  RegWrite:in std_logic;
	  read_val1,read_val2:in std_logic_vector(4 downto 0);
	  write_val:in std_logic_vector(4 downto 0);
	  write_data:in std_logic_vector(31 downto 0);
	  read_data1,read_data2:out std_logic_vector(31 downto 0));
end RegisterFile;

architecture rtl of RegisterFile is
signal int_read_val1_temp,int_read_val2_temp,int_ipt_1,int_ipt_2:std_logic_vector(31 downto 0);
signal int_load_ff,int_same1,int_same2,int_load_temp1,int_load_temp2:std_logic;

--type reg_file_type is array (0 to 31) of std_logic_vector(31 downto 0);
--signal int_read_val : mux_ipt_array := (others => (others => '0'));
signal int_read_val : mux_ipt_array := (others => x"00000000");
signal int_read_val1,int_read_val2:std_logic_vector(31 downto 0);
signal int_lol:std_logic_vector(4 downto 0);


signal int_load,int_load_reg:std_logic_vector(31 downto 0);

	component Rf_Register_8bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;
	
	component mux_32x1_8bits is
	port(ipt : in mux_ipt_array;
		  sel:in std_logic_vector(4 downto 0);
		  opt:out std_logic_vector(31 downto 0));
	end component;
	
	component demux_1x32_8bits is
	port(ipt:in std_logic_vector(4 downto 0);
		  opt0,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,opt11,opt12,opt13,opt14,opt15,opt16,opt17,opt18,opt19,opt20,opt21,opt22,opt23,opt24,opt25,opt26,opt27,opt28,opt29,opt30,opt31:out std_logic);
	end component;
	
	component eightBitComparator IS
	PORT(
		i_Ai, i_Bi			: IN	std_logic_vector(31 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;

BEGIN

	demux : demux_1x32_8bits
		port map(
			 ipt   => write_val,
			 opt0  => int_load(0),
			 opt1  => int_load(1),
			 opt2  => int_load(2),
			 opt3  => int_load(3),
			 opt4  => int_load(4),
			 opt5  => int_load(5),
			 opt6  => int_load(6),
			 opt7  => int_load(7),
			 opt8  => int_load(8),
			 opt9  => int_load(9),
			 opt10 => int_load(10),
			 opt11 => int_load(11),
			 opt12 => int_load(12),
			 opt13 => int_load(13),
			 opt14 => int_load(14),
			 opt15 => int_load(15),
			 opt16 => int_load(16),
			 opt17 => int_load(17),
			 opt18 => int_load(18),
			 opt19 => int_load(19),
			 opt20 => int_load(20),
			 opt21 => int_load(21),
			 opt22 => int_load(22),
			 opt23 => int_load(23),
			 opt24 => int_load(24),
			 opt25 => int_load(25),
			 opt26 => int_load(26),
			 opt27 => int_load(27),
			 opt28 => int_load(28),
			 opt29 => int_load(29),
			 opt30 => int_load(30),
			 opt31 => int_load(31));
	
--	int_load_reg(0)<=int_load(0) and RegWrite;
--	int_load_reg(1)<=int_load(1) and RegWrite;
--	int_load_reg(2)<=int_load(2) and RegWrite;
--	int_load_reg(3)<=int_load(3) and RegWrite;		
						
	int_load_reg<=int_load and (31 downto 0 => RegWrite);					
						
	register0:Rf_Register_8bits
			port map(greset=>greset,
						gclock=>gclock,
						i_load=>int_load_reg(0),
						i_val=>write_data,
						o_val=>int_read_val(0));
						
	register1:Rf_Register_8bits
			port map(greset=>greset,
						gclock=>gclock,
						i_load=>int_load_reg(1),
						i_val=>write_data,
						o_val=>int_read_val(1));
						
	register2:Rf_Register_8bits
			port map(greset=>greset,
						gclock=>gclock,
						i_load=>int_load_reg(2),
						i_val=>write_data,
						o_val=>int_read_val(2));
						
	register3:Rf_Register_8bits
			port map(greset=>greset,
						gclock=>gclock,
						i_load=>int_load_reg(3),
						i_val=>write_data,
						o_val=>int_read_val(3));
	
	register4:Rf_Register_8bits
			port map(greset=>greset,
						gclock=>gclock,
						i_load=>int_load_reg(4),
						i_val=>write_data,
						o_val=>int_read_val(4));
	
	
	int_read_val1<=int_read_val(to_integer(unsigned(read_val1)));
	int_read_val2<=int_read_val(to_integer(unsigned(read_val2)));
	
	
--	int_lol<="00011";
--	read_val0t<=(31 downto 5 => '0') & read_val1;
--	read_val1t<=(31 downto 5 => '0') & read_val2;
--	read_val2t<=int_read_val(2);
--	read_val3t<=int_read_val(3);
--	read_val4t<=int_read_val2;				

--	read_data1<=int_read_val1(to_integer(unsigned(read_val1)));
--	read_data2<=int_read_val2(to_integer(unsigned(read_val2)));

	read_data1<=int_read_val1;
	read_data2<=int_read_val2;
end rtl;