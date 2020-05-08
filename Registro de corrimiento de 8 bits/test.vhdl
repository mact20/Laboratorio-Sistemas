LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY test2 IS
END test2;
 
ARCHITECTURE behavior OF test2 IS 
COMPONENT circuito8bits is
port(clk,s0,s1,Dsr,Dsl,clear: in bit;P: in bit_vector(7 downto 0);Q:buffer bit_vector(7 downto 0));
end  COMPONENT;
signal P,Q: bit_vector(7 downto 0);
signal clk,s0,s1,Dsr,Dsl,clear: bit;
BEGIN
m: circuito8bits port map(clk,s0,s1,Dsr,Dsl,clear,P,Q);

process begin
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
end process;

process begin
P<="01101011";
clear<='0';
wait for 2 ns;
clear<='1';
s0<='1';
s1<='1';
wait for 2 ns;
Dsr<='1';
s1<='0';
s0<='1';
wait for 4 ns;
Dsr<='0';
s1<='0';
s0<='1';
wait for 2 ns;
Dsl<='1';
s1<='1';
s0<='0';
wait for 6 ns;
Dsl<='0';
s1<='1';
s0<='0';
wait for 4 ns;
s1<='0';
s0<='0';
wait;
end process;
END;