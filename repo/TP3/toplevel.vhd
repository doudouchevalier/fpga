library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity toplevel is
    port (
        CLOCK_50_B6A : in std_logic;
        KEY          : in std_logic_vector(3 downto 0);
        LEDR         : out std_logic_vector(9 downto 0)
    );
end entity;

architecture Behavioral of toplevel is
    signal clk_slow : std_logic;
begin
    U1: entity work.clock_divider
        port map (
            CLKin  => CLOCK_50_B6A,
            RST    => KEY(0),
            N      => "10100",
            CLKout => clk_slow
        );

    U2: entity work.chenillard
        port map (
            CLK  => clk_slow,
            RST  => KEY(0),
            CHEN => LEDR
        );
end architecture;
