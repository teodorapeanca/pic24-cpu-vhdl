--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : PIC24.vhf
-- /___/   /\     Timestamp : 09/17/2025 06:33:50
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx92i\bin\nt\sch2vhdl.exe -intstyle ise -family spartan3 -flat -suppress -w Z:/PIC24/PIC24.sch PIC24.vhf
--Design Name: PIC24
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PIC24 is
   port ( Clk   : in    std_logic; 
          INW0  : in    std_logic_vector (15 downto 0); 
          INW1  : in    std_logic_vector (15 downto 0); 
          OUTW0 : out   std_logic_vector (15 downto 0));
end PIC24;

architecture BEHAVIORAL of PIC24 is
   signal ALUOP    : std_logic_vector (2 downto 0);
   signal Branch   : std_logic;
   signal CE_CF    : std_logic;
   signal CE_NF    : std_logic;
   signal CE_OVF   : std_logic;
   signal CE_ZF    : std_logic;
   signal Instr    : std_logic_vector (23 downto 0);
   signal MemWr    : std_logic;
   signal Mem2Reg  : std_logic;
   signal New_PC   : std_logic_vector (5 downto 0);
   signal PC       : std_logic_vector (5 downto 0);
   signal RdData1  : std_logic_vector (15 downto 0);
   signal RdData2  : std_logic_vector (15 downto 0);
   signal RegBase  : std_logic;
   signal RegDest  : std_logic;
   signal RegWr    : std_logic;
   signal WrData   : std_logic_vector (15 downto 0);
   signal WrReg    : std_logic_vector (3 downto 0);
   signal XLXN_1   : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_13  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_50  : std_logic_vector (3 downto 0);
   signal XLXN_96  : std_logic_vector (15 downto 0);
   signal XLXN_100 : std_logic_vector (15 downto 0);
   component PC_Update
      port ( Branch : in    std_logic; 
             NF     : in    std_logic; 
             ZF     : in    std_logic; 
             CF     : in    std_logic; 
             OVF    : in    std_logic; 
             Funct  : in    std_logic_vector (2 downto 0); 
             Offset : in    std_logic_vector (5 downto 0); 
             PC     : in    std_logic_vector (5 downto 0); 
             New_PC : out   std_logic_vector (5 downto 0));
   end component;
   
   component ProgCnt
      port ( Clk    : in    std_logic; 
             New_PC : in    std_logic_vector (5 downto 0); 
             PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ROM32x24
      port ( Addr : in    std_logic_vector (4 downto 0); 
             Data : out   std_logic_vector (23 downto 0));
   end component;
   
   component MUX2V5
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (3 downto 0); 
             I1  : in    std_logic_vector (3 downto 0); 
             Y   : out   std_logic_vector (3 downto 0));
   end component;
   
   component File_Regs
      port ( Clk     : in    std_logic; 
             WrEn    : in    std_logic; 
             RdReg1  : in    std_logic_vector (3 downto 0); 
             RdReg2  : in    std_logic_vector (3 downto 0); 
             WrReg   : in    std_logic_vector (3 downto 0); 
             WrData  : in    std_logic_vector (15 downto 0); 
             RdData1 : out   std_logic_vector (15 downto 0); 
             RdData2 : out   std_logic_vector (15 downto 0));
   end component;
   
   component ALU
      port ( Clk     : in    std_logic; 
             CE_NF   : in    std_logic; 
             CE_ZF   : in    std_logic; 
             CE_OVF  : in    std_logic; 
             CE_CF   : in    std_logic; 
             RdData1 : in    std_logic_vector (15 downto 0); 
             RdData2 : in    std_logic_vector (15 downto 0); 
             ALUOP   : in    std_logic_vector (2 downto 0); 
             NF      : out   std_logic; 
             ZF      : out   std_logic; 
             CF      : out   std_logic; 
             OVF     : out   std_logic; 
             Y       : out   std_logic_vector (15 downto 0); 
             lit4    : in    std_logic_vector (3 downto 0));
   end component;
   
   component DataMem
      port ( Clk     : in    std_logic; 
             Wr      : in    std_logic; 
             INW0    : in    std_logic_vector (15 downto 0); 
             INW1    : in    std_logic_vector (15 downto 0); 
             Addr    : in    std_logic_vector (4 downto 0); 
             DataIn  : in    std_logic_vector (15 downto 0); 
             OUTW0   : out   std_logic_vector (15 downto 0); 
             DataOut : out   std_logic_vector (15 downto 0));
   end component;
   
   component ctrl
      port ( OP      : in    std_logic_vector (4 downto 0); 
             MemWr   : out   std_logic; 
             Mem2Reg : out   std_logic; 
             RegWr   : out   std_logic; 
             RegDest : out   std_logic; 
             RegBase : out   std_logic; 
             Branch  : out   std_logic; 
             CE_NF   : out   std_logic; 
             CE_ZF   : out   std_logic; 
             CE_OVF  : out   std_logic; 
             CE_CF   : out   std_logic; 
             ALUOP   : out   std_logic_vector (2 downto 0));
   end component;
   
   component MUX2V16
      port ( Sel : in    std_logic; 
             Y   : out   std_logic_vector (15 downto 0); 
             I1  : in    std_logic_vector (15 downto 0); 
             I0  : in    std_logic_vector (15 downto 0));
   end component;
   
begin
   XLXI_1 : PC_Update
      port map (Branch=>XLXN_1,
                CF=>XLXN_13,
                Funct(2 downto 0)=>Instr(18 downto 16),
                NF=>XLXN_11,
                Offset(5 downto 0)=>Instr(5 downto 0),
                OVF=>XLXN_14,
                PC(5 downto 0)=>PC(5 downto 0),
                ZF=>XLXN_12,
                New_PC(5 downto 0)=>New_PC(5 downto 0));
   
   XLXI_2 : ProgCnt
      port map (Clk=>Clk,
                New_PC(5 downto 0)=>New_PC(5 downto 0),
                PC(5 downto 0)=>PC(5 downto 0));
   
   XLXI_3 : ROM32x24
      port map (Addr(4 downto 0)=>PC(5 downto 1),
                Data(23 downto 0)=>Instr(23 downto 0));
   
   XLXI_7 : MUX2V5
      port map (I0(3 downto 0)=>Instr(18 downto 15),
                I1(3 downto 0)=>Instr(14 downto 11),
                Sel=>RegBase,
                Y(3 downto 0)=>XLXN_50(3 downto 0));
   
   XLXI_8 : MUX2V5
      port map (I0(3 downto 0)=>Instr(3 downto 0),
                I1(3 downto 0)=>Instr(10 downto 7),
                Sel=>RegDest,
                Y(3 downto 0)=>WrReg(3 downto 0));
   
   XLXI_9 : File_Regs
      port map (Clk=>Clk,
                RdReg1(3 downto 0)=>XLXN_50(3 downto 0),
                RdReg2(3 downto 0)=>Instr(3 downto 0),
                WrData(15 downto 0)=>WrData(15 downto 0),
                WrEn=>RegWr,
                WrReg(3 downto 0)=>WrReg(3 downto 0),
                RdData1(15 downto 0)=>RdData1(15 downto 0),
                RdData2(15 downto 0)=>RdData2(15 downto 0));
   
   XLXI_10 : ALU
      port map (ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                CE_CF=>CE_CF,
                CE_NF=>CE_NF,
                CE_OVF=>CE_OVF,
                CE_ZF=>CE_ZF,
                Clk=>Clk,
                lit4(3 downto 0)=>Instr(3 downto 0),
                RdData1(15 downto 0)=>RdData1(15 downto 0),
                RdData2(15 downto 0)=>RdData2(15 downto 0),
                CF=>open,
                NF=>open,
                OVF=>open,
                Y(15 downto 0)=>XLXN_100(15 downto 0),
                ZF=>open);
   
   XLXI_12 : DataMem
      port map (Addr(4 downto 0)=>Instr(8 downto 4),
                Clk=>Clk,
                DataIn(15 downto 0)=>RdData2(15 downto 0),
                INW0(15 downto 0)=>INW0(15 downto 0),
                INW1(15 downto 0)=>INW1(15 downto 0),
                Wr=>MemWr,
                DataOut(15 downto 0)=>XLXN_96(15 downto 0),
                OUTW0(15 downto 0)=>OUTW0(15 downto 0));
   
   XLXI_13 : ctrl
      port map (OP(4 downto 0)=>Instr(23 downto 19),
                ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                Branch=>Branch,
                CE_CF=>CE_CF,
                CE_NF=>CE_NF,
                CE_OVF=>CE_OVF,
                CE_ZF=>CE_ZF,
                MemWr=>MemWr,
                Mem2Reg=>Mem2Reg,
                RegBase=>RegBase,
                RegDest=>RegDest,
                RegWr=>RegWr);
   
   XLXI_16 : MUX2V16
      port map (I0(15 downto 0)=>XLXN_100(15 downto 0),
                I1(15 downto 0)=>XLXN_96(15 downto 0),
                Sel=>Mem2Reg,
                Y(15 downto 0)=>WrData(15 downto 0));
   
end BEHAVIORAL;


