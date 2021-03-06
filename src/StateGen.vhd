
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity StateGen is
    Port ( Clock_RX : in  STD_LOGIC;
           RX_enable : in  STD_LOGIC;
           TX_enable : in  STD_LOGIC;
           TX_conf_enable : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  D_4 : in  STD_LOGIC;
           D_5 : in  STD_LOGIC;
           D_6 : in  STD_LOGIC;
           D_7 : in  STD_LOGIC;
           S_0 : out  STD_LOGIC :='0';
           S_1 : out  STD_LOGIC :='0';
           S_2 : out  STD_LOGIC :='0';
           S_3 : out  STD_LOGIC :='0';
           S_4 : out  STD_LOGIC :='0';
           S_5 : out  STD_LOGIC :='0');
end StateGen;

architecture Behavioral of StateGen is

begin
process(Clock_RX)
begin
	if Clock_RX='1'
	then
		if Reset ='1'
		then
			s_0<='1';s_1<='0';s_2<='0';
			s_3<='0';s_4<='0';s_5<='0';
		else
			if RX_enable='1' and TX_enable='0'
			then
				s_0<='0';S_1<='1';s_2<='0';
				s_3<='0';s_4<='0';s_5<='0';
			end if;
			if RX_enable='0' and TX_enable='0'
			then
				s_0<='1';S_1<='0';s_2<='0';
				s_3<='0';s_4<='0';s_5<='0';
			end if;
			if TX_conf_enable='1'
			then
				s_0<='0';S_1<='0';s_2<='1';
				s_3<='0';s_4<='0';s_5<='0';
			else
				if TX_enable='1' and RX_enable='0'
				then
					if D_4='0' and D_5='0' and D_6='0' and D_7='0'
					then
						S_3<='1';s_0<='0';
						S_4<='0';S_1<='0';
						S_5<='0';s_2<='0';
					else
						if ((D_4 XOR D_5) XOR (D_6 XOR D_7))='0'
						then
							S_3<='0';s_0<='0';
							S_4<='1';S_1<='0';
							S_5<='0';s_2<='0';
						else
							S_3<='0';s_0<='0';
							S_4<='0';S_1<='0';
							S_5<='1';s_2<='0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;

