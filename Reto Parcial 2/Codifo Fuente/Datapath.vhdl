library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
port(clk,RS,RW,RESET,Dld,Rsld,Rwld,Dsel,RSsel,RWsel: in bit;Data_Instruction: in bit_vector(7 downto 0);
DATA: out bit_vector(7 downto 0);SigRs,SigRw: out bit);
end Datapath;

architecture Behavioral of Datapath is
signal mD: bit_vector(7 downto 0);
signal mRs,mRw: bit;
component Registro is
port(din,clk,load,reset:in bit;dout: out bit);
end component;

component Registro8bits is
port(din: in bit_vector(7 downto 0);clk,load,reset: in bit;dout: out bit_vector(7 downto 0));
end component;

component MUX is
port(x,y: in bit; sel: in bit; res: out bit);
end component;

component MUX8bit is
port(x,y: in bit_vector(7 downto 0); sel: in bit; res: out bit_vector(7 downto 0));
end component;
begin
MuD: mux8bit port map(Data_Instruction,"00000001",Dsel,mD);
MuRS: mux port map(RS,'0',RSsel,mRs);
MuRW: mux port map(RW,'0',RWsel,mRw);
RD: Registro8bits port map(mD,clk,Dld,'0',DATA);
RRS:Registro port map(mRS,clk,Rsld,'0',SigRs);
RRW:Registro port map(mRW,clk,Rwld,'0',SigRW);
end Behavioral;

