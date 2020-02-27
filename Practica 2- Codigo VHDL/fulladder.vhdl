library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( a : in  bit;
           b : in  bit;
           cin : in  bit;
           sum : out  bit;
           cout : out  bit);
end FullAdder;

architecture Behavioral of FullAdder is
component mux
Port ( s0 : in  bit;
           s1 : in  bit;
           i0 : in  bit;
           i1 : in  bit;
           i2 : in  bit;
           i3 : in  bit;
			  f  : out bit);
end component;
signal nc: bit;
begin
nc<=not cin;
M1: mux port map (b,a,'0',cin,cin,'1',cout);
M2: mux port map (b,a,cin,nc,nc,cin,sum);
end Behavioral;