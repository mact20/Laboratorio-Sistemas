library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
    Port ( a : in  bit;
           b : in  bit;
           sum : out  bit;
           cout : out  bit);
end HalfAdder;

architecture Behavioral of HalfAdder is
component mux
Port ( s0 : in  bit;
           s1 : in  bit;
           i0 : in  bit;
           i1 : in  bit;
           i2 : in  bit;
           i3 : in  bit;
			  f  : out bit);
end component;
begin
m1: mux port map (b,a,'0','0','0','1',cout);
m2: mux port map (b,a,'0','1','1','0',sum);
end Behavioral;