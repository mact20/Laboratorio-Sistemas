library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Pixel_Generation is
port( data_red, data_green, data_blue : in std_logic;
pixel_x,pixel_y: in unsigned(9 downto 0);
video_on: in std_logic;
rgb : out std_logic_vector(2 downto 0)
);
end Pixel_Generation;

architecture Behavioral of Pixel_Generation is
begin
rgb(0) <= data_red and video_on;
rgb(1) <= data_green and video_on;
rgb(2) <= data_blue and video_on;
end Behavioral;
