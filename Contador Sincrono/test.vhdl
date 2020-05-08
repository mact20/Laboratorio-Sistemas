library IEEE;
use IEEE.numeric_bit.all;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
component circuit is
port(clk,ud,cep,cet,pe: in bit;D: in unsigned(3 downto 0);Q: buffer unsigned(3 downto 0);tc: out bit);
end component;
signal clk,ud,cep,cet,pe,tc: bit;
signal D,Q: unsigned(3 downto 0);
BEGIN
p: circuit port map(clk,ud,cep,cet,pe,D,Q,tc);
process begin
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
end process;

process begin
D<="1010";
wait for 2 ns;
pe<='1';
ud<='1';
cep<='1';
wait for 2 ns;
cep<='0';
cet<='1';
wait for 2 ns;
cet<='0';
wait for 16 ns;
ud<='0';
wait;
end process;
END;
