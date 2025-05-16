library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- J | K | Q | Q+
-----+---+---+---
-- 0 | 0 | 0 |  0
-- 0 | 0 | 1 |  1
-- 0 | 1 | 0 |  0
-- 0 | 1 | 1 |  0
-- 1 | 0 | 0 |  1
-- 1 | 0 | 1 |  1
-- 1 | 1 | 0 |  1
-- 1 | 1 | 1 |  0

entity flipflop_JK is
Port (
J    : in  STD_LOGIC;
K    : in  STD_LOGIC;
CLK  : in  STD_LOGIC;
Q    : out STD_LOGIC;
Qn : out STD_LOGIC
);
end flipflop_JK;

architecture Behavioral of flipflop_JK is
signal concat: std_logic_vector(1 downto 0);
signal tmp: STD_LOGIC :=  '0';

begin
PROCESS(CLK)
begin
if (CLK'event and CLK='1') then
concat <= J & K;
case concat is
when "00" =>
tmp <= tmp;
when "01" =>
tmp <= '0';
when "10" =>
tmp <= '1';
when "11" =>
tmp <= not tmp;
when others =>
	tmp <= tmp;
end case;
end if;
end PROCESS;
Q <= tmp;
Qn <= not tmp;

end Behavioral;