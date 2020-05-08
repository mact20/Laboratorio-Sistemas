LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity circuit is
port(clk,s0,s1,Dsr,Dsl,clear: in bit;P: in bit_vector(3 downto 0);Q:buffer bit_vector(3 downto 0));
end circuit;

architecture Behavioral of circuit is
signal sel: bit_vector(1 downto 0);
begin
sel<=s1&s0;

process(clk) begin
if clk='1' and clk'event then

if clear='0' then
Q<="0000";
else
case sel is

when "11"=>
Q<=P;

when "01"=>
if Dsr='1' then
Q(3)<='1';
Q(2)<=Q(3);
Q(1)<=Q(2);
Q(0)<=Q(1);
else
Q<=Q srl 1; end if;

when "10"=>
if Dsl='1' then
Q(3)<=Q(2);
Q(2)<=Q(1);
Q(1)<=Q(0);
Q(0)<='1';
elsif Dsl='0' then
Q<=Q sll 1;end if;

when "00"=>
null;

when others=>
null;
end case;
end if;
end if;
end process;


end Behavioral;
