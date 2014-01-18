
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY testCTX IS
END testCTX;
 
ARCHITECTURE behavior OF testCTX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ConfigTX
    PORT(
         ADD : IN  std_logic_vector(7 downto 0);
         D_0 : IN  std_logic;
         D_1 : IN  std_logic;
         D_2 : IN  std_logic;
         D_3 : IN  std_logic;
         D_4 : IN  std_logic;
         D_5 : IN  std_logic;
         D_6 : IN  std_logic;
         D_7 : IN  std_logic;
         TX_conf_enable : IN  std_logic;
         Clock_RX : IN  std_logic;
         Reset : IN  std_logic;
         N_Reg_TX : OUT  std_logic_vector(3 downto 0);
         A_First_Reg : OUT  std_logic_vector(7 downto 0);
         Clock_Div_TX : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADD : std_logic_vector(7 downto 0) := (others => '0');
   signal D_0 : std_logic := '0';
   signal D_1 : std_logic := '0';
   signal D_2 : std_logic := '0';
   signal D_3 : std_logic := '0';
   signal D_4 : std_logic := '0';
   signal D_5 : std_logic := '0';
   signal D_6 : std_logic := '0';
   signal D_7 : std_logic := '0';
   signal TX_conf_enable : std_logic := '0';
   signal Clock_RX : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal N_Reg_TX : std_logic_vector(3 downto 0);
   signal A_First_Reg : std_logic_vector(7 downto 0);
   signal Clock_Div_TX : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clock_RX_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ConfigTX PORT MAP (
          ADD => ADD,
          D_0 => D_0,
          D_1 => D_1,
          D_2 => D_2,
          D_3 => D_3,
          D_4 => D_4,
          D_5 => D_5,
          D_6 => D_6,
          D_7 => D_7,
          TX_conf_enable => TX_conf_enable,
          Clock_RX => Clock_RX,
          Reset => Reset,
          N_Reg_TX => N_Reg_TX,
          A_First_Reg => A_First_Reg,
          Clock_Div_TX => Clock_Div_TX
        );

   -- Clock process definitions
   Clock_RX_process :process
   begin
		Clock_RX <= '0';
		wait for Clock_RX_period/2;
		Clock_RX <= '1';
		wait for Clock_RX_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      wait for 10 ns;	
			 ADD <= X"AA";
          D_0 <= '1';
          D_1 <= '1';
          D_2 <= '1';
          D_3 <= '0';
          D_4 <= '0';
          D_5 <= '1';
          D_6 <= '1';
          D_7 <= '1';
          
       
      wait for Clock_RX_period*5;
		TX_conf_enable <= '1';
		wait for Clock_RX_period*5;
		TX_conf_enable <= '0';
		ADD <= X"FF";
          D_0 <= '1';
          D_1 <= '0';
          D_2 <= '1';
          D_3 <= '0';
          D_4 <= '1';
          D_5 <= '0';
          D_6 <= '1';
          D_7 <= '0';
		wait for Clock_RX_period*5;
		TX_conf_enable <= '1';
		wait for Clock_RX_period*5;
		TX_conf_enable <= '0';
		ADD <= X"EE";
          D_0 <= '1';
          D_1 <= '1';
          D_2 <= '1';
          D_3 <= '0';
          D_4 <= '0';
          D_5 <= '0';
          D_6 <= '0';
          D_7 <= '1';
		wait for Clock_RX_period*5;
		TX_conf_enable <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
