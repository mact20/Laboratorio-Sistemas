library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity circuito8bits is
port(clk,s0,s1,Dsr,Dsl,clear: in bit;P: in bit_vector(7 downto 0);Q:buffer bit_vector(7 downto 0));
end circuito8bits;

architecture Behavioral of circuito8bits is
COMPONENT circuit is
port(clk,s0,s1,Dsr,Dsl,clear: in bit;P: in bit_vector(3 downto 0);Q:buffer bit_vector(3 downto 0));
end  COMPONENT;
signal as0,as1,bs0,bs1,aDsr,aDsl,bDsr,bDsl: bit;
begin
rd1:circuit port map(clk,s0,s1,Dsr,Q(3),clear,P(7 downto 4),Q(7 downto 4));
rd2:circuit port map(clk,s0,s1,Q(4),Dsl,clear,P(3 downto 0),Q(3 downto 0));


end Behavioral;
