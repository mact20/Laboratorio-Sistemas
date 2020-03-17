library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encod is
port(clk,u0,u1,u2,u3,u4,d0,d1,d2,d3,d4,m0,m1,m2,m3,m4,dm0,dm1,dm2,dm3,dm4: in bit;a,b,c,d,e,f,g,h: out bit);
end encod;

architecture Behavioral of encod is
component mux
Port ( s0 : in  bit; s1 : in  bit; i0 : in  bit; i1 : in  bit; i2 : in  bit; i3 : in  bit; f : out  bit);
end component;
component encoder
port(i0,i1,i2,i3: in bit; d1,d0: out bit);
end component;
component controlador
port(clk: in bit;i3,i2,i1,i0: buffer bit);
end component;
signal n4,n3,n2,n1,n0,k0,k1,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,i0,i1,i2,i3: bit;
begin
co: controlador port map(clk,i3,i2,i1,i0);
en: encoder port map(i0,i1,i2,i3,k1,k0);
mu1: mux port map(k0,k1,u0,d0,m0,dm0,n0);
mu2: mux port map(k0,k1,u1,d1,m1,dm1,n1);
mu3: mux port map(k0,k1,u2,d2,m2,dm2,n2);
mu4: mux port map(k0,k1,u3,d3,m3,dm3,n3);
mu5: mux port map(k0,k1,u4,d4,m4,dm4,n4);
a1<= n2 and (not n1) and (not n0);
a2<= (not n3) and (not n2) and (not n1) and n0;
a3<= n2 and (not n1) and n0;
a4<= n2 and n1 and (not n0);
a5<= n2 and (not n1) and (not n0);
a6<= (not n3) and (not n2) and (not n1) and n0;
a7<= n2 and n1 and n0;
a8<= n2 and (not n1);
a9<= n1 and n0;
a10<= (not n2) and n1;
a11<= (not n3) and (not n2)and n0;
a12<= (not n3) and (not n2) and (not n1);
a13<= n2 and n1 and n0;
a<= a1 or a2;
b<= a3 or a4;
c<= (not n2) and  n1 and (not n0);
d<= a5 or a6 or a7;
e<= a8 or n0;
f<= a9 or a10 or a11;
g<= a12 or a13;
h<=n4;
end Behavioral;
