library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_flipflop is
port(j,k,clk: in bit; q,qn: buffer bit);
end jk_flipflop;

architecture Behavioral of jk_flipflop is
signal n: bit;
begin
q<=n;
qn<= not n;
process(clk) begin
if clk'event and clk ='1' then
n<=(j and not n)or(not k and n);
end if;
end process;
end Behavioral;

