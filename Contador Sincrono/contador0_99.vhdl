library IEEE;
use IEEE.numeric_bit.all;

entity contador0_99 is
port(clk,ud: in bit;Q0,Q1: buffer unsigned(3 downto 0));
end contador0_99;

architecture Behavioral of contador0_99 is
component circuit is
port(clk,ud,cep,cet,pe: in bit;D: in unsigned(3 downto 0);Q: buffer unsigned(3 downto 0);tc: out bit);
end component;
signal pe1,pe2,tc1,tc2: bit;
signal D: unsigned(3 downto 0);
begin
c1:circuit port map(clk,ud,'0','0',pe1,D,Q0,tc1);
c2:circuit port map(clk,ud,pe1,pe1,pe2,D,Q1,tc2);

process(clk) begin
if rising_edge(clk) then
if ud='1' then
if Q0="1000" then
pe1<='0';
else pe1<='1'; end if;
elsif ud='0' then
if Q0="0001" then
pe1<='0';
else pe1<='1'; end if;
end if;
end if;
end process;

process(clk) begin
if rising_edge(clk) then
if ud='1' then
if (Q1="1001" and Q0="1000")then
pe2<='0';
else pe2<='1'; end if;
elsif ud='0' then
if (Q1="0000" and Q0="0001") then
pe2<='0';
else pe2<='1'; end if;
end if;
end if;
end process;

with ud select
D<="1001"when'0', 
   "0000"when'1';


end Behavioral;
