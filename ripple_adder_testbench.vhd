LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ripple_adder_testbench IS
END ripple_adder_testbench;
 
ARCHITECTURE behavior OF ripple_adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_adder
    PORT(
         A3 : IN  std_logic;
         A2 : IN  std_logic;
         A1 : IN  std_logic;
         A0 : IN  std_logic;
         B3 : IN  std_logic;
         B2 : IN  std_logic;
         B1 : IN  std_logic;
         B0 : IN  std_logic;
         Cin : IN  std_logic;
         S3 : OUT  std_logic;
         S2 : OUT  std_logic;
         S1 : OUT  std_logic;
         S0 : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A3 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A0 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S3 : std_logic;
   signal S2 : std_logic;
   signal S1 : std_logic;
   signal S0 : std_logic;
   signal Cout : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder PORT MAP (
          A3 => A3,
          A2 => A2,
          A1 => A1,
          A0 => A0,
          B3 => B3,
          B2 => B2,
          B1 => B1,
          B0 => B0,
          Cin => Cin,
          S3 => S3,
          S2 => S2,
          S1 => S1,
          S0 => S0,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		A3 <= '0';
		A2 <= '1';
		A1 <= '1';
		A0 <= '0';
		B3 <= '1';
		B2 <= '1';
		B1 <= '0';
		B0 <= '0';

      wait;
   end process;

END;
