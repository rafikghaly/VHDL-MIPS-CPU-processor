
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2x1 is
Generic(n:NATURAL :=32);
 Port ( data1 : in  STD_LOGIC_VECTOR(n-1 downto 0);
           data2 : in  STD_LOGIC_VECTOR(n-1 downto 0);
           sel : in  STD_LOGIC;
           Mux_out : out  STD_LOGIC_VECTOR(n-1 downto 0));


end MUX2x1;

architecture Behavioral of MUX2x1 is

begin

Mux_out <= data1 when sel = '0' else
           data2 when sel = '1' else
			   (others=>'Z');
end Behavioral;


