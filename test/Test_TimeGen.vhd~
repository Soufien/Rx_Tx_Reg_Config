
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_TimeGen IS
END test_TimeGen;
 
ARCHITECTURE behavior OF test_TimeGen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TimeGen
    PORT(
         Clock_in : IN  std_logic;
         freq : IN  std_logic;
         Clock_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock_in : std_logic := '0';
   signal freq : std_logic := '0';

 	--Outputs
   signal Clock_out : std_logic;

   -- Clock period definitions
   constant Clock_in_period : time := 10 ns;
   constant Clock_out_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TimeGen PORT MAP (
          Clock_in => Clock_in,
          freq => freq,
          Clock_out => Clock_out
        );

   -- Clock process definitions
   process
   begin
		freq <= '0' ;
		Clock_in <= '0';
		wait for 20 NS;
		Clock_in <= '1';
		wait for 20 NS;
		Clock_in <= '0';
		wait for 20 NS;
		Clock_in <= '1';
		wait for 20 NS;
		Clock_in <= '0';
		wait for 20 NS;
		Clock_in <= '1';
		wait for 20 NS;
		Clock_in <= '0';
		wait for 20 NS;
		Clock_in <= '1';
		wait for 20 NS;
		Clock_in <= '0';
		wait for 20 NS;
		Clock_in <= '1';
		wait for 20 NS;
		Clock_in <= '0';
		wait for 20 NS;
		Clock_in <= '1';
		wait for 20 NS;
   end process;

END;
