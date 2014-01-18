
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testTX IS
END testTX;
 
ARCHITECTURE behavior OF testTX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TX
    PORT(
         Clock_TX : IN  std_logic;
         TX_enable : IN  std_logic;
         Reset : IN  std_logic;
         A_First_Reg : IN  std_logic_vector(7 downto 0);
         N_Reg_TX : IN  std_logic_vector(3 downto 0);
         ADD : OUT  std_logic_vector(7 downto 0);
         IND : OUT  std_logic_vector(2 downto 0);
         TX_E : OUT  std_logic;
         A_TX : OUT  std_logic;
         END_TX : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock_TX : std_logic := '0';
   signal TX_enable : std_logic := '0';
   signal Reset : std_logic := '0';
   signal A_First_Reg : std_logic_vector(7 downto 0) := (others => '0');
   signal N_Reg_TX : std_logic_vector(3 downto 0) := (others => '0');
   
 	--Outputs
   signal ADD : std_logic_vector(7 downto 0);
   signal IND : std_logic_vector(2 downto 0);
   signal TX_E : std_logic;
   signal A_TX : std_logic;
   signal END_TX : std_logic;

   -- Clock period definitions
   constant Clock_TX_period : time := 10 ns;
   constant Clock_Div_TX_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TX PORT MAP (
          Clock_TX => Clock_TX,
          TX_enable => TX_enable,
          Reset => Reset,
          A_First_Reg => A_First_Reg,
          N_Reg_TX => N_Reg_TX,
          ADD => ADD,
          IND => IND,
          TX_E => TX_E,
          A_TX => A_TX,
          END_TX => END_TX
        );

   -- Clock process definitions
   Clock_TX_process :process
   begin
		Clock_TX <= '0';
		wait for Clock_TX_period/2;
		Clock_TX <= '1';
		wait for Clock_TX_period/2;
   end process;
 
  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A_First_Reg <= X"02";
		N_Reg_TX <= X"2";
		TX_enable <= '1';
          
      wait for Clock_TX_period*10;
		--Reset <= '1';
      -- insert  
      wait;
   end process;

END;
