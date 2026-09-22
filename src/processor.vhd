LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity processor is
port(greset,gclock:in std_logic;
	  InstrSelect,ValueSelect:in std_logic_vector(2 downto 0);
	  MuxOut,InstructionOut:out std_logic_vector(31 downto 0);
	  BranchOut,ZeroOut,MemWriteOut,RegWriteOut:out std_logic
--	  instruction,instruction_rom:out std_logic_vector(31 downto 0);
--	  rs_prev,rt_prev:out std_logic_vector(4 downto 0);
--	  rs,rt,rd:out std_logic_vector(4 downto 0);
--	  operand1,operand2,wb_data,operand1_out,operand2_out:out std_logic_vector(31 downto 0);
--	  sel_forwardrs,sel_forwardrt:out std_logic_vector(1 downto 0);
--	  operation:out std_logic_vector(2 downto 0);
--	  new_instructionsel,same_rs,same_rt:out std_logic;
	  --------------------------------------------------------------
	  );
end processor;


architecture rtl of processor is
signal int_address,int_alu_result_8bits,int_ram_address_8bits:std_logic_Vector(7 downto 0);
signal int_address32bits,int_pc_val,int_address_offset4,int_address_offset4_if_id,int_address_jtype: std_logic_vector(31 downto 0);
signal int_address32bits_temp,int_address_min4,int_orig_address32bits,int_instruction: std_logic_vector(31 downto 0);
signal int_instruction_if_id,int_instruction_id_ex,int_instruction_ex_mem,int_instruction_mem_wb: std_logic_vector(31 downto 0);
signal int_rs,int_rt,int_rd,int_writeregister_val,int_rd_exmem_out,int_rd_memwb_out:std_logic_vector(4 downto 0);
signal int_alu_secondipt,int_offset_32bits_slby2:std_logic_vector(31 downto 0);
signal int_instruction_16bits:std_logic_vector(15 downto 0);
signal int_read_data1,int_read_data2,int_read_data_ram:std_logic_vector(31 downto 0);
signal int_alu_result,int_operand2_out_exmem,int_write_data:std_logic_vector(31 downto 0);
signal int_zero:std_logic;
signal int_operation:std_logic_vector(2 downto 0);
signal int_ALUop,int_ALUop_idex,int_sel_forward1,int_sel_forward2,int_ALUop_temp:std_logic_vector(1 downto 0);
signal int_Instruction_OpCode,int_func:std_logic_vector(5 downto 0);
signal int_offset_16bits:std_logic_vector(15 downto 0);
signal int_offset_32bits:std_logic_vector(31 downto 0);

signal int_RegDst,int_ALUSrc,int_MemtoReg,int_RegWrite,int_PCSrc: std_logic;
signal int_MemRead,int_MemWrite,int_Branch,int_BNEQ,int_ALUOp1,int_ALUOp0: std_logic;


signal int_Jump,int_RegWrite_memwb,int_gt1:std_logic;
signal int_instruction_26bits:std_logic_vector(25 downto 0);
signal int_instruction_26bits_slby2:std_logic_vector(27 downto 0);
signal int_jump_address,int_final_pc_val,int_instruction_temp:std_logic_vector(31 downto 0);
signal int_read_data1_out,int_read_data2_out:std_logic_vector(31 downto 0);
signal int_rs_out,int_rt_out,int_rd_out,int_rd_exmem,int_writeregister_val_out_exmem,int_writeregister_val_out_memwb:std_logic_vector(4 downto 0);
signal int_control_signals_in_idex,int_control_signals_out_idex:std_logic_vector(8 downto 0);
signal int_offset_32bits_out,int_operand1,int_operand2,int_read_data1_out_exmem,int_read_data2_out_exmem:std_logic_vector(31 downto 0);
signal int_operand1_3options,int_operand2_3options:std_logic_vector(31 downto 0);
signal int_alu_result_out_exmem,int_read_data1_out_memwb,int_read_data2_out_memwb,int_read_data_ram_out_memwb,int_write_data_out_memwb:std_logic_vector(31 downto 0);
signal int_func_field_out,int_func_idex:std_logic_vector(5 downto 0);
signal int_ALUSrc_idex,int_RegDst_idex,int_rd1_rd2_eq,int_branch_exmem,int_MemRead_exmem,int_MemWrite_exmem,int_control_signals_in_forward:std_logic;					
signal int_control_signals_in_memwb,int_control_signals_out_memwb,int_sel_forwardrs,int_sel_forwardrt:std_logic_vector(1 downto 0);
signal int_control_signals_in_exmem,int_control_signals_out_exmem,int_rs_idex,int_rt_idex,int_rd_idex:std_logic_vector(4 downto 0);
signal int_read_data1_idex,int_read_data2_idex,int_offset_32bits_idex:std_logic_vector(31 downto 0);

signal int_ifid_beq_and_eq,int_PCLoad,int_IFIDLoad,int_IFID_Flush,int_ControlSignals_Mux:std_logic;
signal int_9bit_controlsignals:std_logic_vector(8 downto 0);
signal int_ramdata_or_wbdata,int_operand1_out,int_operand2_out:std_logic_vector(31 downto 0);
signal int_new_instructionsel,int_same_rt,int_same_rs,int_sel_operand1,int_sel_operand2:std_logic;

signal int_othervals,int_valueSelected,int_instrSelected:std_logic_vector(31 downto 0);

	component ControlLogicUnit is
	port(Instruction_OpCode:in std_logic_vector(5 downto 0);
		  RegDst,Jump,ALUSrc,MemtoReg,RegWrite:out std_logic;
		  MemRead,MemWrite,Branch,BNEQ,ALUOp1,ALUOp0:out std_logic);
	end component;

	component IM_ROM is
	port(gclock:in std_logic;
		  address:in std_logic_vector(7 downto 0);
		  instruction:out std_logic_vector(31 downto 0));
	end component;

	component DM_RAM is
	port(gclock:in std_logic;
		  MemWrite,MemRead:in std_logic;
		  address:in std_logic_vector(7 downto 0);
		  write_data:in std_logic_vector(31 downto 0);
		  read_data:out std_logic_vector(31 downto 0));
	end component;
	
	component PC is
	port(greset,gclock:in std_logic;
		  PCLoad:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;
	
	component adder_8bits IS
	PORT(i_Ai, i_Bi		: in std_logic_vector(31 downto 0);
		  o_CarryOut		: OUT	STD_LOGIC;
		  o_Sum			: OUT	std_logic_vector(31 downto 0));
	END component;
	
	component mux_2x1_5bits is
	port(a,b:in std_logic_vector(4 downto 0);
		  sel:in std_logic;
		  opt:out std_logic_vector(4 downto 0));
	end component;
	
	component RegisterFile is
	port(greset,gclock:in std_logic;
		  RegWrite:in std_logic;
		  read_val1,read_val2:in std_logic_vector(4 downto 0);
		  write_val:in std_logic_vector(4 downto 0);
		  write_data:in std_logic_vector(31 downto 0);
		  read_data1,read_data2:out std_logic_vector(31 downto 0));
	end component;
	
	component mux_2x1_8bits is
	port(a,b:in std_logic_vector(31 downto 0);
		  sel:in std_logic;
		  opt:out std_logic_vector(31 downto 0));
	end component;

	component ALU is
	port(ipt1,ipt2:in std_logic_vector(31 downto 0);
		  operation:in std_logic_vector(2 downto 0);
		  alu_result:out std_logic_vector(31 downto 0);
		  zero:out std_logic);
	end component;
	
	component ALUcontrolblock is
	port(ALUop:in std_logic_vector(1 downto 0);
		  func: in std_logic_vector(5 downto 0);
		  operation:out std_logic_vector(2 downto 0));
	end component;

	component ShiftLeft_by2 is
	port(greset,gclock:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;
	
	component ShiftLeft_by2_28bits is
	port(greset,gclock:in std_logic;
		  i_val:in std_logic_vector(25 downto 0);
		  o_val:out std_logic_vector(27 downto 0));
	end component;
	
	component Substractor_8bits IS
	PORT(i_Ai, i_Bi		: in std_logic_vector(31 downto 0);
		  c_in:in std_logic;
		  o_CarryOut		: OUT	STD_LOGIC;
		  o_Sum			: OUT	std_logic_vector(31 downto 0));
	END component;
	
	component signExtend is
	port(ipt:in std_logic_vector(15 downto 0);
		  opt:out std_logic_vector(31 downto 0));
	end component;
	
	component RAM_async is
	port(greset,gclock:in std_logic;
		  MemWrite,MemRead:in std_logic;
		  address:in std_logic_vector(7 downto 0);
		  write_data:in std_logic_vector(31 downto 0);
		  read_data:out std_logic_vector(31 downto 0));
	end component;
	
	component IF_ID is
	port(greset,gclock:in std_logic;
		  if_id_load,if_flush:in std_logic;
		  pc_offset_4_in,instruction_in:in std_logic_vector(31 downto 0);
		  pc_offset_4_out,instruction_out:out std_logic_vector(31 downto 0));
	end component;
	
	component ID_EX is
	port(greset,gclock:in std_logic;
		  instruction_in:in std_logic_vector(31 downto 0);
		  control_signals_in:in std_logic_vector(8 downto 0);
		  func_field_in:in std_logic_vector(5 downto 0);
		  read_data1_in,read_data2_in:in std_logic_vector(31 downto 0);
		  address_signextend_in:in std_logic_vector(31 downto 0);
		  rs_in,rt_in,rd_in:in std_logic_vector(4 downto 0);
		  read_data1_out,read_data2_out:out std_logic_vector(31 downto 0);
		  rs_out,rt_out,rd_out:out std_logic_vector(4 downto 0);
		  control_signals_out:out std_logic_vector(8 downto 0);
		  address_signextend_out:out std_logic_vector(31 downto 0);
		  func_field_out:out std_logic_vector(5 downto 0);
		  instruction_out:out std_logic_vector(31 downto 0));
	end component;
	
	component eightBitComparator IS
	PORT(
		i_Ai, i_Bi			: IN	std_logic_vector(31 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
	END component;
	
	component mux_3x1_32bits is
	port(a,b,c:in std_logic_vector(31 downto 0);
		  sel:in std_logic_vector(1 downto 0);
		  opt:out std_logic_vector(31 downto 0));
	end component;

	component EX_MEM is
	port(greset,gclock:in std_logic;
	     instruction_in:in std_logic_vector(31 downto 0);
		  control_signals_in:in std_logic_vector(4 downto 0);
		  rd_exmem:in std_logic_vector(4 downto 0);
		  ram_address_in,alu_output_in:in std_logic_vector(31 downto 0);
		  writeregister_val_in:in std_logic_vector(4 downto 0);
		  ram_address_out,alu_output_out:out std_logic_vector(31 downto 0);
		  writeregister_val_out:out std_logic_vector(4 downto 0);
		  rd_exmem_out:out std_logic_vector(4 downto 0);
		  control_signals_out:out std_logic_vector(4 downto 0);
		  instruction_out:out std_logic_vector(31 downto 0));
	end component;
	
	component MEM_WB is
		port(greset,gclock:in std_logic;
		     instruction_in:in std_logic_vector(31 downto 0);
			  control_signals_in:in std_logic_vector(1 downto 0);
			  rd_memwb,writeregister_val_in:in std_logic_vector(4 downto 0);
			  read_ram_in,write_data_in:in std_logic_vector(31 downto 0);
			  read_ram_out,write_data_out:out std_logic_vector(31 downto 0);
			  rd_memwb_out,writeregister_val_out:out std_logic_vector(4 downto 0);
			  control_signals_out:out std_logic_vector(1 downto 0);
			  instruction_out:out std_logic_vector(31 downto 0));
	end component;
	
	component ForwardingUnit IS
		port(greset,gclock:in std_logic;
			  ifid_rs,ifid_rt:in std_logic_vector(4 downto 0);
			  exmem_rd,memwb_rd:in std_logic_vector(4 downto 0);
			  exmem_regwrite,memwb_regwrite:in std_logic;
			  mux_rs,mux_rt:out std_logic_vector(1 downto 0));
	END component;
	
	component HazardDetectionUnit is
	port(greset,gclock:in std_logic;
		  opCode:in std_logic_vector(5 downto 0);
		  idex_memread,ifid_beq_and_eq:in std_logic;
		  ifid_rs,ifid_rt,idex_rt:in std_logic_vector(4 downto 0);
		  PCLoad,IFIDLoad,IFID_Flush,ControlSignals_Mux:out std_logic);
	end component;
	
	component mux_2x1_9bits is
	port(a,b:in std_logic_vector(8 downto 0);
		  sel:in std_logic;
		  opt:out std_logic_vector(8 downto 0));
	end component;
	
	component mux_2x1_6bits is
	port(a,b:in std_logic_vector(5 downto 0);
		  sel:in std_logic;
		  opt:out std_logic_vector(5 downto 0));
	end component;
	
	
	component twobitcounter IS
	PORT(
		i_resetBar, i_writeRam	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_Value			: OUT	STD_LOGIC_VECTOR(1 downto 0);
		gt_eq_1:out std_logic);
	END component;
	
	component Register_32bits is
	port(greset,gclock:in std_logic;
		  i_load:in std_logic;
		  i_val:in std_logic_vector(31 downto 0);
		  o_val:out std_logic_vector(31 downto 0));
	end component;
	
	component LoadUseHazard_Fix is
		port(greset,gclock:in std_logic;
			  rs_ifid,rt_ifid,rs_idex,rt_idex:in std_logic_vector(4 downto 0);
			  instruction,operand1,operand2:in std_logic_vector(31 downto 0);
			  operand1_out,operand2_out:out std_logic_vector(31 downto 0);
			  same_rs,same_rt,new_instruction:out std_logic);
	end component;
	
	component mux_8x1_32bits is
	port(a,b,c,d,e,f,g,h:in std_logic_vector(31 downto 0);
		  sel:in std_logic_vector(2 downto 0);
		  opt:out std_logic_vector(31 downto 0));
	end component;
BEGIN


	int_ALUop_temp<=int_ALUOp1 & int_ALUOp0;
	
	ALU_control_temp:ALUcontrolblock
		port map(ALUop=>int_ALUop_temp,--ALUOp1 & ALUOp0
					func=>int_instruction_if_id(5 downto 0),
					operation=>open);

	Control:ControlLogicUnit 
		port map(Instruction_OpCode=>int_Instruction_OpCode,
  				   RegDst=>int_RegDst,
					Jump=>int_Jump,
					ALUSrc=>int_ALUSrc,
					MemtoReg=>int_MemtoReg,
					RegWrite=>int_RegWrite,
				   MemRead=>int_MemRead,
					MemWrite=>int_MemWrite,
					Branch=>int_Branch,
					BNEQ=>int_BNEQ,
					ALUOp1=>int_ALUOp1,
					ALUOp0=>int_ALUOp0);

	
	pc_ref:PC
		port map(greset=>greset,
					gclock=>gclock,
					PCLoad=>int_PCLoad,
					i_val=>int_final_pc_val,
					o_val=>int_orig_address32bits);
				
	sub_pc:Substractor_8bits
		port map(i_Ai=>int_address_offset4, 
					i_Bi=>x"00000004",
					c_in=>'1',
					o_CarryOut=>open,
					o_Sum=>int_address_min4);
					
	pc_temp:PC
		port map(greset=>greset,
					gclock=>gclock,
					PCLoad=>int_PCLoad,
					i_val=>int_address_min4,
					o_val=>int_address32bits_temp);
	
	mux_addr:mux_2x1_8bits
		port map(a=>int_address32bits_temp,
					b=>int_orig_address32bits,
				   sel=>int_PCLoad,
				   opt=>int_address32bits);
					
	int_address<=int_address32bits(7 downto 0);	
	rom:IM_ROM
		port map(gclock=>gclock,
					address=>int_address,
					instruction=>int_instruction);					
					
	adder_pc_offset:adder_8bits
		port map(i_Ai=>int_address32bits, 
					i_Bi=>x"00000004",
					o_CarryOut=>open,
					o_Sum=>int_address_offset4);
	
	
	if_id_register:IF_ID
		port map(greset=>greset,
					gclock=>gclock,
					if_id_load=>int_IFIDLoad,--if_id_load
					if_flush=>int_IFID_Flush,--if_flush
					pc_offset_4_in=>int_address32bits,
					instruction_in=>int_instruction,
					pc_offset_4_out=>int_address_offset4_if_id,
					instruction_out=>int_instruction_if_id);
	
	int_instruction_26bits<=int_instruction(25 downto 0);				
	ShiftLeft_by2_jump:ShiftLeft_by2_28bits 
		port map(greset=>greset,
					gclock=>gclock,
				   i_val=>int_instruction_26bits,
				   o_val=>int_instruction_26bits_slby2);
					
	int_jump_address<=int_address_offset4(31 downto 28) &	int_instruction_26bits_slby2;
	
	int_Instruction_OpCode<=int_instruction_if_id(31 downto 26);
	int_rs<=int_instruction_if_id(25 downto 21);
	int_rt<=int_instruction_if_id(20 downto 16);
	int_rd<=int_instruction_if_id(15 downto 11);	
	
	mux_rt_rd:mux_2x1_5bits 
	port map(a=>int_rt_out,
				b=>int_rd_out,
				sel=>int_RegDst_idex,--RegDst
				opt=>int_writeregister_val);

	int_offset_16bits<=int_instruction_if_id(15 downto 0);
	int_func<=int_instruction_if_id(5 downto 0);
	
	signExtend_16to32:signExtend
		port map(ipt=>int_offset_16bits,
					opt=>int_offset_32bits);
					
					
	ShiftLeft_by2_comp:ShiftLeft_by2 
		port map(greset=>greset,
					gclock=>gclock,
				   i_val=>int_offset_32bits,
				   o_val=>int_offset_32bits_slby2);

	adder_jtype:adder_8bits
		port map(
					i_Ai=>int_address_offset4_if_id, 
					i_Bi=>int_offset_32bits_slby2,
					o_CarryOut=>open,
					o_Sum=>int_address_jtype);
					
										
	int_PCSrc<=(int_ifid_beq_and_eq and int_Branch) or (not(int_ifid_beq_and_eq) and int_BNEQ);
	mux_PCSrc:mux_2x1_8bits 
		port map(a=>int_address_offset4,
					b=>int_address_jtype,
					sel=>int_PCSrc,--PCSrc
					opt=>int_pc_val);
					
	mux_Jump:mux_2x1_8bits 
		port map(a=>int_pc_val,
					b=>int_jump_address,
					sel=>int_Jump,--Jump
					opt=>int_final_pc_val);
					
					
	int_RegWrite_memwb<=int_control_signals_out_memwb(1);
	RegisterFile_comp:RegisterFile
		port map(greset=>greset,
					gclock=>gclock,
					RegWrite=>int_RegWrite_memwb,--RegWrite
					read_val1=>int_rs,
					read_val2=>int_rt,
					write_val=>int_writeregister_val_out_memwb,
					write_data=>int_write_data,
					read_data1=>int_read_data1,
					read_data2=>int_read_data2);
					
	
	branch_comparator:eightBitComparator
		PORT map(i_Ai=>int_read_data1, 
					i_Bi=>int_read_data2,
					o_GT=>open, 
					o_LT=>open, 
					o_EQ=>int_rd1_rd2_eq);
					
	
	int_ifid_beq_and_eq<=int_rd1_rd2_eq and int_Branch;
	
			  
	Hazards:HazardDetectionUnit
		port map(greset=>greset,
					gclock=>gclock,
					opCode=>int_Instruction_OpCode,
					idex_memread=>int_control_signals_out_idex(3),
					ifid_beq_and_eq=>int_ifid_beq_and_eq,
					ifid_rs=>int_rs,
					ifid_rt=>int_rt,
					idex_rt=>int_rd_exmem,
					PCLoad=>int_PCLoad,
					IFIDLoad=>int_IFIDLoad,
					IFID_Flush=>int_IFID_Flush,
					ControlSignals_Mux=>int_ControlSignals_Mux);
					
	
	int_9bit_controlsignals<=int_RegDst & int_ALUOp1 & int_ALUOp0 & int_ALUSrc & int_Branch & int_MemRead & int_MemWrite & int_RegWrite & int_MemtoReg;

	mux_control:mux_2x1_9bits
		port map(a=>int_9bit_controlsignals,
					b=>"000000000",
					sel=>int_ControlSignals_Mux,
					opt=>int_control_signals_in_idex);				
	
	
	ID_EX_register:ID_EX
		port map(greset=>greset,
					gclock=>gclock,
					instruction_in=>int_instruction_if_id,
					control_signals_in=>int_control_signals_in_idex,--int_control_signals_in
					func_field_in=>int_func,
					read_data1_in=>int_read_data1,
					read_data2_in=>int_read_data2,
					address_signextend_in=>int_offset_32bits,
					rs_in=>int_rs,
					rt_in=>int_rt,
					rd_in=>int_rd,
					read_data1_out=>int_read_data1_out,
					read_data2_out=>int_read_data2_out,
					rs_out=>int_rs_out,
					rt_out=>int_rt_out,
					rd_out=>int_rd_out,
					control_signals_out=>int_control_signals_out_idex,
					address_signextend_out=>int_offset_32bits_out,
					func_field_out=>int_func_field_out,
					instruction_out=>int_instruction_id_ex);
	
	int_control_signals_in_exmem<=int_control_signals_out_idex(4 downto 0);
	int_ALUSrc_idex<=int_control_signals_out_idex(5);
	int_ALUop_idex<=int_control_signals_out_idex(7 downto 6);
	int_RegDst_idex<=int_control_signals_out_idex(8);
	
	mux_alusrc:mux_2x1_8bits 
		port map(a=>int_read_data2_out,
					b=>int_offset_32bits_out,
					sel=>int_ALUSrc_idex,--ALUSrc
					opt=>int_alu_secondipt);
	
	ALU_control:ALUcontrolblock
		port map(ALUop=>int_ALUop_idex,--ALUOp1 & ALUOp0
					func=>int_func_field_out,
					operation=>int_operation);
					
	-- First ALU input
	mux_rd1_3options:mux_3x1_32bits
		port map(a=>int_read_data1_out,	 -- First RegisterFile output
					b=>int_ramdata_or_wbdata,-- The data in the ex/mem stage. (either ram data or alu result)
					c=>int_write_data,       -- The data in the mem/wb stage. 
					sel=>int_sel_forwardrs, -- int_sel_forward1
					opt=>int_operand1_3options);
		
	-- Second ALU input
	mux_rd2_3options:mux_3x1_32bits
		port map(a=>int_alu_secondipt,    -- Either second RegisterFile output, or 32 bit offset.
					b=>int_ramdata_or_wbdata,-- The data in the ex/mem stage. (either ram data or alu result)
					c=>int_write_data,       -- The data in the mem/wb stage. 
					sel=>int_sel_forwardrt, -- int_sel_forward2
					opt=>int_operand2_3options);
					
	

	
	-- Select either the operands from the forwarding, or the same operands in the second cycle 
	-- of the stalled instruction.
	
	-- The select is set when we have a new instruction after the stall.
	-- It selects the same operands in the second cycle of the stall.
	-- OR it will select the operands of the first instruction after the stall 
	-- (the second instruction after the stall can also have the same issue)
	int_sel_operand1<=int_new_instructionsel or int_same_rs;
	mux_rd1:mux_2x1_8bits
		port map(a=>int_operand1_3options,
					b=>int_operand1_out,
					sel=>int_sel_operand1, 
					opt=>int_operand1);
	
	int_sel_operand2<=int_new_instructionsel or int_same_rt;
	mux_rd2:mux_2x1_8bits
		port map(a=>int_operand2_3options,
					b=>int_operand2_out,
					sel=>int_sel_operand2,
					opt=>int_operand2);
					
		  
	alu_comp:ALU
		port map(ipt1=>int_operand1,--int_read_data1
					ipt2=>int_operand2,--int_alu_secondipt
					operation=>int_operation,
					alu_result=>int_alu_result,
					zero=>int_zero);
					
	
	mux2x1_5:mux_2x1_5bits
		port map(a=>int_rt_out,
					b=>int_rd_out,
					sel=>int_RegDst_idex,
					opt=>int_rd_exmem);
	
	exmem:EX_MEM 
		port map(greset=>greset,
					gclock=>gclock,
					instruction_in=>int_instruction_id_ex,
					control_signals_in=>int_control_signals_in_exmem,
					rd_exmem=>int_rd_exmem,
					ram_address_in=>int_alu_secondipt,
					alu_output_in=>int_alu_result,
					writeregister_val_in=>int_writeregister_val,
					ram_address_out=>int_operand2_out_exmem,
					alu_output_out=>int_alu_result_out_exmem,
					writeregister_val_out=>int_writeregister_val_out_exmem,
					rd_exmem_out=>int_rd_exmem_out,
					control_signals_out=>int_control_signals_out_exmem,
					instruction_out=>int_instruction_ex_mem);
				
	int_ram_address_8bits<=int_operand2_out_exmem(7 downto 0);				
	
	int_control_signals_in_forward<=int_control_signals_out_exmem(1);					
	int_control_signals_in_memwb<=int_control_signals_out_exmem(1 downto 0);
	int_branch_exmem<=int_control_signals_out_exmem(4);
	int_MemRead_exmem<=int_control_signals_out_exmem(3);
	int_MemWrite_exmem<=int_control_signals_out_exmem(2);


	--RAM BLOCK
	ram:RAM_async
			port map(greset=>greset,
						gclock=>gclock,
						MemWrite=>int_MemWrite_exmem, -- Write for LW
						MemRead=>int_MemRead_exmem,-- Read for SW
						address=>int_ram_address_8bits,-- The address is the second ALU input (mainly the offset for LW/SW)
						write_data=>int_alu_result_out_exmem,-- The data we write is the ALU result.
						read_data=>int_read_data_ram);
					
	ForwardingUnit_comp:ForwardingUnit 
		port map(greset=>greset,
					gclock=>gclock,
					ifid_rs=>int_rs_out,
					ifid_rt=>int_rt_out,
					exmem_rd=>int_rd_exmem_out,
					memwb_rd=>int_rd_memwb_out,
					exmem_regwrite=>int_control_signals_out_exmem(1),
					memwb_regwrite=>int_control_signals_out_memwb(1),
					mux_rs=>int_sel_forwardrs,
					mux_rt=>int_sel_forwardrt);
	
	--In the case of a data hazard, 
	--If it is a Load instruction, we route back the data read from RAM.
	--If it is a R-Type instruction, we route back the result of ALU in the EX/MEM stage.
	mux_ramdata_or_wbdata:mux_2x1_8bits
		port map(a=>int_alu_result_out_exmem,
					b=>int_read_data_ram,
				   sel=>int_MemRead_exmem,
				   opt=>int_ramdata_or_wbdata);
	
	MEMWB:MEM_WB 
		port map(greset=>greset,
					gclock=>gclock,
					instruction_in=>int_instruction_ex_mem,
					writeregister_val_in=>int_writeregister_val_out_exmem,
					control_signals_in=>int_control_signals_in_memwb,
					rd_memwb=>int_rd_exmem_out,
					read_ram_in=>int_read_data_ram,
					write_data_in=>int_alu_result_out_exmem,
					read_ram_out=>int_read_data_ram_out_memwb,
					write_data_out=>int_write_data_out_memwb,
					rd_memwb_out=>int_rd_memwb_out,
					writeregister_val_out=>int_writeregister_val_out_memwb,
					control_signals_out=>int_control_signals_out_memwb,
					instruction_out=>int_instruction_mem_wb);
			  
			  
	
	mux_memtoreg:mux_2x1_8bits 
		port map(a=>int_write_data_out_memwb,
					b=>int_read_data_ram_out_memwb,
					sel=>int_control_signals_out_memwb(0),--MemtoReg int_writeregister_val_out_memwb(0)
					opt=>int_write_data);
					
					
	-- In the case of a LoadUse Hazard, the bubble can cause delays.
	-- For example, when data is needed in ID/EX, but it just arrived in IF/ID (RegisterFile), it will not be
	-- available for use by the ALU. 
	-- Therefore, we must implement a mechanism to have these operands selected in the ID/EX stage.
	LoadUseHazard_FixUnit:LoadUseHazard_Fix
		port map(greset=>greset,
					gclock=>gclock,
					rs_ifid=>int_rs,
					rt_ifid=>int_rt,
					rs_idex=>int_rs_out,
					rt_idex=>int_rt_out,
					instruction=>int_instruction,
					operand1=>int_operand1,
					operand2=>int_operand2,
					operand1_out=>int_operand1_out,
					operand2_out=>int_operand2_out,
					same_rs=>int_same_rs,
					same_rt=>int_same_rt,
					new_instruction=>int_new_instructionsel);

					
	int_othervals<=(31 downto 7 => '0') & int_RegDst & int_Jump & int_MemRead & int_MemtoReg & int_ALUOp1 & int_ALUOp0
													& int_ALUSrc;
	valueSelect_mux:mux_8x1_32bits
		port map(a=>int_address32bits,
					b=>int_alu_result,
					c=>int_read_data1,
					d=>int_read_data2,
					e=>int_write_data,
					f=>int_othervals,
					g=>int_othervals,
					h=>int_othervals,
					sel=>ValueSelect,
					opt=>int_valueSelected);
	
	instSelect_mux:mux_8x1_32bits
		port map(a=>int_instruction,--ROM
					b=>int_instruction_if_id,--IF/ID
					c=>int_instruction_id_ex,--ID/EX
					d=>int_instruction_ex_mem,--EX/MEM
					e=>int_instruction_mem_wb,--MEM/WB
					f=>x"00000000",--0
					g=>x"00000000",--0
					h=>x"00000000",--0
					sel=>instrSelect,
					opt=>int_instrSelected);
	
	MuxOut<=int_valueSelected;
	InstructionOut<=int_instrSelected;
	BranchOut<=int_Branch;
	ZeroOut<=int_zero;
	MemWriteOut<=int_MemWrite_exmem;
	RegWriteOut<=int_RegWrite_memwb;
					
--	instruction<=int_instruction_if_id;
--	instruction_rom<=int_instruction;
--	new_instructionsel<=int_new_instructionsel;
--	same_rs<=int_same_rs;
--	same_rt<=int_same_rt;
--
--	operation<=int_operation;
--	
--	rs<=int_rs_out;
--	rt<=int_rt_out;
--	rd<=int_rd_out;
--	rs_prev<=int_rs;
--	rt_prev<=int_rt;
--	wb_data<=int_write_data;
--
--	sel_forwardrs<=int_sel_forwardrs;
--	sel_forwardrt<=int_sel_forwardrt;

--	operand1<=int_operand1_3options;
--	operand2<=int_operand2_3options;
--	operand1_out<=int_operand1;
--	operand2_out<=int_operand2;

end rtl;