library ieee;
use ieee.std_logic_1164.all;


entity LoadUseHazard_Fix is
port(greset,gclock:in std_logic;
	  rs_ifid,rt_ifid,rs_idex,rt_idex:in std_logic_vector(4 downto 0);
	  instruction,operand1,operand2:in std_logic_vector(31 downto 0);
	  operand1_out,operand2_out:out std_logic_vector(31 downto 0);
	  same_rs,same_rt,new_instruction:out std_logic);
end LoadUseHazard_Fix;

architecture rtl of LoadUseHazard_Fix is
signal int_eq_inst,int_same_inst,int_instrnoteq_0,int_gt1:std_logic;
signal int_instruction_temp:std_logic_vector(31 downto 0);
signal int_same_rs,int_same_rt,int_rs_eq,int_rt_eq:std_logic;

	component Register_32bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;
	
	component eightBitComparator IS
	PORT(
		i_Ai, i_Bi			: IN	std_logic_vector(31 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;
	
	component twobitcounter IS
	PORT(
		i_resetBar, i_writeRam	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC_VECTOR(1 downto 0);
		gt_eq_1:out std_logic);
	END component;
	
	
	component fiveBitComparator IS
		PORT(
			i_Ai, i_Bi			: IN	std_logic_vector(4 downto 0);
			o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;
	
	component enARdFF_2 IS
		PORT(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END component;
	
	
begin

	-- Copy the operands from the previous cycle over to the next one.
	Register_operand1:Register_32bits 
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>operand1,
					o_val=>operand1_out);
					
	Register_operand2:Register_32bits 
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>operand2,
					o_val=>operand2_out);

	-- Check if the instruction is the same for two clock cycless in a row (when we stall during load use)
	same_instruction:eightBitComparator
		PORT map(i_Ai=>instruction, 
					i_Bi=>int_instruction_temp,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_same_inst);
					

	-- make sure the instruction is not 0
	instruction_not0:eightBitComparator
		PORT map(i_Ai=>instruction, 
					i_Bi=>x"00000000",
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_instrnoteq_0);
	
	-- load instruction in register, for it to be available in the next cycle.
	Register_instructiontemp:Register_32bits 
		port map(greset=>greset,
					gclock=>gclock,
					i_load=>'1',
					i_val=>instruction,
					o_val=>int_instruction_temp);
				
	-- counter to make sure we have the same instruction for two clock cycles.
	-- if it is the case, we increment the counter, and use the count>2 signal.
	-- after reaching count>2, we reset the counter.
	twobitcnt:twobitcounter
		PORT map(i_resetBar=>greset, 
					i_writeRam=>int_eq_inst,
					i_clock=>gclock,
					o_Value=>open,
					gt_eq_1=>int_gt1);
			
	--counter load signal; make sure the instruction is not 0 and that we have the same instruction
	-- for 2 cycles
	int_eq_inst<=int_same_inst and not(int_instrnoteq_0);
	
	-- new instruction after we count the same instruction for two cycles (because of a stall).
	new_instruction<=int_gt1;
	
	---------------------------------------------------------------
	
	-- compare the RegisterFile outputs in the if/id and id/ex stages.
	rs_compare:fiveBitComparator
		PORT map(i_Ai=>rs_ifid, 
					i_Bi=>rs_idex,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_rs_eq);
					
	rt_compare:fiveBitComparator
		PORT map(i_Ai=>rt_ifid, 
					i_Bi=>rt_idex,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_rt_eq);
					
	-- Set the control signals when we have the same values for RegisterFile outputs in the if/id and id/ex.	
   -- in the second cycle after the stall, repeat the same thing. If the instruction has the same data elements,
	-- set the same_rs or same_rt signals. 
	-- We then use the same operands from the cycle right after the stall.
	int_same_rs<=(int_rs_eq) and int_gt1;	
	same_rs_ifid_idex:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_same_rs,
					i_enable=>'1',
					i_clock=>gclock,
					o_q=>same_rs,
					o_qbar=>open);
					
	int_same_rt<=(int_rt_eq) and int_gt1;	
	same_rt_ifid_idex:enARdFF_2
		port map(i_resetBar=>greset,
					i_d=>int_same_rt,
					i_enable=>'1',
					i_clock=>gclock,
					o_q=>same_rt,
					o_qbar=>open);
	
	

end rtl;