library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
port(s0,i0,i1: in bit; q: out bit);
end mux;

architecture Behavioral of mux is
begin
q<=(i0 and not s0) or (i1 and s0);
end Behavioral;