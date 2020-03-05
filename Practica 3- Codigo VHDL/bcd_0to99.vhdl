library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd_0to99 is
port(clk,ud: in bit;u0,u1,u2,u3,d0,d1,d2,d3: buffer bit);
end bcd_0to99;

architecture Behavioral of bcd_0to99 is
signal u0n,u1n,u2n,u3n,d0n,d1n,d2n,d3n,a1,b1,c1,a2,b2,c2,a3,b3,c3,e3,a4,b4,c4,a5,b5,c5,a6,b6,c6,e6,j2,k2,j3,k3,j4,k4,j6,k6,j7,k7,j8,k8,clk2: bit;
component jk_flipflop
port(j,k,clk: in bit;q,qn:buffer bit);
end component;
component mux
port(s0,i0,i1: in bit; q: out bit);
end component;
begin
a1<=u0n and u2; b1<=a1 or a2; c1<=u0 and u3n;
a2<=u3 and u0n; b2<=u0n and u1n; c2<=u0 and u1;
a3<=u2n and b2; b3<=u0 and u3; c3<=c2 and u2; e3<= b3 or c3;
a4<=d0n and d2; b4<=a4 or a5; c4<=d0 and d3n;
a5<=d3 and d0n; b5<=d0n and d1n; c5<=d0 and d1;
a6<=d2n and b5; b6<=d0 and d3; c6<=c5 and d2; e6<= b6 or c6;
clk2<= u3 and u0 and not u1 and not u2 and not clk;
jk1: jk_flipflop port map('1','1',clk,u0,u0n);
m1: mux port map(ud,c1,b1,j2);
m2: mux port map(ud,c1,u0n,k2);
jk2: jk_flipflop port map(j2,k2,clk,u1,u1n);
m3: mux port map(ud,c2,a2,j3);
m4: mux port map(ud,c2,b2,k3);
jk3: jk_flipflop port map(j3,k3,clk,u2,u2n);
m5: mux port map(ud,e3,a3,j4);
m6: mux port map(ud,e3,u0n,k4);
jk4: jk_flipflop port map(j4,k4,clk,u3,u3n);

jk5: jk_flipflop port map('1','1',clk2,d0,d0n);
m7: mux port map(ud,c4,b4,j6);
m8: mux port map(ud,c4,d0n,k6);
jk6: jk_flipflop port map(j6,k6,clk2,d1,d1n);
m9: mux port map(ud,c5,a5,j7);
m10: mux port map(ud,c5,b5,k7);
jk7: jk_flipflop port map(j7,k7,clk2,d2,d2n);
m11: mux port map(ud,e6,a6,j8);
m12: mux port map(ud,e6,d0n,k8);
jk8: jk_flipflop port map(j8,k8,clk2,d3,d3n);
end Behavioral;