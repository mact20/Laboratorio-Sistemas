library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;


entity keyboard_tb is
    constant period : time := 40 ns ; -- Señal de reloj de 25MHz
    constant bit_period : time := 60 us ; -- Keyboard clock ~ 16.7 Khz max
end entity;

architecture arch of keyboard_tb is
    component keyboard is 
        port(
            kbd_clk, kbd_data, clk : in std_logic;
            reset, enable : in std_logic;
            scan_code : buffer std_logic_vector(7 downto 0);
            scan_ready : out std_logic;
            parity: out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic;
    signal kbd_clk : std_logic := '1';
    signal kbd_data : std_logic := 'H';
    signal enable : std_logic := '0';
    signal scan_ready : std_logic;
    signal scan_code : std_logic_vector(7 downto 0);

	 signal parity,parity_key: std_logic;
	 signal parity_error: std_logic;

    type codes_types is array (natural range <>) of std_logic_vector (7 downto 0);
    constant codes : codes_types := (x"3A", x"1C",x"2D",x"21",x"44");

    begin 

    UUT : keyboard port map (kbd_clk, kbd_data, clk, reset, enable, scan_code, scan_ready,parity);

    -- Señal de reloj del sistema
    clk <= not clk after (period / 2);
    reset <= '1', '0' after period;

    process
        procedure send_code( sc : std_logic_vector(7 downto 0) ) is
        begin
            kbd_clk <= 'H';
            kbd_data <= 'H';

            wait for (bit_period/2);
            kbd_data <= '0'; -- Start bit
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            for i in 0 to 7 loop
                kbd_data <= sc(i);
                wait for (bit_period/2);
                kbd_clk <= '0';
                wait for (bit_period/2);
                kbd_clk <= '1';
            end loop;
            -- bit de paridad
            kbd_data <= parity;
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            -- stop bit
            kbd_data <= '1';
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            kbd_data <= 'H';
            --paridad en la letra tecleada
            parity_key<=sc(7) xor(sc(6) xor(sc(5) xor (sc(4) xor(sc(3) xor(sc(2) xor (sc(1) xor(sc(0) xor '1')))))));
            wait for 1 ns;
            --checamos si hay una diferencia en la paridad
            parity_error<=parity xor parity_key;
            wait for (bit_period * 3);
        end procedure send_code;
    
       begin
        wait for bit_period;
        for i in codes'range loop
            send_code(codes(i));
        end loop;
    end process;

    process 
    begin
        wait until scan_ready = '1';
        wait for 300* period;
        enable <= '0';
    end process;
	 	 
end arch;
