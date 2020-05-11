library IEEE;
use IEEE.numeric_bit.all; 
use std.textio.all;
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
COMPONENT controller
port(clk,RESET,RS,RW: in bit;Data_Instruction: in bit_vector(7 downto 0);SigRs,SigRw,En: out bit;DATA: out bit_vector(7 downto 0));
end COMPONENT;
Signal clk,RESET,RS,RW,SigRs,SigRw,En: bit;
Signal Data_Instruction,DATA: bit_vector(7 downto 0);
file input: text open read_mode is "INPUTS.txt";
variable linea: line;
variable RSS,RWS: bit;
variable DS: bit_vector(7 downto 0);
BEGIN
t: controller port map(clk,RESET,RS,RW,Data_Instruction,SigRs,SigRw,En,DATA);
process begin
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
end process;

process begin
if( not endfile(input)) then
readline(input,linea);
read(linea,RSS);
read(linea,RWS);
read(linea,DS);
RS<=RSS;
RW<=RWS;
Data_Instruction<=DS;
end if;
wait for 8 ns;
end process;

END;