library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OutputRegister is
port(MCD: in std_logic_vector(3 downto 0);eq,clk,reset: in std_logic;Data_0: out std_logic_vector(3 downto 0));
end OutputRegister;

architecture Behavioral of OutputRegister is
begin
process(clk) begin
if reset='1' then 
Data_0<="0000";
elsif rising_edge(clk) and eq<='1' then
Data_0<=O_enb;
else null;
end if;
end process;
end Behavioral;