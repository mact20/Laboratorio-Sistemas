library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlador is
port(clk: in bit;i3,i2,i1,i0: buffer bit);
end controlador;

architecture Behavioral of controlador is
component jk_flipflop
port(j,k,clk: in bit;q,qn:buffer bit);
end component;
signal i0n,i1n,i2n,i3n: bit;
begin
jk3: jk_flipflop port map(i2,i0n,clk,i3,i3n);
jk2: jk_flipflop port map('1',i3n,clk,i2,i2n);
jk1: jk_flipflop port map('1',i2n,clk,i1,i1n);
jk0: jk_flipflop port map('1',i1n,clk,i0,i0n);
end Behavioral;
