library IEEE;
use IEEE.numeric_bit.all;
 
ENTITY test2 IS
END test2;
 
ARCHITECTURE behavior OF test2 IS 
component contador0_99 is
port(clk,ud: in bit;Q0,Q1: buffer unsigned(3 downto 0));
end component;
signal clk,ud: bit;
signal Q0,Q1: unsigned(3 downto 0);
BEGIN
n: contador0_99 port map(clk,ud,Q0,Q1);
process begin
ud<='1';
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
end process;
END;