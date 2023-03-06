library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity full_adder is
 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           carry_in : in  STD_LOGIC;
           carry_out : out  STD_LOGIC;
           result : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
signal tmp : std_logic_vector(1 downto 0);
begin
tmp <= ('0' & A) + ('0' & B) + ('0' & carry_in);

result <= tmp(0);
carry_out <= tmp(1);


end Behavioral;

