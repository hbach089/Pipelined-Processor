LIBRARY lpm,IEEE;
use IEEE.std_logic_1164.all;
USE lpm.lpm_components.all;

entity DM_RAM is
port(gclock:in std_logic;
     MemWrite,MemRead:in std_logic;
	  address:in std_logic_vector(7 downto 0);
	  write_data:in std_logic_vector(31 downto 0);
	  read_data:out std_logic_vector(31 downto 0));
end DM_RAM;

architecture rtl of DM_RAM is
signal int_read_data:std_logic_vector(31 downto 0);

	component LPM_RAM_DQ
		  generic (LPM_WIDTH : natural;    -- MUST be greater than 0
					  LPM_WIDTHAD : natural;    -- MUST be greater than 0
					  LPM_NUMWORDS : natural := 0;
					  LPM_INDATA : string := "REGISTERED";
					  LPM_ADDRESS_CONTROL: string := "REGISTERED";
					  LPM_OUTDATA : string := "UNREGISTERED";
					  LPM_FILE : string := "DR_memory.mif";
					  LPM_TYPE : string := L_RAM_DQ;
					  USE_EAB  : string := "ON";
					  INTENDED_DEVICE_FAMILY  : string := "UNUSED";
					  LPM_HINT : string := "UNUSED");
					  port (DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
							 ADDRESS : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
							 INCLOCK : in std_logic := '0';
							 OUTCLOCK : in std_logic := '0';
							 WE : in std_logic;
							 Q : out std_logic_vector(LPM_WIDTH-1 downto 0));
	end component;
begin
ram_instance: COMPONENT LPM_RAM_DQ 

		GENERIC MAP(LPM_WIDTH => 32, 
                  LPM_WIDTHAD => 8)

		PORT MAP ( data=>write_data,
					  address => address, 
					  inclock => gclock, 
--					  outclock => gclock,
					  WE => MemWrite,
					  q => int_read_data
);

	read_data<=(int_read_data and (31 downto 0 => (MemRead)));
--	read_data<=int_read_data;
end rtl;