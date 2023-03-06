# VHDL-MIPS-CPU-processor
CPU perform certain  instructions: R-type (AND, OR, ADD, SUB, SLT and NOR), I-type (lw, sw, beq, bne) and J  instruction.

MainModule Entity look as follows: 

• START: IN STD_LOGIC;

• CLK: IN STD_LOGIC;

• RegFileOut1: OUT STD_LOGIC_VECTOR(31 downto 0);

• RegFileOut2: OUT STD_LOGIC_VECTOR(31 downto 0);

• ALUOut: OUT STD_LOGIC_VECTOR(31 downto 0);

• PCOut: OUT STD_LOGIC_VECTOR(31 downto 0);

• DataMemOut: OUT STD_LOGIC_VECTOR(31 downto 0);


Test Case:
• Assembly program that calculates the first twelve Fibonacci numbers and store them in array at 
the beginning of the Data Memory.

• After the program finishes, you should see the following sequence in $s0: 1, 1, 2, 3, 5, 8, 13, 
21, 34, 55, 89, 144, 0, -1


![687474703a2f2f692e696d6775722e636f6d2f365233587a2e706e67](https://user-images.githubusercontent.com/40712708/223142984-0bb4c890-e6fc-4e32-a45b-00343024ea8b.png)
