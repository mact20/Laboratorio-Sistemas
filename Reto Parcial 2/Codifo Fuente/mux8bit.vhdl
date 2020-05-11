library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX8bit is
port(x,y: in bit_vector(7 downto 0); sel: in bit; res: out bit_vector(7 downto 0));
end MUX8bit;

architecture Behavioral of MUX8bit is
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
