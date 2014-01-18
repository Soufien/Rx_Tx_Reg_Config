
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RX_TX is
    Port ( Clock_RX : in  STD_LOGIC;
           RX_enable : in  STD_LOGIC;
           TX_enable : in  STD_LOGIC;
           TX_conf_enable : in  STD_LOGIC;
           D_7,D_6,D_5,D_4,D_3,D_2,D_1,D_0 : in  STD_LOGIC;
           A_7,A_6,A_5,A_4,A_3,A_2,A_1,A_0 : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           GND : in  STD_LOGIC;
           Vcc : in  STD_LOGIC;
           S_5,S_4,S_3,S_2,S_1,S_0 : out  STD_LOGIC;
           Clock_TX : out  STD_LOGIC;
           D_TX : out  STD_LOGIC;
           A_TX : out  STD_LOGIC;
           END_TX : out  STD_LOGIC);
end RX_TX;

architecture Behavioral of RX_TX is
	component RX
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
		end component;
		
		component TX
		Port ( Clock_TX : in  STD_LOGIC;
           TX_enable : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           A_First_Reg : in  STD_LOGIC_VECTOR (7 downto 0);
           N_Reg_TX : in  STD_LOGIC_VECTOR (3 downto 0);
           ADD : out STD_LOGIC_VECTOR (7 downto 0);
			  IND : out STD_LOGIC_VECTOR (2 downto 0);
			  TX_E : out STD_LOGIC ;
           A_TX : out  STD_LOGIC;
           END_TX : out  STD_LOGIC);
		end component;
		
		component Register_Banc
		Port ( ADD : in  STD_LOGIC_VECTOR (7 downto 0);
			  IND : in STD_LOGIC_VECTOR (2 downto 0);
           DAT : in  STD_LOGIC_VECTOR (7 downto 0);
           RX_E : in  STD_LOGIC;
           TX_E : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           D_TX : out  STD_LOGIC);
		end component;
		
		component StateGen
		Port ( Clock_RX : in  STD_LOGIC;
           RX_enable : in  STD_LOGIC;
           TX_enable : in  STD_LOGIC;
           TX_conf_enable : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  D_4 : in  STD_LOGIC;
           D_5 : in  STD_LOGIC;
           D_6 : in  STD_LOGIC;
           D_7 : in  STD_LOGIC;
           S_0 : out  STD_LOGIC;
           S_1 : out  STD_LOGIC;
           S_2 : out  STD_LOGIC;
           S_3 : out  STD_LOGIC;
           S_4 : out  STD_LOGIC;
           S_5 : out  STD_LOGIC);
		end component;
		
		component TimeGen
		Port ( Clock_in : in  STD_LOGIC;
			  freq : in STD_LOGIC_VECTOR (3 downto 0);
           Clock_out : out  STD_LOGIC);
		end component;
		
		component ConfigTX
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
			  N_Reg_TX : out STD_LOGIC_VECTOR (3 downto 0);
			  A_First_Reg : out STD_LOGIC_VECTOR (7 downto 0);
			  Clock_Div_TX : out STD_LOGIC_VECTOR (3 downto 0));
		end component;
		
		signal ADD, DAT, A_First_Reg : STD_LOGIC_VECTOR (7 downto 0);
		signal N_Reg_TX, Clock_Div_TX : STD_LOGIC_VECTOR (3 downto 0);
		signal IND : STD_LOGIC_VECTOR (2 downto 0);
		signal SClock_TX,RX_Es, TX_Es : STD_LOGIC ;

begin

	rxInst : RX port map (D_7 => D_7, D_6 => D_6, D_5 => D_5, D_4 => D_4, D_3 => D_3, D_2 => D_2, D_1 => D_1, D_0 => D_0, 
								A_7 => A_7, A_6 => A_6, A_5 => A_5, A_4 => A_4, A_3 => A_3, A_2 => A_2, A_1 => A_1, A_0 => A_0,
								Clock_RX => Clock_RX, RX_enable => RX_enable, RX_E => RX_Es, ADD => ADD, DAT => DAT);
								
	txInst : TX port map (Clock_TX => SClock_TX, TX_enable => TX_enable, Reset => Reset, A_First_Reg => A_First_Reg,
								N_Reg_TX => N_Reg_TX, ADD => ADD, IND => IND,TX_E => TX_Es,
								A_TX => A_TX, END_TX => END_TX);
								
	rbInst : Register_Banc port map (ADD => ADD, IND => IND, DAT => DAT, RX_E => RX_Es, TX_E => TX_Es,
											Reset => Reset, D_TX => D_TX);
											
	sgInst : StateGen port map (Clock_RX => Clock_RX, RX_enable => RX_enable, TX_enable => TX_enable, 
										TX_conf_enable => TX_conf_enable, Reset => Reset, S_5 => S_5, S_4 => S_4, S_3 => S_3, 
										S_2 => S_2, S_1 => S_1, S_0 => S_0,D_7 => D_7, D_6 => D_6, D_5 => D_5, D_4 => D_4);

	tgInst : TimeGen port map (Clock_in => Clock_RX, freq => Clock_Div_TX, Clock_out => SClock_TX);
	
	cfInst : ConfigTX port map (ADD => ADD, D_7 => D_7, D_6 => D_6, D_5 => D_5, D_4 => D_4, D_3 => D_3, D_2 => D_2, 
									D_1 => D_1, D_0 => D_0, TX_conf_enable => TX_conf_enable, Clock_RX => Clock_RX,
									Reset => Reset, N_Reg_TX => N_Reg_TX, A_First_Reg => A_First_Reg, Clock_Div_TX => Clock_Div_TX);
									
	Clock_TX <= SClock_TX ;

end Behavioral;

