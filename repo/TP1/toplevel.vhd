library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity toplevel is
port (
LEDR : out std_logic_vector(9 downto 0);
LEDG : out std_logic_vector(7 downto 0);
SW : in std_logic_vector(9 downto 0)
);
end entity;

architecture behavorial of toplevel is
begin
	instance_full_adder_4b : entity work.full_adder_4b port map(
	A => SW(3 downto 0),
	B => SW(7 downto 4),
	Cin => SW(9),
	
	S => LEDG(3 downto 0),
	Cout => LEDG(7)
	);
	
	LEDR(3 downto 0) <= SW(3 downto 0);
	LEDR(7 downto 4) <= SW(7 downto 4);
	LEDR(9) <= SW(9);
	
end architecture;
