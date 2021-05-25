LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fourbit_multi_testbench IS
END fourbit_multi_testbench;
 
ARCHITECTURE behavior OF fourbit_multi_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fourbit_multi
    PORT(
         num1 : IN  std_logic_vector(3 downto 0);
         num2 : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal num1 : std_logic_vector(3 downto 0) := (others => '0');
   signal num2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fourbit_multi PORT MAP (
          num1 => num1,
          num2 => num2,
          output => output
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		num1 <="1001";
		num2 <="1100";
		wait for 100 ns;
		num1 <="1101";
		num2 <="1011";
		wait for 100 ns;
		num1 <="1110";
		num2 <="1000";
		wait for 100 ns;
		num1 <="1101";
		num2 <="1001";
		wait for 100 ns;
		num1 <="1010";
		num2 <="1100";
		wait for 100 ns;
		num1 <="1001";
		num2 <="1010";
		wait for 100 ns;      
		wait;
   end process;

END;
