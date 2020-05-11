library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro8bits is
port(din: in bit_vector(7 downto 0);clk,load,reset: in bit;dout: out bit_vector(7 downto 0));
end Registro8bits;

architecture Behavioral of Registro8bits is
begin
 process (clk) 
 begin
 if (reset = '1') then
 dout <= "00000000";
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