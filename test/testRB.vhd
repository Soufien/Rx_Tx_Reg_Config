
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY testRB IS
END testRB;
 
ARCHITECTURE behavior OF testRB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_Banc
    PORT(
         ADD : IN  std_logic_vector(7 downto 0);
         IND : IN  std_logic_vector(2 downto 0);
         DAT : IN  std_logic_vector(7 downto 0);
         RX_enable : IN  std_logic;
         TX_enable : IN  std_logic;
         Reset : IN  std_logic;
         D_TX : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ADD : std_logic_vector(7 downto 0) := (others => '0');
   signal IND : std_logic_vector(2 downto 0) := (others => '0');
   signal DAT : std_logic_vector(7 downto 0) := (others => '0');
   signal RX_enable : std_logic := '0';
   signal TX_enable : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal D_TX : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_Banc PORT MAP (
          ADD => ADD,
          IND => IND,
          DAT => DAT,
          RX_enable => RX_enable,
          TX_enable => TX_enable,
          Reset => Reset,
          D_TX => D_TX
        );

   
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      wait for 10 ns;	
		 ADD <= X"00";
		 IND <= "000";
		 RX_enable <= '0';
		 TX_enable <= '1';
		wait for 10 ns;	
		 IND <= "001";
		wait for 10 ns;	
		 IND <= "010";
		wait for 10 ns;	
		 IND <= "011";
		wait for 10 ns;	
		 IND <= "100";
		wait for 10 ns;	
		 IND <= "101";
		wait for 10 ns;	
		 IND <= "110";
		wait for 10 ns;	
		 IND <= "111";
		wait for 10 ns;
		 DAT <= X"FF";
		 
		wait for 10 ns;		
		 ADD <= X"05";
		 RX_enable <= '1';
		 TX_enable <= '0';
		 
		wait for 10 ns;
		  DAT <= X"AA";
		 wait for 10 ns;
		  ADD <= X"06";
		wait for 10 ns;
		  DAT <= X"00";
		wait for 10 ns;
		  ADD <= X"07";
		
		wait for 10 ns;	
		 ADD <= X"05";
		 RX_enable <= '0';
		 TX_enable <= '1';
		
		 
		wait for 10 ns;	
		 ADD <= X"06";
		 RX_enable <= '0';
		 TX_enable <= '1';
		 IND <= "000";
		wait for 10 ns;	
		
   end process;

END;
