
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux1 is
 Port ( data1 : in  STD_LOGIC;
           data2 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           Mux_out : out  STD_LOGIC);


end Mux1;

architecture Behavioral of Mux1 is

begin
Mux_out <= data1 when sel = '0' else
           data2 when sel = '1' else
			  'Z';

end Behavioral;

