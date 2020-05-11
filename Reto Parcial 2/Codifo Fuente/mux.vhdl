library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
port(x,y: in bit; sel: in bit; res: out bit);
end MUX;

architecture Behavioral of MUX is
begin
process(sel,x,y) begin
if sel='0' then
res<=x;
elsif sel='1' then
res<=y;
else
null;
end if;
end process;
end Behavioral;
