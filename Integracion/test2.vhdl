LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test2 IS
END test2;
 
ARCHITECTURE behavior OF test2 IS 

    COMPONENT Integrated
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         MCD : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   signal x : std_logic_vector(3 downto 0) ;
   signal y : std_logic_vector(3 downto 0) ;
   signal clk: std_logic;
   signal MCD : std_logic_vector(3 downto 0);
BEGIN
M: integrated port map(x,y,clk,MCD);
process begin
x<="0110";
y<="1001";
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
end process;

END;