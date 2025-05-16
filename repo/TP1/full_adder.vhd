library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_adder is

    -- Composant half_adder à instancier
    component half_adder
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            S : out STD_LOGIC;
            C : out STD_LOGIC
        );
    end component;

    -- Signaux internes
    signal S1, C1, C2 : STD_LOGIC;

begin

    -- Premier demi-additionneur : A + B
    HA1: half_adder port map (
        A => A,
        B => B,
        S => S1,
        C => C1
    );

    -- Deuxième demi-additionneur : S1 + Cin
    HA2: half_adder port map (
        A => S1,
        B => Cin,
        S => S,
        C => C2
    );

    -- Retenue finale
    Cout <= C1 or C2;

end Behavioral;