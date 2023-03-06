library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
 Port ( 
           A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
			  A3 : in  std_logic;

           sel : in  STD_LOGIC_vector(1 downto 0);
           Mux2_out : out  STD_LOGIC);
end Mux2;

architecture Behavioral of Mux2 is

begin
Mux2_out <= A0 when sel = "00" else
            A1 when sel = "01" else
            A2 when sel = "10" else
				A3 when sel = "11" else
				'Z';
				


end Behavioral;

