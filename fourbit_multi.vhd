library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbit_multi is
	port(
			num1, num2 : in std_logic_vector(3 downto 0);
			output : out std_logic_vector(7 downto 0)

	);
end fourbit_multi;

architecture fourbit_multi_arch of fourbit_multi is

component ripple_adder
		Port ( 
			A3,A2,A1,A0 : in STD_LOGIC;
			B3,B2,B1,B0 : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S3,S2,S1,S0 : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
end component;

for all : ripple_adder use entity work.ripple_adder(ripple_adder_arch);

signal ab0, ab1, ab2, ab3 : std_logic_vector(3 downto 0);
signal sim1 : std_logic_vector (3 downto 0);
signal sim2 : std_logic_vector (3 downto 0);


begin
ab0(3) <= num1(3)and num2(0);
ab0(2) <= num1(2)and num2(0);
ab0(1) <= num1(1)and num2(0);
ab0(0) <= num1(0)and num2(0);

ab1(3) <= num1(3)and num2(1);
ab1(2) <= num1(2)and num2(1);
ab1(1) <= num1(1)and num2(1);
ab1(0) <= num1(0)and num2(1);

ab2(3) <= num1(3)and num2(2);
ab2(2) <= num1(2)and num2(2);
ab2(1) <= num1(1)and num2(2);
ab2(0) <= num1(0)and num2(2);

ab3(3) <= num1(3)and num2(3);
ab3(2) <= num1(2)and num2(3);
ab3(1) <= num1(1)and num2(3);
ab3(0) <= num1(0)and num2(3);

output(0) <= num1(0)and num2(0);
rp1: ripple_adder port map(ab1(3), ab1(2), ab1(1), ab1(0), '0', ab0(3), ab0(2), ab0(1), '0', sim1(3), sim1(2), sim1(1), output(1), sim1(0) );
rp2: ripple_adder port map(ab2(3), ab2(2), ab2(1), ab2(0), sim1(0), sim1(3), sim1(2), sim1(1), '0', sim2(3), sim2(2), sim2(1), output(2), sim2(0) );
rp3: ripple_adder port map(ab3(3), ab3(2), ab3(1), ab3(0), sim2(0), sim2(3), sim2(2), sim2(1), '0', output(6), output(5), output(4),output(3), output(7));

end fourbit_multi_arch;

