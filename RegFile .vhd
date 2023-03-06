library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Register_File_Pack.all;


entity RegFile is

GENERIC (n: NATURAL := 32) ;

Port (
           read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0)

);
end RegFile;

architecture Behavioral of RegFile is
signal decoderOutput: STD_LOGIC_VECTOR (31 downto 0);
signal O1: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O2: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O3: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O4: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O5: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O6: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O7: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O8: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O9: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O10: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O11: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O12: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O13: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O14: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O15: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O16: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O17: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O18: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O19: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O20: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O21: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O22: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O23: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O24: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O25: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O26: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O27: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O28: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O29: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O30: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O31: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal O32: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal MUX1Out: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal MUX2Out: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
decoder1: Decoder PORT MAP (write_sel,'1',decoderOutput);
R1: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(0) ,'0','0',O1);
R2: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(1) ,'0','0',O2);
R3: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(2) ,'0','0',O3);
R4: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(3) ,'0','0',O4);
R5: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(4) ,'0','0',O5);
R6: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(5) ,'0','0',O6);
R7: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(6) ,'0','0',O7);
R8: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(7) ,'0','0',O8);
R9: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(8) ,'0','0',O9);
R10: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(9) ,'0','0',O10);
R11: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(10) ,'0','0',O11);
R12: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(11) ,'0','0',O12);
R13: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(12) ,'0','0',O13);
R14: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(13) ,'0','0',O14);
R15: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(14) ,'0','0',O15);
R16: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(15) ,'0','0',O16);
R17: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(16) ,'0','0',O17);
R18: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(17) ,'0','0',O18);
R19: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(18) ,'0','0',O19);
R20: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(19) ,'0','0',O20);
R21: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(20) ,'0','0',O21);
R22: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(21) ,'0','0',O22);
R23: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(22) ,'0','0',O23);
R24: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(23) ,'0','0',O24);
R25: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(24) ,'0','0',O25);
R26: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(25) ,'0','0',O26);
R27: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(26) ,'0','0',O27);
R28: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(27) ,'0','0',O28);
R29: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(28) ,'0','0',O29);
R30: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(29) ,'0','0',O30);
R31: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(30) ,'0','0',O31);
R32: Regs GENERIC MAP(n) PORT MAP (write_data, clk, write_ena and decoderOutput(31) ,'0','0',O32);

MUX1: MUX PORT MAP (O32,O31,O30,O29,O28,O27,O26,O25,O24,O23,O22,O21,O20,O19,O18,O17,O16,O15,O14,O13,O12,O11,O10,O9,O8,O7,O6,O5,O4,O3,O2,O1,read_sel1,MUX1Out);
MUX2: MUX PORT MAP (O32,O31,O30,O29,O28,O27,O26,O25,O24,O23,O22,O21,O20,O19,O18,O17,O16,O15,O14,O13,O12,O11,O10,O9,O8,O7,O6,O5,O4,O3,O2,O1,read_sel2,MUX2Out);

data1 <= MUX1Out;
data2 <= MUX2Out;


end Behavioral;

