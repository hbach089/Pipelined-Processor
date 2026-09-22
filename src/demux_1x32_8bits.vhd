library ieee;
use ieee.std_logic_1164.all;

entity demux_1x32_8bits is
port(ipt:in std_logic_vector(4 downto 0);
	  opt0,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,opt11,opt12,opt13,opt14,opt15,opt16,opt17,opt18,opt19,opt20,opt21,opt22,opt23,opt24,opt25,opt26,opt27,opt28,opt29,opt30,opt31:out std_logic);
end demux_1x32_8bits;

architecture rtl of demux_1x32_8bits is
begin
	opt0<=(not(ipt(0)) and not(ipt(1)) and not(ipt(2)) and not(ipt(3)) and not(ipt(4)));		  
		  
	opt1<=((ipt(0)) and not(ipt(1)) and not(ipt(2)) and not(ipt(3)) and not(ipt(4)));
		  
	opt2<=(not(ipt(0)) and (ipt(1)) and not(ipt(2)) and not(ipt(3)) and not(ipt(4)));
		  
	opt3<=((ipt(0)) and (ipt(1)) and not(ipt(2)) and not(ipt(3)) and not(ipt(4)));
	
	opt4<=(not(ipt(0)) and not(ipt(1)) and (ipt(2)) and not(ipt(3)) and not(ipt(4)));		  
		  
	opt5<=((ipt(0)) and not(ipt(1)) and (ipt(2)) and not(ipt(3)) and not(ipt(4)));
		  
	opt6<=(not(ipt(0)) and (ipt(1)) and (ipt(2)) and not(ipt(3)) and not(ipt(4)));
		  
	opt7<=((ipt(0)) and (ipt(1)) and (ipt(2)) and not(ipt(3)) and not(ipt(4)));
	
	opt8<=(not(ipt(0)) and not(ipt(1)) and not(ipt(2)) and (ipt(3)) and not(ipt(4)));		  
		  
	opt9<=((ipt(0)) and not(ipt(1)) and not(ipt(2)) and (ipt(3)) and not(ipt(4)));
		  
	opt10<=(not(ipt(0)) and (ipt(1)) and not(ipt(2)) and (ipt(3)) and not(ipt(4)));
		  
	opt11<=((ipt(0)) and (ipt(1)) and not(ipt(2)) and (ipt(3)) and not(ipt(4)));
	
	opt12<=(not(ipt(0)) and not(ipt(1)) and (ipt(2)) and (ipt(3)) and not(ipt(4)));		  
		  
	opt13<=((ipt(0)) and not(ipt(1)) and (ipt(2)) and (ipt(3)) and not(ipt(4)));
		  
	opt14<=(not(ipt(0)) and (ipt(1)) and (ipt(2)) and (ipt(3)) and not(ipt(4)));
		  
	opt15<=((ipt(0)) and (ipt(1)) and (ipt(2)) and (ipt(3)) and not(ipt(4)));
	
	opt16<=(not(ipt(0)) and not(ipt(1)) and not(ipt(2)) and not(ipt(3)) and (ipt(4)));		  
		  
	opt17<=((ipt(0)) and not(ipt(1)) and not(ipt(2)) and not(ipt(3)) and (ipt(4)));
		  
	opt18<=(not(ipt(0)) and (ipt(1)) and not(ipt(2)) and not(ipt(3)) and (ipt(4)));
		  
	opt19<=((ipt(0)) and (ipt(1)) and not(ipt(2)) and not(ipt(3)) and (ipt(4)));
	
	opt20<=(not(ipt(0)) and not(ipt(1)) and (ipt(2)) and not(ipt(3)) and (ipt(4)));		  
		  
	opt21<=((ipt(0)) and not(ipt(1)) and (ipt(2)) and not(ipt(3)) and (ipt(4)));
		  
	opt22<=(not(ipt(0)) and (ipt(1)) and (ipt(2)) and not(ipt(3)) and (ipt(4)));
		  
	opt23<=((ipt(0)) and (ipt(1)) and (ipt(2)) and not(ipt(3)) and (ipt(4)));
	
	opt24<=(not(ipt(0)) and not(ipt(1)) and not(ipt(2)) and (ipt(3)) and (ipt(4)));		  
		  
	opt25<=((ipt(0)) and not(ipt(1)) and not(ipt(2)) and (ipt(3)) and (ipt(4)));
		  
	opt26<=(not(ipt(0)) and (ipt(1)) and not(ipt(2)) and (ipt(3)) and (ipt(4)));
		  
	opt27<=((ipt(0)) and (ipt(1)) and not(ipt(2)) and (ipt(3)) and (ipt(4)));
	
	opt28<=(not(ipt(0)) and not(ipt(1)) and (ipt(2)) and not(ipt(3)) and (ipt(4)));		  
		  
	opt29<=((ipt(0)) and not(ipt(1)) and (ipt(2)) and (ipt(3)) and (ipt(4)));
		  
	opt30<=(not(ipt(0)) and (ipt(1)) and (ipt(2)) and (ipt(3)) and (ipt(4)));
		  
	opt31<=((ipt(0)) and (ipt(1)) and (ipt(2)) and (ipt(3)) and (ipt(4)));
	
		  
end rtl;