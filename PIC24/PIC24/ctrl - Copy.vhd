----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:04:11 04/10/2024 
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity ctrl is
    Port ( OP : in  STD_LOGIC_VECTOR (4 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (2 downto 0);
           MemWr : out  STD_LOGIC;
           Mem2Reg : out  STD_LOGIC;
           RegWr : out  STD_LOGIC;
           RegDest : out  STD_LOGIC;
			  RegBase: out STD_LOGIC;
			  Branch : out STD_LOGIC;
			  CE_NF : out STD_LOGIC;
			  CE_ZF: out STD_LOGIC;
			  CE_OVF: out STD_LOGIC;
			  CE_CF: out STD_LOGIC
			  );
end ctrl;

architecture Behavioral of ctrl is

begin

	RegDest <='0' when OP = b"1_0000" else
				 '0' when OP = b"1_0001" else '1';
	
	RegBase <= '0' when  OP = b"0_1000" else
				  '0' when  OP = b"0_1010" else
				  '0' when  OP = b"0_1100" else
				  '0' when  OP = b"0_1110" else
				  '0' when  OP = b"1_1101" 
				  else '1';
				 
	RegWr <= '0' when OP = b"1_0001" else
				'0' when OP = b"0_0110" 
				else '1';
	
	MemWr <= '1' when OP = b"1_0001"
				    else '0';

 Mem2Reg <= '1' when OP = b"1_0000" 
				    else '0';
	
	ALUOP <= "000" when  OP = b"0_1000" else
			   "001" when  OP = b"0_1010" else
			   "010" when  OP = b"0_1100" else
			   "011" when  OP = b"0_1110" else
			   "100" when  OP = b"1_1011" else
			   "101" when  OP = b"1_1101" else
				"110" when  OP = b"1_1111" else
				"111" when  OP = b"1_1010";
				
 
 CE_NF   <= '1' when OP = b"0_1000" else
				'1' when OP = b"0_1010" else
				'1' when OP = b"0_1100" else 
				'1' when OP = b"0_1110" else
				'1' when OP = b"1_1011" else
				'1' when OP = b"1_1111" else
				'1' when OP = b"1_1010"
				else '0';	

 CE_OVF  <= '1' when OP = b"0_1000" else
				'1' when OP = b"0_1010" 
				else '0';				
	
 CE_ZF   <= '1' when OP = b"0_1000" else
				'1' when OP = b"0_1010" else
				'1' when OP = b"0_1100" else 
				'1' when OP = b"0_1110" else
				'1' when OP = b"1_1011" else
				'1' when OP = b"1_1111" else
				'1' when OP = b"1_1010"
				else '0';	
	
 CE_CF   <= '1' when OP = b"0_1000" else
				'1' when OP = b"0_1010" else
				'1' when OP = b"1_1111"
				else '0';
				
	Branch <= '1' when OP = b"0_0110"  
				 else '0';

end Behavioral;

