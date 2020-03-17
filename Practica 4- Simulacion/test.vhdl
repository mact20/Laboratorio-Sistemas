LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
COMPONENT encod
port(clk,u0,u1,u2,u3,u4,d0,d1,d2,d3,d4,m0,m1,m2,m3,m4,dm0,dm1,dm2,dm3,dm4: in bit;a,b,c,d,e,f,g,h: out bit);
END COMPONENT;
signal clk,u0,u1,u2,u3,u4,d0,d1,d2,d3,d4,m0,m1,m2,m3,m4,dm0,dm1,dm2,dm3,dm4,a,b,c,d,e,f,g,h: bit;
BEGIN
en: encod port map(clk,u0,u1,u2,u3,u4,d0,d1,d2,d3,d4,m0,m1,m2,m3,m4,dm0,dm1,dm2,dm3,dm4,a,b,c,d,e,f,g,h);
clk<=not clk after 1 ns;
u0<='1';
u1<='0';
u2<='0';
u3<='0';
u4<='0';
d0<='0';
d1<='1';
d2<='0';
d3<='0';
d4<='0';
m0<='1';
m1<='1';
m2<='0';
m3<='0';
m4<='0';
dm0<='0';
dm1<='0';
dm2<='1';
dm3<='0';
dm4<='0';
END;