library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reloj is
port(clk: in bit;MinN,MinD,Hora: buffer bit_vector(3 downto 0));
end reloj;

architecture Behavioral of reloj is
component jkff
port(j,k,clk: in bit;q,qn:buffer bit);
end component;
signal n1,n2,n3,n4,n5,ds,d1,d2,hs,h1,h2,h3: bit;
begin
n1<= MinN(0) and ( not MinN(3)); n2<= MinN(0) and MinN(1); n3<= MinN(0) and MinN(3); n4<= n2 and MinN(2); n5<= n3 or n4;
Nn0: jkff port map('1','1',clk,MinN(0));
Nn1: jkff port map(n1,n1,clk,MinN(1));
Nn2: jkff port map(n2,n2,clk,MinN(2));
Nn3: jkff port map(n5,n5,clk,MinN(3));
ds<='1' when (MinN="1001" and clk='1' and clk'event) else '0';
d1<= MinD(0) and (not MinD(2)); d2<= MinD(1) and MinD(0);
Dd0: jkff port map('1','1',ds,MinD(0));
Dd1: jkff port map(d1,MinD(0),ds,MinD(1));
Dd2: jkff port map(d2,MinD(0),ds,MinD(2));
Dd3: jkff port map(MinD(3),'1',ds,MinD(3));
hs<='1' when (MinD="0101" and ds='1' and ds'event) else '0';
h1<= Hora(0) and Hora(1);h2<=n1 or Hora(3);h3<=Hora(0) and Hora(1) and Hora(2); 
Hh0: jkff port map('1','1',hs,Hora(0));
Hh1: jkff port map(Hora(0),Hora(0),hs,Hora(1));
Hh2: jkff port map(h1,h2,hs,Hora(2));
Hh3: jkff port map(h3,Hora(2),hs,Hora(3));
end Behavioral;

