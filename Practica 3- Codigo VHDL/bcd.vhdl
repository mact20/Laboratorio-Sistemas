library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd is
port(clk: in bit;d0,d1,d2,d3: buffer bit);
end bcd;

architecture Behavioral of bcd is
signal a,b,c,d,e,d3n: bit;
component jk_flipflop
port(j,k,clk: in bit;q,qn:buffer bit);
end component;
begin
a<= d0 and d3n;
b<= d0 and d1;
c<= d0 and d3;
d<= b and d2;
e<= c or d;
jk1: jk_flipflop port map('1','1',clk,d0);
jk2: jk_flipflop port map(a,a,clk,d1);
jk3: jk_flipflop port map(b,b,clk,d2);
jk4: jk_flipflop port map(e,e,clk,d3,d3n);
end Behavioral;

