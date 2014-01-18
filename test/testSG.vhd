
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testSG IS
END testSG;
 
ARCHITECTURE behavior OF testSG IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT StateGen
    PORT(
         Clock_RX : IN  std_logic;
         RX_enable : IN  std_logic;
         TX_enable : IN  std_logic;
         TX_conf_enable : IN  std_logic;
         Reset : IN  std_logic;
         D_4 : IN  std_logic;
         D_5 : IN  std_logic;
         D_6 : IN  std_logic;
         D_7 : IN  std_logic;
         S_0 : OUT  std_logic;
         S_1 : OUT  std_logic;
         S_2 : OUT  std_logic;
         S_3 : OUT  std_logic;
         S_4 : OUT  std_logic;
         S_5 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock_RX : std_logic := '0';
   signal RX_enable : std_logic := '0';
   signal TX_enable : std_logic := '0';
   signal TX_conf_enable : std_logic := '0';
   signal Reset : std_logic := '0';
   signal D_4 : std_logic := '0';
   signal D_5 : std_logic := '0';
   signal D_6 : std_logic := '0';
   signal D_7 : std_logic := '0';

 	--Outputs
   signal S_0 : std_logic;
   signal S_1 : std_logic;
   signal S_2 : std_logic;
   signal S_3 : std_logic;
   signal S_4 : std_logic;
   signal S_5 : std_logic;

   -- Clock period definitions
   constant Clock_RX_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StateGen PORT MAP (
          Clock_RX => Clock_RX,
          RX_enable => RX_enable,
          TX_enable => TX_enable,
          TX_conf_enable => TX_conf_enable,
          Reset => Reset,
          D_4 => D_4,
          D_5 => D_5,
          D_6 => D_6,
          D_7 => D_7,
          S_0 => S_0,
          S_1 => S_1,
          S_2 => S_2,
          S_3 => S_3,
          S_4 => S_4,
          S_5 => S_5
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
      -- hold reset state for 100 ns.
      wait for Clock_RX_period*5;	
			 RX_enable <='0';
          TX_enable <= '0';
          TX_conf_enable <= '0';
         -- Reset => Reset,
         -- D_4 => D_4,
         -- D_5 => D_5,
        --  D_6 => D_6,
        --  D_7 => D_7,
      wait for Clock_RX_period*5;
	RX_enable <='1';
	wait for Clock_RX_period*5;
      -- insert stimulus here 
		RX_enable <='0';
			 TX_conf_enable <= '1';
		wait for Clock_RX_period*5;	 
			 TX_conf_enable <= '0';
          TX_enable <= '1';
			 D_4 <= '1';
          D_5 <= '0';
          D_6 <= '0';
          D_7 <= '0';
		wait for Clock_RX_period*5;	 
			 D_4 <= '1';
          D_5 <= '1';
          D_6 <= '0';
          D_7 <= '0';
		wait for Clock_RX_period*5;	 
			 D_4 <= '0';
          D_5 <= '0';
          D_6 <= '0';
          D_7 <= '0';
		wait for Clock_RX_period*5;
			Reset <='1';
		wait for Clock_RX_period*5;
			Reset <='0';
			TX_enable <= '0';
			RX_enable <='1';
		wait for Clock_RX_period*5;
			RX_enable <='0';
      wait;
   end process;

END;
