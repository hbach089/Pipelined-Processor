LIBRARY lpm,IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
USE lpm.lpm_components.all;

entity IM_ROM is
port(gclock:in std_logic;
	  address:in std_logic_vector(7 downto 0);
	  instruction:out std_logic_vector(31 downto 0));
end IM_ROM;

architecture rtl of IM_ROM is
type ROM_TYPE is array (0 to 255) of std_logic_vector(31 downto 0);

component LPM_ROM
        generic (LPM_WIDTH : natural;    -- MUST be greater than 0
                 LPM_WIDTHAD : natural;    -- MUST be greater than 0
  					  LPM_NUMWORDS : natural :=0;--:= 256
					  LPM_ADDRESS_CONTROL : string := "REGISTERED";
					  LPM_OUTDATA : string := "UNREGISTERED";
					  LPM_FILE : string:="IR_memory.mif";
					  LPM_TYPE : string := L_ROM;
					  INTENDED_DEVICE_FAMILY  : string := "UNUSED";
					  LPM_HINT : string := "UNUSED");

			  port (ADDRESS : in STD_LOGIC_VECTOR(LPM_WIDTHAD-1 downto 0);
			   	  INCLOCK : in STD_LOGIC := '0';
					  OUTCLOCK : in STD_LOGIC := '0';
					  MEMENAB : in STD_LOGIC := '1';
					  Q : out STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0));

end component;

begin
	rom_instance: COMPONENT LPM_ROM 

		GENERIC MAP(LPM_WIDTH => 32, 
                  LPM_WIDTHAD => 8)

		PORT MAP ( address => address, 
					  inclock => gclock, 
--					  outclock => gclock,
					  MEMENAB => '1',
					  q => instruction
);
end rtl;
