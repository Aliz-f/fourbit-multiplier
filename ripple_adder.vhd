library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
		Port ( 
			A3,A2,A1,A0 : in STD_LOGIC;
			B3,B2,B1,B0 : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S3,S2,S1,S0 : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
end ripple_adder;

architecture ripple_adder_arch of ripple_adder is

component full_adder
	Port ( 
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		Cin : in STD_LOGIC;
		S : out STD_LOGIC;
		Cout : out STD_LOGIC);
end component;

for all : full_adder use entity work.full_adder(full_adder_arch);
signal c1,c2,c3: STD_LOGIC;

begin
FA1: full_adder port map( A0, B0, Cin, S0, c1);
FA2: full_adder port map( A1, B1, c1, S1, c2);
FA3: full_adder port map( A2, B2, c2, S2, c3);
FA4: full_adder port map( A3, B3, c3, S3, Cout);

end ripple_adder_arch;

