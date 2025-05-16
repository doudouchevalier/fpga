library ieee;
use ieee.std_logic_1164.all;

entity flipflop_JKrs is
    port (
        J     : in std_logic;
        K     : in std_logic;
        CLK   : in std_logic;
        SETn  : in std_logic;
        RSTn  : in std_logic;
        Q     : out std_logic;
        Qn    : out std_logic
    );
end flipflop_JKrs;

architecture behavioral of flipflop_JKrs is
    signal Q_int : std_logic := '0';
	 signal concat: std_logic_vector(1 downto 0);	
begin
    process(CLK, RSTn, SETn)
    begin
		  concat <= J & K;
        if RSTn = '0' then
            Q_int <= '0';
        elsif SETn = '0' then
            Q_int <= '1';
        elsif rising_edge(CLK) then
            case concat is
                when "00" => Q_int <= Q_int;
                when "01" => Q_int <= '0';
                when "10" => Q_int <= '1';
                when "11" => Q_int <= not Q_int;
                when others => Q_int <= Q_int;
            end case;
        end if;
    end process;
    Q  <= Q_int;
    Qn <= not Q_int;
end behavioral;