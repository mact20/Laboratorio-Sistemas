
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplicador is
port(a0,a1,a2,a3,b0,b1,b2,b3: in bit;z0,z1,z2,z3,z4,z5,z6,z7: out bit);
end Multiplicador;

architecture Behavioral of Multiplicador is
component FullAdder
Port ( a : in  bit;
           b : in  bit;
           cin : in  bit;
           sum : out  bit;
           cout : out  bit);
end component;
component HalfAdder
Port ( a : in  bit;
           b : in  bit;
           sum : out  bit;
           cout : out  bit);
end component;
signal ap1,bp1,cp1,dp1,ep1,fp1,gp1,ap2,bp2,cp2,dp2,ap3,bp3,cp3,dp3,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,s1,s2,s3,s4,s5,s6: bit;
begin
ap1<=a0 and b1; bp1<=a1 and b0; cp1<=a1 and b1; dp1<=a2 and b0; ep1<=a2 and b1; fp1<=a3 nand b0; gp1<=a3 nand b1; 
ap2<=a0 and b2; bp2<=a1 and b2; cp2<=a2 and b2; dp2<=a3 and b2;
ap3<= a0 nand b3; bp3<=a1 nand b3; cp3<=a2 nand b3; dp3<=a3 and b3;
z0<=a0 and b0;
h1: halfadder port map (ap1,bp1,z1,c1);
f1: fulladder port map (cp1,dp1,c1,s1,c2);
f2: fulladder port map (ep1,fp1,c2,s2,c3);
f3: fulladder port map (gp1,'1',c3,s3,c4);
h2: halfadder port map (ap2,s1,z2,c5);
f4: fulladder port map (bp2,s2,c5,s4,c6);
f5: fulladder port map (cp2,s3,c6,s5,c7);
f6: fulladder port map (dp2,c4,c7,s6,c8);
h3: halfadder port map (ap3,s4,z3,c9);
f7: fulladder port map (bp3,s5,c9,z4,c10);
f8: fulladder port map (cp3,s6,c10,z5,c11);
f9: fulladder port map (dp3,c8,c11,z6,c12);
h4: halfadder port map ('1',c12,z7,c13);
end Behavioral;
