library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard is 
    port(
        kbd_clk, kbd_data, clk : in std_logic;
        reset, enable : in std_logic;
        scan_code : buffer std_logic_vector(7 downto 0);
        scan_ready,parity : out std_logic
    );
end entity;

architecture Behavioral of keyboard is
signal filter : std_logic_vector(7 downto 0);
signal kbd_clk_filtered : std_logic := '0';
signal read_char : std_logic := '0';
signal ready_set : std_logic := '0';
signal incount : unsigned(3 downto 0) := "0000";
signal shiftin : std_logic_vector(8 downto 0);
type state is (S0,S1);
signal actual : state := S0;
signal future : state;

begin
clk_filter : process
    begin
        wait until clk'event and clk = '1';
        filter(6 downto 0) <= filter(7 downto 1);
        filter(7) <= kbd_clk;
        if filter = x"FF" then 
            kbd_clk_filtered <= '1';
        elsif filter = x"00" then
            kbd_clk_filtered <= '0';
        end if;
    end process;

--Checamos la paridad de la cantidad escaneada
parity<=scan_code(7) xor(scan_code(6) xor(scan_code(5) xor (scan_code(4) xor(scan_code(3) xor(scan_code(2) xor (scan_code(1) xor(scan_code(0) xor '1')))))));

process(incount) begin
if incount ="1000" then
scan_code <= shiftin(8 downto 1);
end if;
end process;

-- Lectura de la información serial del dispositivo

process(kbd_clk_filtered) begin
if falling_edge(kbd_clk_filtered) then
-- estado idle
 if actual=S0 then
  if reset='1' then
   incount <= "0000";
   read_char <= '0';
	future<=S0;
  elsif kbd_data = '0' and read_char = '0' then
   read_char <= '1';
   ready_set <= '0';
	future<=S1;
  end if;
 end if;
 
--estado de conteo y recopilacion de bits de la tecla
 if actual=S1 then
  if enable<='1' then
   scan_ready<='0';
  end if;
  if read_char = '1' then
   if incount < "1001" then
	 incount <= incount + 1;
         shiftin(7 downto 0) <= shiftin(8 downto 1);
         shiftin(8) <= kbd_data;
         ready_set <= '0';
	 future<=S1;
	else
        read_char <= '0';
        ready_set <= '1';
        incount <= "0000";
	 future<=S0;
	 scan_ready <= '1';
	end if;
  end if;
 end if;
end if;
end process;

process(future) begin
actual<=future;
end process;

end Behavioral;