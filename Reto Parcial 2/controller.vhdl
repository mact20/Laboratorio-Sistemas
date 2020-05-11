library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity controller is
port(clk,RESET,RS,RW: in bit;Data_Instruction: in bit_vector(7 downto 0);SigRs,SigRw,En: out bit;DATA: out bit_vector(7 downto 0));
end controller;

architecture Behavioral of controller is
component statemachine is
port(clk,RESET,RS,RW: in bit;Data_Instruction: in bit_vector(7 downto 0);En,Dld,Rsld,Rwld,Dsel,RSsel,RWsel: out bit);
end component;

component Datapath is
port(clk,RS,RW,RESET,Dld,Rsld,Rwld,Dsel,RSsel,RWsel: in bit;Data_Instruction: in bit_vector(7 downto 0);
DATA: out bit_vector(7 downto 0);SigRs,SigRw: out bit);
end component;
signal Dld,Rsld,Rwld,Dsel,RSsel,RWsel: bit;
begin
SM: statemachine port map(clk,RESET,RS,RW,Data_Instruction,En,Dld,Rsld,Rwld,Dsel,RSsel,RWsel);
DP: Datapath port map(clk,RS,RW,RESET,Dld,Rsld,Rwld,Dsel,RWsel,RWsel,Data_Instruction,DATA,SigRS,SigRw);
end Behavioral;

