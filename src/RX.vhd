
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RX is
    Port ( A_0 : in  STD_LOGIC;
           A_1 : in  STD_LOGIC;
           A_2 : in  STD_LOGIC;
           A_3 : in  STD_LOGIC;
           A_4 : in  STD_LOGIC;
           A_5 : in  STD_LOGIC;
           A_6 : in  STD_LOGIC;
           A_7 : in  STD_LOGIC;
           D_0 : in  STD_LOGIC;
           D_1 : in  STD_LOGIC;
           D_2 : in  STD_LOGIC;
           D_3 : in  STD_LOGIC;
           D_4 : in  STD_LOGIC;
           D_5 : in  STD_LOGIC;
           D_6 : in  STD_LOGIC;
           D_7 : in  STD_LOGIC;
			  Clock_RX : in STD_LOGIC;
			  RX_enable : in STD_LOGIC;
			  RX_E : out STD_LOGIC;
			  ADD : out STD_LOGIC_VECTOR (7 downto 0);
			  DAT : out STD_LOGIC_VECTOR (7 downto 0));
end RX;
architecture Behavioral of RX is
begin

ADD <= A_7&A_6&A_5&A_4&A_3&A_2&A_1&A_0 ;
DAT <= D_7&D_6&D_5&D_4&D_3&D_2&D_1&D_0 ;

process(Clock_RX)
begin
	if RX_enable='1' and Clock_RX='1'
	then
		RX_E <= '1' ;
	else
		if Clock_RX='1'
		then
			RX_E <= '0' ;
		end if;
	end if;
end process;

end Behavioral;
