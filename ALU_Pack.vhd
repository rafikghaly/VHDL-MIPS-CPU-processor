library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ALU_Pack is

component ALU_1Bit is 
Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  aluop : in std_logic_vector(3 downto 0); 
           carry_in : in  STD_LOGIC;
			  Less : in std_logic;
			  set : out std_logic;
           carry_out : out  STD_LOGIC;
           result : out  STD_LOGIC);
end component;
end ALU_Pack;

package body ALU_Pack is

end ALU_Pack;
