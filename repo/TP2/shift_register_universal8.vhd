library ieee;
use ieee.std_logic_1164.all;

entity shift_register_universal8 is
    port (
        SSR   : in  std_logic;
        SSL   : in  std_logic;
        Pi    : in  std_logic_vector(7 downto 0);
        SEL   : in  std_logic_vector(2 downto 0);
        CLK   : in  std_logic;
        SETn  : in  std_logic;
        RSTn  : in  std_logic;
        SOR   : out std_logic;
        SOL   : out std_logic;
        Qo    : out std_logic_vector(7 downto 0)
    );
end shift_register_universal8;

architecture behavioral of shift_register_universal8 is
    signal reg : std_logic_vector(7 downto 0) := (others => '0');
begin
    process(CLK, RSTn, SETn)
    begin
        if RSTn = '0' then
            reg <= (others => '0');
        elsif SETn = '0' then
            reg <= (others => '1');
        elsif rising_edge(CLK) then
            case SEL is
                when "000" => -- Hold
                    reg <= reg;
                when "001" => -- Shift right
                    reg <= SSR & reg(7 downto 1);
                when "010" => -- Shift left
                    reg <= reg(6 downto 0) & SSL;
                when "101" => -- Rotate right
                    reg <= reg(0) & reg(7 downto 1);
                when "110" => -- Rotate left
                    reg <= reg(6 downto 0) & reg(7);
                when others => -- Parallel load
                    if SEL(1 downto 0) = "11" then
                        reg <= Pi;
                    end if;
            end case;
        end if;
    end process;

    Qo  <= reg;
    SOR <= reg(0); -- sortie série droite
    SOL <= reg(7); -- sortie série gauche
end behavioral;