library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity statemachine is
port(clk,RESET,RS,RW: in bit;Data_Instruction: in bit_vector(7 downto 0);En,Dld,Rsld,Rwld,Dsel,RSsel,RWsel: out bit);
end statemachine;

architecture Behavioral of statemachine is
type state is (IDLE,CHECK,ACTIVATE,LOAD,RESE);
signal actual : state := IDLE;
signal future : state;
signal DE: bit;
begin
process (Data_Instruction) begin
DE<='1';
DE<='0' after 8 ns;
end process;

process(clk) begin
if (clk='1' and clk'event) then
if actual=IDLE then
if RESET='1' then
Dsel<='1';
RSsel<='1';
RWsel<='1';
Dld<='1';
Rsld<='1';
Rwld<='1';
future<=RESE;
elsif DE='1' then
En<='1';
Dsel<='0';
RSsel<='0';
RWsel<='0';
future<=CHECK;
else 
null;
end if;

elsif actual= CHECK then
if RESET='1' then
Dsel<='1';
RSsel<='1';
RWsel<='1';
Dld<='1';
Rsld<='1';
Rwld<='1';
future<=RESE;
else
if Rw<='0' then
Dld<='1';
Rsld<='1';
Rwld<='1';
future<=ACTIVATE;
else
Rsld<='1';
Rwld<='1';
future<=ACTIVATE;
end if;
end if;

elsif actual= ACTIVATE then
if RESET='1' then
Dsel<='1';
RSsel<='1';
RWsel<='1';
Dld<='1';
Rsld<='1';
Rwld<='1';
future<=RESE;
else
Dld<='0';
Rsld<='0';
Rwld<='0';
future<=LOAD;
end if;

elsif actual=  LOAD then
if RESET='1' then
Dsel<='1';
RSsel<='1';
RWsel<='1';
Dld<='1';
Rsld<='1';
Rwld<='1';
future<=RESE;
else
EN<='0';
future<=IDLE;
end if;


elsif actual= RESE then
EN<='0';
Dld<='0';
Rsld<='0';
Rwld<='0';
future<=IDLE;

else
null;

end if;
end if;
end process;

process(future) begin
actual<=future;
end process;


end Behavioral;