library ieee;
use ieee.std_logic_1164.all;

entity ForwardingUnit_tb is
end ForwardingUnit_tb;

architecture testbench of ForwardingUnit_tb  is
signal greset_tb,gclock_tb: std_logic;
signal ifid_rs_tb,ifid_rt_tb: std_logic_vector(4 downto 0);
signal exmem_rd_tb,memwb_rd_tb: std_logic_vector(4 downto 0);
signal exmem_regwrite_tb,memwb_regwrite_tb: std_logic;
signal mux_rs_tb,mux_rt_tb:std_logic_vector(1 downto 0);
signal MEMrs_tb,MEMrt_tb,WBrs_tb,WBrt_Tb: std_logic;

	component ForwardingUnit IS
		port(greset,gclock:in std_logic;
			  ifid_rs,ifid_rt:in std_logic_vector(4 downto 0);
			  exmem_rd,memwb_rd:in std_logic_vector(4 downto 0);
			  exmem_regwrite,memwb_regwrite:in std_logic;
			  mux_rs,mux_rt:out std_logic_vector(1 downto 0);
			  MEMrs,MEMrt,WBrs,WBrt: out std_logic);
	END component;

begin
	dut:ForwardingUnit
		port map(greset=>greset_tb,
				   gclock=>gclock_tb,
					ifid_rs=>ifid_rs_tb,
					ifid_rt=>ifid_rt_tb,
				   exmem_rd=>exmem_rd_tb,
					memwb_rd=>memwb_rd_tb,
					exmem_regwrite=>exmem_regwrite_tb,
					memwb_regwrite=>memwb_regwrite_tb,
					mux_rs=>mux_rs_tb,
					mux_rt=>mux_rt_tb,
					MEMrs=>MEMrs_Tb,MEMrt=>MEMrt_tb,WBrs=>WBrs_tb,WBrt=>WBrt_tb);

	clk_process:process
	begin
		gclock_tb<='1';
		wait for 1ns;
		gclock_tb<='0';
		wait for 1ns;
	end process;
	
	stim:process
	begin
		greset_tb<='0','1' after 2ns;
		ifid_rs_tb<="01100";ifid_rt_tb<="10001";
		exmem_rd_tb<="10011";memwb_rd_tb<="10001";
		exmem_regwrite_tb<='1';memwb_regwrite_tb<='1';
		wait for 2ns;
		wait for 2ns;
		wait for 2ns;
		ifid_rs_tb<="00000";ifid_rt_tb<="10001";
		exmem_rd_tb<="10011";memwb_rd_tb<="00000";
		exmem_regwrite_tb<='1';memwb_regwrite_tb<='1';
		wait for 4ns;
		ifid_rs_tb<="01100";ifid_rt_tb<="10001";
		exmem_rd_tb<="10001";memwb_rd_tb<="10011";
		exmem_regwrite_tb<='1';memwb_regwrite_tb<='1';
		wait for 10ns;
		ifid_rs_tb<="01100";ifid_rt_tb<="10001";
		exmem_rd_tb<="10001";memwb_rd_tb<="01100";
		exmem_regwrite_tb<='0';memwb_regwrite_tb<='1';
		wait for 8ns;
		exmem_rd_tb<="10001";memwb_rd_tb<="10001";
		exmem_regwrite_tb<='1';memwb_regwrite_tb<='1';
		wait for 6ns;
		ifid_rs_tb<="10001";ifid_rt_tb<="10101";
		wait;
	end process;
end testbench;