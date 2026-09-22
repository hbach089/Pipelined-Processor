LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity processor_tb is
end processor_tb;

architecture testbench of processor_tb is
signal greset_tb,gclock_tb: std_logic;
signal InstrSelect_tb,ValueSelect_tb: std_logic_vector(2 downto 0);
signal MuxOut_tb,InstructionOut_tb: std_logic_vector(31 downto 0);
signal BranchOut_tb,ZeroOut_tb,MemWriteOut_tb,RegWriteOut_tb:std_logic;

--signal instruction_tb,instruction_rom_tb: std_logic_vector(31 downto 0);
--signal rs_prev_tb,rt_prev_tb:std_logic_vector(4 downto 0);
--signal rs_tb,rt_tb,rd_tb: std_logic_vector(4 downto 0);
--signal operand1_tb,operand2_tb,wb_data_tb,operand1_out_tb,operand2_out_tb: std_logic_vector(31 downto 0);
--signal sel_forwardrs_tb,sel_forwardrt_tb:std_logic_vector(1 downto 0);
--signal operation_tb: std_logic_vector(2 downto 0);
--signal new_instructionsel_tb,same_rs_tb,same_rt_tb: std_logic;


component processor is
	port(greset,gclock:in std_logic;
		  InstrSelect,ValueSelect:in std_logic_vector(2 downto 0);		  
		  MuxOut,InstructionOut:out std_logic_vector(31 downto 0);
		  BranchOut,ZeroOut,MemWriteOut,RegWriteOut:out std_logic
--		  instruction,instruction_rom:out std_logic_vector(31 downto 0);
--		  rs_prev,rt_prev:out std_logic_vector(4 downto 0);
--		  rs,rt,rd:out std_logic_vector(4 downto 0);
--		  operand1,operand2,wb_data,operand1_out,operand2_out:out std_logic_vector(31 downto 0);
--		  sel_forwardrs,sel_forwardrt:out std_logic_vector(1 downto 0);
--		  operation:out std_logic_vector(2 downto 0);
--		  new_instructionsel,same_rs,same_rt:out std_logic;
		  );
end component;

begin
	dut:processor
		port map(greset=>greset_tb,
					gclock=>gclock_tb,
					InstrSelect=>InstrSelect_tb,
					ValueSelect=>ValueSelect_tb,
					MuxOut=>MuxOut_tb,
					InstructionOut=>InstructionOut_tb,
					BranchOut=>BranchOut_tb,
					ZeroOut=>ZeroOut_tb,
					MemWriteOut=>MemWriteOut_tb,
					RegWriteOut=>RegWriteOut_tb
--					instruction=>instruction_tb,
--					instruction_rom=>instruction_rom_tb,
--					rs_prev=>rs_prev_tb,
--					rt_prev=>rt_prev_tb,
--					rs=>rs_tb,
--					rt=>rt_tb,
--					rd=>rd_tb,
--					operand1=>operand1_tb,
--					operand2=>operand2_tb,
--					wb_data=>wb_data_tb,
--					operand1_out=>operand1_out_tb,
--					operand2_out=>operand2_out_tb,
--					sel_forwardrs=>sel_forwardrs_tb,
--					sel_forwardrt=>sel_forwardrt_tb,
--					operation=>operation_tb,
--					new_instructionsel=>new_instructionsel_tb,
--					same_rs=>same_rs_tb,
--					same_rt=>same_rt_tb,
					);
					
	clock_process:process
	begin
		gclock_tb<='1';
		wait for 1ns;
		gclock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		greset_tb<='0','1' after 2ns;
		InstrSelect_tb<="000";ValueSelect_tb<="000";
		wait for 2ns;
		wait;
	end process;

end testbench;