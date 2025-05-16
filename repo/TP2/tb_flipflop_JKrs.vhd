library ieee;
use ieee.std_logic_1164.all;

entity tb_flipflop_JKrs is
end entity;

architecture tb of tb_flipflop_JKrs is
    signal J, K, CLK, SETn, RSTn : std_logic := '1';
    signal Q, Qn : std_logic;
begin
    UUT: entity work.flipflop_JKrs port map(
        J => J,
        K => K,
        CLK => CLK,
        SETn => SETn,
        RSTn => RSTn,
        Q => Q,
        Qn => Qn
    );

    clk_proc: process
    begin
        CLK <= '0'; wait for 10 ns;
        CLK <= '1'; wait for 10 ns;
    end process;

    stim_proc: process
    begin
        -- Reset actif
        RSTn <= '0'; SETn <= '1'; wait for 20 ns;
        RSTn <= '1'; wait for 20 ns;

        -- Set actif
        SETn <= '0'; wait for 20 ns;
        SETn <= '1'; wait for 20 ns;

        -- Fonctionnement normal
        J <= '1'; K <= '0'; wait for 20 ns;
        J <= '1'; K <= '1'; wait for 20 ns;

        wait;
    end process;
end architecture;