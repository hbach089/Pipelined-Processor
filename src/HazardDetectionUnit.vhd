library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity HazardDetectionUnit is
port(greset,gclock:in std_logic;
	  opCode:in std_logic_vector(5 downto 0);
	  idex_memread,ifid_beq_and_eq:in std_logic;
	  ifid_rs,ifid_rt,idex_rt:in std_logic_vector(4 downto 0);
	  PCLoad,IFIDLoad,IFID_Flush,ControlSignals_Mux:out std_logic);
end HazardDetectionUnit;

architecture rtl of HazardDetectionUnit is
signal int_eq_rsrt,int_eq_rtrt,int_eq_source:std_logic;
signal int_eq_idex_rt0:std_logic;

	component fiveBitComparator IS
		PORT(
			i_Ai, i_Bi			: IN	std_logic_vector(4 downto 0);
			o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;
begin

	fiveBitComp_rsrt:fiveBitComparator 
		PORT map(i_Ai=>ifid_rs, 
					i_Bi=>idex_rt,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_rsrt);
					
					
	fiveBitComp_rtrt:fiveBitComparator 
		PORT map(i_Ai=>ifid_rt, 
					i_Bi=>idex_rt,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_rtrt);
					
	fiveBitComp_idexrt0:fiveBitComparator 
		PORT map(i_Ai=>idex_rt, 
					i_Bi=>"00000",
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_eq_idex_rt0);
					
	int_eq_source<=(int_eq_rsrt or int_eq_rtrt) and not(int_eq_idex_rt0) and
						 not(opCode(5) and 
						 not(opCode(4)) and 
						 not(opCode(3)) and 
						 not(opCode(2)) and 
						 opCode(1) and
						 opCode(0));
	
	
	
-- Flush only when the branch is set and when both RegisterFile outputs are equal:
	IFID_Flush<=ifid_beq_and_eq;

-- Prevent the PC, and IF/ID registers from loading in the case of a LoadUse data hazard.
-- Also, set the control signals going into ID/EX to 0s.
	PCLoad<=not(idex_memread and int_eq_source);
	IFIDLoad<=not(idex_memread and int_eq_source);
	ControlSignals_Mux<=(idex_memread and int_eq_source);
end rtl;