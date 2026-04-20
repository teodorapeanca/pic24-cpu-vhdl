----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:21 03/29/2024 
-- Design Name: 
-- Module Name:    PC_Update - Behavioral 
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

entity PC_Update is
    Port ( 
			  Funct : in STD_LOGIC_VECTOR (2 downto 0);
			  Offset : in STD_LOGIC_VECTOR (5 downto 0);
			  Branch : in STD_LOGIC;
			  PC : in  STD_LOGIC_VECTOR (5 downto 0);
           New_PC : out  STD_LOGIC_VECTOR (5 downto 0);
			  NF : in STD_LOGIC;
			  ZF : in STD_LOGIC;
			  CF : in STD_LOGIC;
			  OVF : in STD_LOGIC
			  );
end PC_Update;

architecture Behavioral of PC_Update is
signal PC_p2 : STD_LOGIC_VECTOR (5 downto 0);
signal depl : STD_LOGIC_VECTOR (5 downto 0);

begin
PC_p2 <= PC + 2;
depl <= Offset(4 downto 0) & '0';
New_PC <= (PC_p2 + depl) when (Branch = '1' and Funct = "111") else
			 (PC_p2 + depl) when (Branch = '1' and NF = '1'  and Funct = "011") else
			 (PC_p2 + depl) when (Branch = '1' and ZF = '1'  and Funct = "010") else
			 (PC_p2 + depl) when (Branch = '1' and OVF = '1' and Funct = "000") else
			 (PC_p2 + depl) when (Branch = '1' and CF = '1'  and Funct = "001") 
		    else PC_p2;
end Behavioral;

