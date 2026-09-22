transcript on
if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib vhdl_libs/altera
vmap altera ./vhdl_libs/altera
vcom -93 -work altera {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_syn_attributes.vhd}
vcom -93 -work altera {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_standard_functions.vhd}
vcom -93 -work altera {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/alt_dspbuilder_package.vhd}
vcom -93 -work altera {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_europa_support_lib.vhd}
vcom -93 -work altera {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_primitives_components.vhd}
vcom -93 -work altera {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_primitives.vhd}

vlib vhdl_libs/lpm
vmap lpm ./vhdl_libs/lpm
vcom -93 -work lpm {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/220pack.vhd}
vcom -93 -work lpm {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/220model.vhd}

vlib vhdl_libs/sgate
vmap sgate ./vhdl_libs/sgate
vcom -93 -work sgate {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/sgate_pack.vhd}
vcom -93 -work sgate {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/sgate.vhd}

vlib vhdl_libs/altera_mf
vmap altera_mf ./vhdl_libs/altera_mf
vcom -93 -work altera_mf {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_mf_components.vhd}
vcom -93 -work altera_mf {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_mf.vhd}

vlib vhdl_libs/altera_lnsim
vmap altera_lnsim ./vhdl_libs/altera_lnsim
vlog -sv -work altera_lnsim {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv}
vcom -93 -work altera_lnsim {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_lnsim_components.vhd}

vlib vhdl_libs/cycloneive
vmap cycloneive ./vhdl_libs/cycloneive
vcom -93 -work cycloneive {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cycloneive_atoms.vhd}
vcom -93 -work cycloneive {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cycloneive_components.vhd}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/IM_ROM.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/processor.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/PC.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/enARdFF_2.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/oneBitAdder.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/adder_8bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Rf_Register_8bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Substractor_8bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_5x1.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ALUcontrolblock.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/oneBitComparator.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/eightBitComparator.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ALU.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_2x1_8bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ShiftLeft_by2.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ControlLogicUnit.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_2x1_5bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/demux_1x32_8bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/signExtend.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/RAM_async.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/twobitcounter.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/twobitcomparator.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ShiftLeft_by2_28bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_ipt_array_type.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Register_32bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/IF_ID.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Register_9bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Register_5bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Register_6bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ID_EX.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_3x1_32bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/EX_MEM.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/MEM_WB.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/Register_2bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/ForwardingUnit.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/fiveBitComparator.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/HazardDetectionUnit.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_2x1_9bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/LoadUseHazard_Fix.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/mux_8x1_32bits.vhd}
vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/RegisterFile.vhd}

vcom -93 -work work {C:/Users/hadib/OneDrive/Desktop/Pipelined Processor/src/processor_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
