library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jkff is
port(j,k,clk: in bit; q,qn: buffer bit);
end jkff;

architecture Behavioral of jkff is
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

