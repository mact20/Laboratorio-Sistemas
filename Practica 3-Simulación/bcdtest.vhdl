LIBRARY ieee;

ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
COMPONENT bcd_0to99
port(clk,ud: in bit;u0,u1,u2,u3,d0,d1,d2,d3: buffer bit);
END COMPONENT;
signal clk,ud,u0,u1,u2,u3,d0,d1,d2,d3: bit;
BEGIN
b1: bcd_0to99 port map(clk,ud,u0,u1,u2,u3,d0,d1,d2,d3);
process begin
wait for 1 ns;
clk<='1';
wait for 1 ns;
clk<='0';
end process;
process begin
wait for 12 ns;
ud<='1';
wait; 
end process; 
END;