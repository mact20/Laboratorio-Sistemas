library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity VGA_SYNC is
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
end VGA_SYNC;

architecture Behavioral of VGA_SYNC is

    signal hs, vs : std_logic;
    signal video_on_h : std_logic := '0';
    signal video_on_v : std_logic := '0';
    signal h_count : unsigned(9 downto 0) := "0000000000";
    signal v_count : unsigned(9 downto 0) := "0000000000";

    constant HORIZONTAL_SYNC : unsigned(9 downto 0) := TO_UNSIGNED(h_pulse + h_bp + h_display + h_fp,10);
	 constant HSYNC_2 : unsigned(9 downto 0) := TO_UNSIGNED((h_pulse/2) + h_display + h_fp,10);
    constant HSYNC_1 : unsigned(9 downto 0) := TO_UNSIGNED(h_pulse + h_display + h_fp,10);
    constant HSYNC_0 : unsigned(9 downto 0) := TO_UNSIGNED(h_display + h_fp,10);
	 constant VERTICAL_SYNC : unsigned(9 downto 0) := TO_UNSIGNED(v_pulse + v_bp + v_display + v_fp,10);
    constant VSYNC_1 : unsigned(9 downto 0) := TO_UNSIGNED(v_pulse + v_display + v_fp,10);
    constant VSYNC_0 : unsigned(9 downto 0) := TO_UNSIGNED(v_display + v_fp,10);
    constant ZERO : unsigned(9 downto 0) := "0000000000";
    constant ONE : unsigned(9 downto 0) := "1111111111";
begin


    video_on <= video_on_h and video_on_v;

    process
    begin
        wait until clk'event and clk = '1';

        --- h_count 640 px + tiempo extra para refresh
		  
        if h_count = HORIZONTAL_SYNC then
            h_count <= ZERO;
        else
            h_count <= h_count + 1;
        end if;

        if h_count <= HSYNC_1 and h_count >= HSYNC_0  then
            hs <= '0';
        else
            hs <= '1';
        end if;

        --- v_count 480 px + tiempo extra para refresh
	if h_count = HORIZONTAL_SYNC then
        if v_count >= VERTICAL_SYNC and h_count >= HSYNC_2 then
            v_count <= ZERO;
        else 
            v_count <= v_count + 1;
        end if;
        end if;

        if v_count <= VSYNC_1 and v_count >= VSYNC_0 then
            vs <= '0';
        else
            vs <= '1';
        end if;
        
        if h_count <= TO_UNSIGNED(h_display,10) then
            video_on_h <= '1' ;
        else
            video_on_h <= '0';
        end if;
	

        if v_count <= TO_UNSIGNED(v_display,10) then
            video_on_v <= '1' ;
        else
            video_on_v <= '0';
        end if;
        h_sync <= hs;
        v_sync <= vs;
		  
		  pixel_x<= h_count;
		  pixel_y<= v_count;

    end process;
	 
end Behavioral;
