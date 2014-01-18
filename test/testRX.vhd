
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY testRX IS
END testRX;
 
ARCHITECTURE behavior OF testRX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RX
    PORT(
         A_0 : IN  std_logic;
         A_1 : IN  std_logic;
         A_2 : IN  std_logic;
         A_3 : IN  std_logic;
         A_4 : IN  std_logic;
         A_5 : IN  std_logic;
         A_6 : IN  std_logic;
         A_7 : IN  std_logic;
         D_0 : IN  std_logic;
         D_1 : IN  std_logic;
         D_2 : IN  std_logic;
         D_3 : IN  std_logic;
         D_4 : IN  std_logic;
         D_5 : IN  std_logic;
         D_6 : IN  std_logic;
         D_7 : IN  std_logic;
         Clock_RX : IN  std_logic;
         RX_enable : IN  std_logic;
         RX_E : OUT  std_logic;
         ADD : OUT  std_logic_vector(7 downto 0);
         DAT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_0 : std_logic := '0';
   signal A_1 : std_logic := '0';
   signal A_2 : std_logic := '0';
   signal A_3 : std_logic := '0';
   signal A_4 : std_logic := '0';
   signal A_5 : std_logic := '0';
   signal A_6 : std_logic := '0';
   signal A_7 : std_logic := '0';
   signal D_0 : std_logic := '0';
   signal D_1 : std_logic := '0';
   signal D_2 : std_logic := '0';
   signal D_3 : std_logic := '0';
   signal D_4 : std_logic := '0';
   signal D_5 : std_logic := '0';
   signal D_6 : std_logic := '0';
   signal D_7 : std_logic := '0';
   signal Clock_RX : std_logic := '0';
   signal RX_enable : std_logic := '0';

 	--Outputs
   signal RX_E : std_logic;
   signal ADD : std_logic_vector(7 downto 0);
   signal DAT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clock_RX_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RX PORT MAP (
          A_0 => A_0,
          A_1 => A_1,
          A_2 => A_2,
          A_3 => A_3,
          A_4 => A_4,
          A_5 => A_5,
          A_6 => A_6,
          A_7 => A_7,
          D_0 => D_0,
          D_1 => D_1,
          D_2 => D_2,
          D_3 => D_3,
          D_4 => D_4,
          D_5 => D_5,
          D_6 => D_6,
          D_7 => D_7,
          Clock_RX => Clock_RX,
          RX_enable => RX_enable,
          RX_E => RX_E,
          ADD => ADD,
          DAT => DAT
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
      wait for 10 ns;	
		 A_0 <= '0';
          A_1 <= '0';
          A_2 <= '0';
          A_3 <= '0';
          A_4 <= '0';
          A_5 <= '1';
          A_6 <= '0';
          A_7 <= '1';
          D_0 <= '0';
          D_1 <= '1';
          D_2 <= '1';
          D_3 <= '1';
          D_4 <= '1';
          D_5 <= '1';
          D_6 <= '0';
          D_7 <= '0';
          RX_enable <= '1';
		 wait for 10 ns;	
		 A_0 <= '0';
          A_1 <= '0';
          A_2 <= '0';
          A_3 <= '0';
          A_4 <= '1';
          A_5 <= '1';
          A_6 <= '1';
          A_7 <= '1';
          D_0 <= '0';
          D_1 <= '0';
          D_2 <= '0';
          D_3 <= '0';
          D_4 <= '1';
          D_5 <= '1';
          D_6 <= '1';
          D_7 <= '1';
			 
		wait for 10 ns;	
		 A_0 <= '1';
          A_1 <= '1';
          A_2 <= '0';
          A_3 <= '0';
          A_4 <= '1';
          A_5 <= '1';
          A_6 <= '0';
          A_7 <= '0';
          D_0 <= '0';
          D_1 <= '0';
          D_2 <= '1';
          D_3 <= '1';
          D_4 <= '0';
          D_5 <= '0';
          D_6 <= '1';
          D_7 <= '1';
			 RX_enable <= '0';
      wait for Clock_RX_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
