library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Datapath is
port(x,y: in std_logic_vector(3 downto 0);Xsel,Ysel,Xld,Yld,O_enb,clk: in std_logic;X_gt_Y,X_lt_Y,X_eq_Y: out std_logic;data: out std_logic_vector(3 downto 0));
end Datapath;

architecture Behavioral of Datapath is
signal mx,my,rx,ry,sx,sy,MCD: std_logic_vector(3 downto 0);
component MUX is
port(x,y: in std_logic_vector(3 downto 0); sel: in std_logic; res: out std_logic_vector(3 downto 0));
end component;

component Registro is
port(din: in std_logic_vector(3 downto 0);clk,load,reset: in std_logic;dout: buffer std_logic_vector(3 downto 0));
end component;

component comparator is
port(x,y: in std_logic_vector(3 downto 0);grt,eq,lt: out std_logic;MCD: out std_logic_vector(3 downto 0));
end component;

component substractor4bit is
port(x,y: in std_logic_vector(3 downto 0);bin: in std_logic;ans: out std_logic_vector(3 downto 0);bout: out std_logic);
end component;

component  OutputRegister is
port(MCD: in std_logic_vector(3 downto 0);eq,clk,reset: in std_logic;Data_0: out std_logic_vector(3 downto 0));
end component;

begin
mux1:Mux port map(x,sx,Xsel,mx);
mux2:Mux port map(y,sy,Ysel,my);
R1:Registro port map(din=>mx,clk=>clk,load=>Xld,dout=>rx,reset=>'0');
R2:Registro port map(din=>my,clk=>clk,load=>Yld,dout=>ry,reset=>'0');
C:comparator port map(rx,ry,X_gt_Y,X_eq_Y,X_lt_Y,MCD);
S1:substractor4bit port map(x=>rx,y=>ry,ans=>sx,bin=>'0');
S2:substractor4bit port map(x=>ry,y=>rx,ans=>sy,bin=>'0');
OuR: OutputRegister port map(MCD=>MCD,eq=>O_enb,clk=>clk,Data_0=>data,reset=>'0');

end Behavioral;