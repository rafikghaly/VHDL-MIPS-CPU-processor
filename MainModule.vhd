----------------------------------------------------------------------------------
-- Submitted By:
----------------------------------------------------------------------------------
-- Rafik Tamer Magdy		20P1046
-- Mina Morgan	Mounir	20P1943
-- Mark Bassem	Heshmat	21P0363
-- Brwana Ahmed Mourad	20P1346
-- Ahmed Wael Ibrahim	20P3343
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.CPU_Pack.all;

entity MainModule is
port(
       START: IN STD_LOGIC;
		 CLK: IN STD_LOGIC;
		 RegFileOut1: OUT STD_LOGIC_VECTOR(31 downto 0);
		 RegFileOut2: OUT STD_LOGIC_VECTOR(31 downto 0);
		 ALUOut: OUT STD_LOGIC_VECTOR(31 downto 0);
		 PCOut: OUT STD_LOGIC_VECTOR(31 downto 0);
		 DataMemOut: OUT STD_LOGIC_VECTOR(31 downto 0)
		 );
		 
end MainModule;

architecture Behavioral of MainModule is
--SIGNALS--
----------------PC-------------------
SIGNAL PCInput,PCOutput:STD_LOGIC_VECTOR(31 downto 0):=(OTHERS=>'0');
SIGNAL PC_carry: STD_LOGIC;
SIGNAL Next_instruction: STD_LOGIC_VECTOR(31 downto 0); --PC+4--
-------------------------------------

----------------ALU-------------------
SIGNAL cflag,zflag,oflag: STD_LOGIC; --ALU flags--
SIGNAL ALUOp : std_logic_vector(1 downto 0); --ALU Operation Code--
SIGNAL operation : std_logic_vector(3 downto 0); --Operation code of the alu which is obtained from the ALU control unit--
SIGNAL ALUInput2,ALUResult: STD_LOGIC_VECTOR(31 downto 0); --ALU I/O--
SIGNAL PC_Overflow,PC_Zero:STD_LOGIC;
-------------------------------------

----------------Register File-------------------
SIGNAL WriteRegCode: STD_LOGIC_VECTOR(4 downto 0);
SIGNAL WriteData: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL Read1: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL Read2: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL Instruction:STD_LOGIC_VECTOR(31 downto 0):=(OTHERS=>'0');
-------------------------------------

----------------Operations-------------------
SIGNAL MEM_READ, MEM_WRITE,RegDst,Branch,BranchNE,Jump,MemToReg,ALUSrc,RegWrite: STD_LOGIC; --Control lines / Control unit outputs--
SIGNAL Immediate: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL JumpTargetAddress: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL BranchMUX_Sel : STD_LOGIC;
SIGNAL BranchTargetAddress: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL BranchAddrCarryOut,Branch_Zero,Branch_Overflow: STD_LOGIC;
SIGNAL BranchMUXResult: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL MemOut: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL BranchAddress: STD_LOGIC_VECTOR(31 downto 0);
-------------------------------------

begin

--Preparing processor components--
-------------------------------------
--Preparing Program Counter--
PC: Regs GENERIC MAP(32) PORT MAP (PCInput, CLK, START ,'0',not(START),PCOutput);
PCAdder: ALU PORT MAP(PCOutput,"00000000000000000000000000000100","0010",'0',Next_instruction,PC_carry,PC_Zero,PC_Overflow); 

--instruction (21 - 25): rs--
--instruction (16 - 20): rt--
--write reg mux chooses the destination register between rt, rd--
Reg_File: RegFile PORT MAP(Instruction(25 downto 21),Instruction(20 downto 16),WriteRegCode ,RegWrite,CLK,WriteData,Read1,Read2);
WriteRegMUX: MUX2x1 Generic Map(5) Port Map(Instruction(20 downto 16),Instruction(15 downto 11),RegDst,WriteRegCode);

--Configuring the main ALU--			 
ALU_32bit: ALU PORT MAP(Read1,ALUInput2,operation ,operation(2), ALUResult,cflag,zflag,oflag);
SignExtend: SignExtension Port Map(Instruction(15 downto 0),Immediate); --extends 16-bit immediate to 32-bit for ALU--
ALU_MUX: MUX2x1 Generic Map(32) Port Map(Read2,Immediate,ALUSrc,ALUInput2);

--Fetching Instruction Code--
InstructionMemory: INSTRMEMORY Port Map (not(START),Instruction,PCOutput,CLK);

--Control Unit Configuration : instruction(31 downto 26) are the opCode bits of the instruction--
CtrlUnit: Control_Unit PORT MAP(Instruction(31 downto 26),MEM_READ,MEM_WRITE,RegDst,Branch,BranchNE,Jump,MemToReg,ALUSrc,RegWrite,ALUOp);
ALUCtrl: ALU_Control PORT MAP(ALUOp,Instruction(5 downto 0),operation);

-------------------------------------
--Carrying out  instructions--
--Jump Instruction : --
--1- Fetch the offset from the instruction code--
--2- Append last 4 bits of PC+4 & offset & 00 at the end--
--3- Assign to program counter--

JumpTargetAddress <=Next_instruction(31 downto 28)&(Instruction(25 downto 0)&"00");
--Branch Operations--
BranchMUX_Sel <= (Branch and zflag) or (BranchNE and not(zflag)); --Take branch when condition of (beq or bne) is satisfied--
BranchAddress <= (Immediate(29 downto 0)&"00"); --Calculate the branch target address--

--We need an adder to add the branch address to pc+4--
BranchAddr: ALU PORT MAP(Next_instruction,BranchAddress,"0010",PC_carry,BranchTargetAddress,BranchAddrCarryOut,Branch_Zero,Branch_Overflow); 
BranchMUX: MUX2x1 Generic Map(32) Port Map(Next_instruction,BranchTargetAddress,BranchMUX_Sel,BranchMUXResult);

--Connect jump and branch operations using a multiplexor--
JumpMUX: MUX2x1 Generic Map(32) Port Map(BranchMUXResult,JumpTargetAddress,Jump,PCInput);
DataMEM: DATAMEMORY PORT MAP(not(START),Read2,MemOut,MEM_READ,MEM_WRITE,ALUResult,CLK);
Mem_MUX: MUX2x1 Generic Map(32) Port Map(ALUResult,MemOut,MemToReg,WriteData);

RegFileOut1 <= Read1;
RegFileOut2 <= Read2;
ALUOut <= ALUResult;
PCOut <= PCOutput;
DataMemOut <= MemOut;

end Behavioral;