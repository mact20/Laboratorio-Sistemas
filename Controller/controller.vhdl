library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Controller is
port(clk,X_gt_Y,X_lt_Y,X_eq_Y: in std_logic;Xld,Yld,Ysel,Xsel,O_enb: out std_logic);
end Controller;

architecture Behavioral of Controller is
type state is (S0,S1,S2,S3,S4);
signal actual : state := S0;
signal future : state;

begin
process(clk) begin
if rising_edge(clk) then
if actual=S0 then
Ysel<='0';
Xsel<='0';
Xld<='1';
Yld<='1';
future<=S1;

elsif actual= S1 then
Xld<='0';
Yld<='0';
future<=S2;

elsif actual= S2 then
if X_gt_Y ='1' then
Xsel<='1';
Ysel<='0';
Xld<='1' after 200 ps;
Yld<='0' after 200 ps;
future<=S4;
elsif X_lt_Y ='1' then 
Xsel<='0';
Ysel<='1';
Xld<='0' after 200 ps;
Yld<='1' after 200 ps;
future<=S4;
elsif X_eq_Y='1' then
O_enb<='1';
future<=S3;
else NULL;
end if;

elsif actual=  S3 then
O_enb<='1';
future<=S3;

elsif actual=  S4 then
Xld<='0';
Yld<='0';
future<=S2;

else
null;

end if;
end if;
end process;

process(future) begin
actual<=future;
end process;
end Behavioral;