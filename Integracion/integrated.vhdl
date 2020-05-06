library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Integrated is
port(x,y: in std_logic_vector(3 downto 0);clk: in std_logic;MCD: out std_logic_vector(3 downto 0));
end Integrated;

architecture Behavioral of Integrated is
signal Xld,Yld,Ysel,Xsel,O_enb,X_gt_Y,X_lt_Y,X_eq_Y: std_logic;
component Controller is
port(clk,X_gt_Y,X_lt_Y,X_eq_Y: in std_logic;Xld,Yld,Ysel,Xsel,O_enb: out std_logic);
end component;

component Datapath is
port(x,y: in std_logic_vector(3 downto 0);Xsel,Ysel,Xld,Yld,O_enb,clk: in std_logic;X_gt_Y,X_lt_Y,X_eq_Y: out std_logic;data: out std_logic_vector(3 downto 0));
end component;
begin
con:Controller port map(clk,X_gt_Y,X_lt_Y,X_eq_Y,Xld,Yld,Ysel,Xsel,O_enb);
dat:Datapath port map(x,y,Xsel,Ysel,Xld,Yld,O_enb,clk,X_gt_Y,X_lt_Y,X_eq_Y,MCD);
end Behavioral;