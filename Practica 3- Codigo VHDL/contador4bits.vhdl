library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Contador_4bit is
port(clk: in bit;d0,d1,d2,d3: buffer bit);
end Contador_4bit;

architecture Behavioral of Contador_4bit is
signal a,b: bit;
component jk_flipflop
port(j,k,clk: in bit;q,qn:buffer bit);
end component;
begin
a<= d0 and d1;
b<= a and d2;
jk1: jk_flipflop port map('1','1',clk,d0);
jk2: jk_flipflop port map(d0,d0,clk,d1);
jk3: jk_flipflop port map(a,a,clk,d2);
jk4: jk_flipflop port map(b,b,clk,d3);
end Behavioral;

