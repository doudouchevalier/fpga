library ieee;
use ieee.std_logic_1164.all;

entity tb_shift_register_SISO8 is
end entity;

architecture tb of tb_shift_register_SISO8 is
    signal Si, CLK, SETn, RSTn : std_logic := '1';
    signal So : std_logic;
begin
    UUT: entity work.shift_register_SISO8 port map(
        Si => Si,
        CLK => CLK,
        SETn => SETn,
        RSTn => RSTn,
        So => So
    );

    clk_proc: process
    begin
        CLK <= '0'; wait for 10 ns;
        CLK <= '1'; wait for 10 ns;
    end process;

    stim_proc: process
    begin
        -- Reset
        RSTn <= '0'; wait for 20 ns;
        RSTn <= '1'; wait for 20 ns;

        -- Preset
        SETn <= '0'; wait for 20 ns;
        SETn <= '1'; wait for 20 ns;

        -- Décalage : injecter "1", puis "0"
        Si <= '1'; wait for 20 ns;
        Si <= '0'; wait for 80 ns; -- injecte des 0 pour décaler le 1

        wait;
    end process;
end architecture;