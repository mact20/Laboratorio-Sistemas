library IEEE;
use IEEE.numeric_bit.all;

entity circuit is
port(clk,ud,cep,cet,pe: in bit;D: in unsigned(3 downto 0);Q: buffer unsigned(3 downto 0);tc: out bit);
end circuit;

architecture Behavioral of circuit is
begin
process(clk) begin
if rising_edge(clk) then
if pe='0' then
 Q<=D;
elsif pe='1' then
 tc<='1';
 if (cep='0' and cet='0') then
  if ud='1' then
   if Q="1110" then
	tc<='0'; end  if;
   if Q="1111" then
    Q<="0000";
   else Q<=Q+1; end if;
  elsif ud='0' then
   if Q="0001" then
	tc<='0'; end if;
   if Q="0000" then
    Q<="1111";
   else Q<=Q-1; end if;
  end if;
 else null;
 end if;
else null;
end if;
end if;
end process;
end Behavioral;