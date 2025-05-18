library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity chenillard is
    port (
        CLK  : in std_logic;
        RST  : in std_logic;
        CHEN : out std_logic_vector(9 downto 0)
    );
end entity;

architecture Behavioral of chenillard is
    type states_array is array(0 to 10) of std_logic_vector(9 downto 0);
    constant states : states_array := (
        "0000001111",
        "0000011110",
        "0000111100",
        "0001111100",
        "0011110000",
        "0111100000",
        "1111000000",
        "1110000001",
        "1100000011",
        "1000000111",
        "0000001111"
    );
    signal state : integer range 0 to 10 := 0;
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '0' then
                state <= 0;
            else
                if state = 10 then
                    state <= 1;
                else
                    state <= state + 1;
                end if;
            end if;
        end if;
    end process;

    CHEN <= states(state);
end architecture;
