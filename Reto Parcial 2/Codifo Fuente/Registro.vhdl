library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro is
port(din,clk,load,reset:in bit;dout: out bit);
end Registro;

architecture Behavioral of Registro is
begin
 process (clk) 
 begin
 if (reset = '1') then
 dout <= '0';
 else
 if(clk='1' and clk'event) then
 if (load = '1') then
 dout <= din;
 else 
 null;
 end if;
 end if;
 end if;
 end process;
end Behavioral;
