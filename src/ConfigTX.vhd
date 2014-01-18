
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ConfigTX is
    Port ( ADD : in  STD_LOGIC_VECTOR (7 downto 0);
           D_0 : in  STD_LOGIC;
           D_1 : in  STD_LOGIC;
           D_2 : in  STD_LOGIC;
           D_3 : in  STD_LOGIC;
           D_4 : in  STD_LOGIC;
           D_5 : in  STD_LOGIC;
           D_6 : in  STD_LOGIC;
           D_7 : in  STD_LOGIC;
           TX_conf_enable : in  STD_LOGIC;
           Clock_RX : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  N_Reg_TX : out STD_LOGIC_VECTOR (3 downto 0) :="0000";
			  A_First_Reg : out STD_LOGIC_VECTOR (7 downto 0) :=X"00";
			  Clock_Div_TX : out STD_LOGIC_VECTOR (3 downto 0) :="0000");
end ConfigTX;

architecture Behavioral of ConfigTX is

begin

process(Clock_RX,Reset)
begin
	if Reset='0'
	then
		if Clock_RX='1' and TX_conf_enable='1'
		then
			N_Reg_TX <=  D_3&D_2&D_1&D_0 ;
			Clock_Div_TX <= D_7&D_6&D_5&D_4;
			A_First_Reg <= ADD ;
		end if;
	else
		N_Reg_TX <=  "0000" ;
		Clock_Div_TX <= "0000" ;
		A_First_Reg <= X"00" ;
	end if;	
end process;
end Behavioral;

