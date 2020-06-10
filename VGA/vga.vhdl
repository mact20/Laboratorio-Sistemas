library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity vga is
generic (
      h_pulse   :  INTEGER ;
      h_bp      :  INTEGER ;
      h_display :  INTEGER ;
      h_fp      :  INTEGER ;
      v_pulse   :  INTEGER ;
      v_bp      :  INTEGER ;
      v_display :  INTEGER ;
      v_fp      :  INTEGER 
    );
 port (
        clk : in std_logic;
        red, green, blue : in std_logic;
        h_sync, v_sync : out std_logic;
        rgb : out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of vga is 

signal px, py : unsigned(9 downto 0);
signal video_on : std_logic;

component VGA_SYNC is
generic (
      h_pulse   :  INTEGER ;
      h_bp      :  INTEGER ;
      h_display :  INTEGER ;
      h_fp      :  INTEGER ;
      v_pulse   :  INTEGER ;
      v_bp      :  INTEGER ;
      v_display :  INTEGER ;
      v_fp      :  INTEGER 
    );
port( 
 clk : in std_logic;
 h_sync, v_sync : out std_logic;
 pixel_x,pixel_y: out unsigned(9 downto 0);
 video_on: out std_logic);
end component;

component Pixel_Generation is
port( data_red, data_green, data_blue : in std_logic;
pixel_x,pixel_y: in unsigned(9 downto 0);
video_on: in std_logic;
rgb : out std_logic_vector(2 downto 0)
);
end component;

begin
VGAS: VGA_SYNC generic map(h_pulse,h_bp,h_display,h_fp,v_pulse,v_bp,v_display,v_fp) port map(clk,h_sync,v_sync,px,py,video_on);
PG: Pixel_Generation port map(red,green,blue,px,py,video_on,rgb);

end arch;