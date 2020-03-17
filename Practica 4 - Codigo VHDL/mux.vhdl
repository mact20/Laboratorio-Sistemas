library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux is
Port ( s0 : in  bit; s1 : in  bit; i0 : in  bit; i1 : in  bit; i2 : in  bit; i3 : in  bit; f : out  bit);
end mux;

architecture Behavioral of mux is
signal sel: bit_vector(1 downto 0);
begin
sel<=s1&s0;
with sel select
F <= I0 when "00",
I1 when "01",
I2 when "10",
I3 when "11";
end Behavioral;
