
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity TimeGen is
    Port ( Clock_in : in  STD_LOGIC;
			  freq : in STD_LOGIC_VECTOR (3 downto 0);
           Clock_out : out  STD_LOGIC);
end TimeGen;

architecture Behavioral of TimeGen is
 
 signal new_clock : STD_LOGIC:='0' ;
 signal freqDiv4 : STD_LOGIC:='0' ;
 signal parity : STD_LOGIC;
begin

	
	Clock_out <= Clock_in when freq="0000" else
					new_clock;
	parity <= freq(0) xor freq(1) xor freq(2) xor freq(3) ;
	
	process(Clock_in)
	begin
		if Clock_in='1'
		then
			if parity='0'
			then
				new_clock <= not new_clock;
			end if;
			if parity='1'
			then
				if freqDiv4='0'
				then
					freqDiv4<='1';
				else
					new_clock <= not new_clock;
					freqDiv4 <= '0';
				end if;
			end if;
			
		end if;
	end process;
end Behavioral;
