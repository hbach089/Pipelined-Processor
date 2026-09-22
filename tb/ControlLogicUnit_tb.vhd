library ieee;
use ieee.std_logic_1164.all;

entity ControlLogicUnit_tb is
end ControlLogicUnit_tb;

architecture testbench of ControlLogicUnit_tb is
signal Instruction_OpCode_tb:std_logic_vector(5 downto 0);
signal RegDst_tb,ALUSrc_tb,MemtoReg_tb,RegWrite_tb:std_logic;
signal MemRead_tb,MemWrite_tb,Branch_tb,ALUOp1_tb,ALUOp0_tb:std_logic;

component ControlLogicUnit is
port(Instruction_OpCode:in std_logic_vector(5 downto 0);
	  RegDst,ALUSrc,MemtoReg,RegWrite:out std_logic;
	  MemRead,MemWrite,Branch,ALUOp1,ALUOp0:out std_logic);
end component;

begin

	dut:ControlLogicUnit 
		port map(Instruction_OpCode=>Instruction_OpCode_tb,
  				   RegDst=>RegDst_tb,
					ALUSrc=>ALUSrc_tb,
					MemtoReg=>MemtoReg_tb,
					RegWrite=>RegWrite_tb,
				   MemRead=>MemRead_Tb,
					MemWrite=>MemWrite_tb,
					Branch=>Branch_tb,
					ALUOp1=>ALUOp1_tb,
					ALUOp0=>ALUOp0_tb);
					
	stim:process
	begin
		Instruction_OpCode_tb<="000000";
		wait for 2ns;
		Instruction_OpCode_tb<="100011";
		wait for 2ns;
		Instruction_OpCode_tb<="101011";
		wait for 2ns;
		Instruction_OpCode_tb<="000100";
		wait for 2ns;
		wait;
	end process;
end testbench;