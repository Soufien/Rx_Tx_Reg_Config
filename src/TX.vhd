
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity TX is
    Port ( Clock_TX : in  STD_LOGIC;
           TX_enable : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           A_First_Reg : in  STD_LOGIC_VECTOR (7 downto 0);
           N_Reg_TX : in  STD_LOGIC_VECTOR (3 downto 0);
			  ADD : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
			  IND : out STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
			  TX_E : out STD_LOGIC := '0' ;
           A_TX : out  STD_LOGIC := '0';
           END_TX : out  STD_LOGIC := '0');
end TX;
architecture Behavioral of TX is 
begin

process
begin
	wait until TX_enable='1';
	TX_E <= '1' ; 
	for j in 0 to conv_integer(N_Reg_TX)-1 loop
		ADD <= conv_std_logic_vector(conv_integer(A_First_Reg)+j,8);
		for k in 0 to 7 loop
			if Reset='1'
			then
				exit;
			end if;
			wait until Clock_TX='1' ;
			IND <= conv_std_logic_vector(k,3);
			A_TX <= conv_std_logic_vector(conv_integer(A_First_Reg)+j,8)(k) ; 
			wait until Clock_TX='0';
		end loop;
		if Reset='1'
		then
			exit;
		end if;
	end loop;
	if Reset='0'
	then
		END_TX <= '1';
		WAIT ON Clock_TX;
		WAIT UNTIL Clock_TX='1';
		END_TX <= '0';
		TX_E <= '0';
	end if;
end process;

end Behavioral;
