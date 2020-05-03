ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 

    COMPONENT reloj
    PORT(
         clk : IN  bit;
         MinN : buffer  bit_vector(3 downto 0);
         MinD : buffer  bit_vector(3 downto 0);
         Hora : buffer  bit_vector(3 downto 0));
    END COMPONENT;
signal clk: bit;
signal MinN,MinD,Hora: bit_vector(3 downto 0);
BEGIN
Prueba: reloj port map(clk,MinN,MinD,Hora);
clk<=not clk after 1 ns;
END;
