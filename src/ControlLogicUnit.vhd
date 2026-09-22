library ieee;
use ieee.std_logic_1164.all;

entity ControlLogicUnit is
port(Instruction_OpCode:in std_logic_vector(5 downto 0);
	  RegDst,Jump,ALUSrc,MemtoReg,RegWrite:out std_logic;
	  MemRead,MemWrite,Branch,BNEQ,ALUOp1,ALUOp0:out std_logic);
end ControlLogicUnit;

architecture rtl of ControlLogicUnit is
signal int_r_format,int_lw,int_sw,int_beq,int_bneq,int_jump:std_logic;
signal int_ALUSrc,int_RegWrite:std_logic;
begin
	int_r_format<=not(Instruction_OpCode(5)) and
					  not(Instruction_OpCode(4)) and 
					  not(Instruction_OpCode(3)) and 
					  not(Instruction_OpCode(2)) and 
					  not(Instruction_OpCode(1)) and 
					  not(Instruction_OpCode(0));
					  
	int_lw<=Instruction_OpCode(5) and 
			  not(Instruction_OpCode(4)) and 
			  not(Instruction_OpCode(3)) and 
			  not(Instruction_OpCode(2)) and 
			  Instruction_OpCode(1) and
			  Instruction_OpCode(0);
			  
	int_sw<=Instruction_OpCode(5) and 
			  not(Instruction_OpCode(4)) and 
			  (Instruction_OpCode(3)) and 
			  not(Instruction_OpCode(2)) and 
			  Instruction_OpCode(1) and
			  Instruction_OpCode(0);
			  
	int_beq<=not(Instruction_OpCode(5)) and 
			  not(Instruction_OpCode(4)) and 
			  not(Instruction_OpCode(3)) and 
			  Instruction_OpCode(2) and 
			  not(Instruction_OpCode(1)) and
			  not(Instruction_OpCode(0));
			  
	int_bneq<=not(Instruction_OpCode(5)) and 
			  not(Instruction_OpCode(4)) and 
			  not(Instruction_OpCode(3)) and 
			  (Instruction_OpCode(2)) and 
			  not(Instruction_OpCode(1)) and
			  (Instruction_OpCode(0));
			  
	int_jump<=not(Instruction_OpCode(5)) and
					  not(Instruction_OpCode(4)) and 
					  not(Instruction_OpCode(3)) and 
					  not(Instruction_OpCode(2)) and 
					  (Instruction_OpCode(1)) and 
					  not(Instruction_OpCode(0));
			  
	RegDst<=int_r_format;
	Jump<=int_jump;
	ALuSrc<=int_lw or int_sw;
	MemtoReg<=int_lw;
	RegWrite<=int_R_format or int_lw;
	MemRead<=int_lw;
	MemWrite<=int_sw;
	Branch<=int_beq;
	BNEQ<=int_bneq;
	ALUOp1<=int_r_format;
	ALUOp0<=int_beq or int_bneq;
end rtl;