----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:00:20 04/09/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Clk: in STD_LOGIC;
			  CE_NF: in STD_LOGIC;
			  CE_ZF: in STD_LOGIC;
			  CE_OVF: in STD_LOGIC;
			  CE_CF: in STD_LOGIC;
			  lit4: in STD_LOGIC_VECTOR (3 downto 0);
			  RdData1 : in  STD_LOGIC_VECTOR (15 downto 0);
           RdData2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
			  NF : out STD_LOGIC;
			  ZF : out STD_LOGIC;
			  CF:	out STD_LOGIC;
			  OVF: out STD_LOGIC
			  );
end ALU;

architecture Behavioral of ALU is
	
	signal OP1	   : std_logic_vector(15 downto 0);
	signal OP2	   : std_logic_vector(15 downto 0);
	signal sY		: std_logic_vector(16 downto 0);
	signal sZF		: std_logic;
	signal sOVF		: std_logic;
	signal sLSR    : std_logic_vector (15 downto 0);
	signal sCLR 	: std_logic_vector (15 downto 0);
	signal sSE		: std_logic_vector (16 downto 0);
	signal sRRNC   : std_logic_vector (15 downto 0);
begin
	
	Y 	<= sY(15 downto 0);
	sZF <= '1' when sY(15 downto 0) = x"0000"
				  else '0';
	sOVF <= '1' when (OP1(15) = OP2(15)) and (OP1(15) /= sY(15)) 
			  else '1' when (OP1(15) /= OP2(15)) and (ALUOP = "001") and (OP1(15) /= sY(15))
			  else '0';
	sLSR <= OP1(15 downto 0) when lit4 = x"0" else
			  "0"&OP1(15 downto 1) when lit4 = x"1" else
			  "00"&OP1(15 downto 2) when lit4 = x"2" else
			  "000"&OP1(15 downto 3) when lit4 = x"3" else
			  "0000"&OP1(15 downto 4) when lit4 = x"4" else
			  "00000"&OP1(15 downto 5) when lit4 = x"5" else
			  "000000"&OP1(15 downto 6) when lit4 = x"6" else
			  "0000000"&OP1(15 downto 7) when lit4 = x"7" else
			  "00000000"&OP1(15 downto 8) when lit4 = x"8" else
			  "000000000"&OP1(15 downto 9) when lit4 = x"9" else
			  "0000000000"&OP1(15 downto 10) when lit4 = x"A" else
			  "00000000000"&OP1(15 downto 11) when lit4 = x"B" else
			  "000000000000"&OP1(15 downto 12) when lit4 = x"C" else
			  "0000000000000"&OP1(15 downto 13) when lit4 = x"D" else
			  "00000000000000"&OP1(15 downto 14) when lit4 = x"E" else
			  "000000000000000"&OP1(15) when lit4 = x"F" else
			  x"0000";
			  
	sCLR <= x"0000";
	
	sSE (7 downto 0) <= OP2(7 downto 0);
	sSE (16 downto 8) <= b"0"&x"FF" when OP2(7) ='1' else
								b"1"&x"00";
	
	sRRNC(14 downto 0) <= OP2(15 downto 1);
	sRRNC(15) <= OP2(0);
	
		
	NF  <= sY(15) when rising_edge(Clk) and CE_NF = '1';
	ZF  <= sZF when rising_edge(Clk) and CE_ZF = '1';
	OVF <= sOVF when rising_edge(Clk) and CE_OVF = '1';
	CF  <= sY(16) when rising_edge(Clk) and CE_CF = '1';
	OP1 <= RdData1;
	OP2 <= RdData2;
	
	with ALUOP select
			
			sY <= ('0' & OP1) + ('0' & OP2) when "000",
					('0' & OP1) - ('1' & OP2) when "001",
				   ('0' & OP1) and ('0' & OP2) when "010",
					('0' & OP1) or ('0' & OP2) when "011",
					('0' & sLSR) when "100",
					('0' & sCLR) when "101",
					sSE when "110",
					('0' & sRRNC) when others;

end Behavioral;

