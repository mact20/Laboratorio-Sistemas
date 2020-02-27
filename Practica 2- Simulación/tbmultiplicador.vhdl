
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY multiplicador_tb IS
END multiplicador_tb;
 
ARCHITECTURE behavior OF multiplicador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplicador
    PORT(
         a0 : IN  bit;
         a1 : IN  bit;
         a2 : IN  bit;
         a3 : IN  bit;
         b0 : IN  bit;
         b1 : IN  bit;
         b2 : IN  bit;
         b3 : IN  bit;
         z0 : OUT bit;
         z1 : OUT bit;
         z2 : OUT bit;
         z3 : OUT bit;
         z4 : OUT bit;
         z5 : OUT bit;
         z6 : OUT bit;
         z7 : OUT bit
        );
    END COMPONENT;
signal a0,a1,a2,a3,b0,b1,b2,b3,z0,z1,z2,z3,z4,z5,z6,z7: bit;
BEGIN
m: multiplicador port map (a0,a1,a2,a3,b0,b1,b2,b3,z0,z1,z2,z3,z4,z5,z6,z7);
process begin
wait for 1 ns;
a0<='0';
a1<='1';
a2<='0';
a3<='0';
b0<='1';
b1<='1';
b2<='0';
b3<='0';
wait for 1 ns;
a0<='0';
a1<='1';
a2<='1';
a3<='0';
b0<='0';
b1<='1';
b2<='0';
b3<='0';
wait for 1 ns;
a0<='1';
a1<='0';
a2<='0';
a3<='0';
b0<='0';
b1<='0';
b2<='0';
b3<='0';
wait;
end process;
end behavior;