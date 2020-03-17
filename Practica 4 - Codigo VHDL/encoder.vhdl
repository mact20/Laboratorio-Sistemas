library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder is
port(i0,i1,i2,i3: in bit; d1,d0: out bit);
end encoder;

architecture Behavioral of encoder is
begin
d1<=i1 and i0;
d0<=i2 and i0;
end Behavioral;