library ieee;
use ieee.std_logic_1164.all;

entity ForwardingUnit is
port(greset,gclock:in std_logic;
	  ifid_rs,ifid_rt:in std_logic_vector(4 downto 0);
	  exmem_rd,memwb_rd:in std_logic_vector(4 downto 0);
	  exmem_regwrite,memwb_regwrite:in std_logic;
	  mux_rs,mux_rt:out std_logic_vector(1 downto 0));
end ForwardingUnit;

architecture rtl of ForwardingUnit  is
signal int_eq_exmem_rd_0,int_eq_exmem_rd_ifid_rs,int_eq_exmem_rd_ifid_rt:std_logic;
signal int_eq_memwb_rd_0,int_eq_memwb_rd_ifid_rs,int_eq_memwb_rd_ifid_rt:std_logic;
signal int_cond1,int_cond2,int_cond3,int_cond4:std_logic;

	component fiveBitComparator IS
		PORT(
			i_Ai, i_Bi			: IN	std_logic_vector(4 downto 0);
			o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;

begin
	
	eq_exmem_rd_0:fiveBitComparator 
		PORT map(i_Ai=>"00000", 
					i_Bi=>exmem_rd,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_exmem_rd_0);
					
	eq_exmem_rd_ifid_rs:fiveBitComparator 
		PORT map(i_Ai=>ifid_rs, 
					i_Bi=>exmem_rd,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_exmem_rd_ifid_rs);
		
	int_cond1<=exmem_regwrite and not(int_eq_exmem_rd_0) and int_eq_exmem_rd_ifid_rs;
	
					
	eq_exmem_rd_ifid_rt:fiveBitComparator 
		PORT map(i_Ai=>ifid_rt, 
					i_Bi=>exmem_rd,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_exmem_rd_ifid_rt);
		
	int_cond2<=exmem_regwrite and not(int_eq_exmem_rd_0) and int_eq_exmem_rd_ifid_rt;
	
	----------------------------------------------------------------------------------------
	
	eq_memwb_rd_0:fiveBitComparator 
		PORT map(i_Ai=>"00000", 
					i_Bi=>memwb_rd,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_memwb_rd_0);
					
	eq_memwb_rd_ifid_rs:fiveBitComparator 
		PORT map(i_Ai=>ifid_rs, 
					i_Bi=>memwb_rd,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_memwb_rd_ifid_rs);
		
--	int_cond3<=(memwb_regwrite and not(int_eq_memwb_rd_0) and int_eq_memwb_rd_ifid_rs) and not(int_eq_exmem_rd_ifid_rs);
	int_cond3<=(memwb_regwrite and not(int_eq_memwb_rd_0) and int_eq_memwb_rd_ifid_rs);
					
	eq_memwb_rd_ifid_rt:fiveBitComparator 
		PORT map(i_Ai=>ifid_rt, 
					i_Bi=>memwb_rd,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_memwb_rd_ifid_rt);
		
--	int_cond4<=(memwb_regwrite and not(int_eq_memwb_rd_0) and int_eq_memwb_rd_ifid_rt) and not(int_eq_exmem_rd_ifid_rt);
	int_cond4<=(memwb_regwrite and not(int_eq_memwb_rd_0) and int_eq_memwb_rd_ifid_rt);
	
	
--	mux_rs<=int_cond1 & (int_cond3 and not(int_cond1));
--	mux_rt<=int_cond2 & (int_cond4 and not(int_cond2));
	mux_rs<=(int_cond3 and not(int_cond1)) & int_cond1;
	mux_rt<=(int_cond4 and not(int_cond2)) & int_cond2;
end rtl;