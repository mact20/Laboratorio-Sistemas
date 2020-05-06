library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OutputRegister is
port(MCD: in std_logic_vector(3 downto 0);eq,clk,reset: in std_logic;Data_0: out std_logic_vector(3 downto 0));
end OutputRegister;

architecture Behavioral of OutputRegister is
begin
process (clk) 
begin
if (reset = '1') then
Data_0 <= "0000";
else
if(rising_edge(clk)) then
if (eq = '1') then
Data_0 <= MCD;
else 
null;
end if;
end if;
end if;
end process;
end Behavioral;
