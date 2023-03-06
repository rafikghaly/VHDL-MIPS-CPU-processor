library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Control is
port(
      ALUOp : in std_logic_vector(1 downto 0);
		funct : in std_logic_vector(5 downto 0);
		operation : out std_logic_vector(3 downto 0)
		);
		
end ALU_Control;

architecture Behavioral of ALU_Control is
signal tmp1: std_logic; 
signal tmp2: std_logic;
signal tmp3: std_logic;
signal tmp4: std_logic;
signal tmp5: std_logic;
begin
tmp1 <= ALUOp(1) and funct(1);
tmp2 <= funct(0) or funct(3);
tmp3 <= tmp2 and ALUOp(1);
tmp4 <= funct(0) and funct(1);
tmp5 <= tmp4 and ALUOp(1);
operation(2) <= tmp1 or ALUOp(0);
operation(1) <= not(ALUOp(1)) or not(funct(2));
operation(0) <= tmp3 and not(tmp5);
operation(3) <= tmp5;


end Behavioral;

