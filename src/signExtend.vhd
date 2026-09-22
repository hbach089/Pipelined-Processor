library ieee;
use ieee.std_logic_1164.all;

entity signExtend is
port(ipt:in std_logic_vector(15 downto 0);
	  opt:out std_logic_vector(31 downto 0));
end signExtend;

architecture rtl of signExtend is
signal int_negative,int_positive:std_logic_vector(31 downto 0);
signal int_sign_bit:std_logic;

component mux_2x1_8bits is
port(a,b:in std_logic_vector(31 downto 0);
	  sel:in std_logic;
	  opt:out std_logic_vector(31 downto 0));
end component;

begin
		int_positive<=(31 downto 16 =>'0') & ipt;
		int_negative<=(31 downto 16 =>'1') & ipt;
		
		int_sign_bit<=ipt(15);
		mux:mux_2x1_8bits
			port map(a=>int_positive,
						b=>int_negative,
						sel=>int_sign_bit,
						opt=>opt);
end rtl;