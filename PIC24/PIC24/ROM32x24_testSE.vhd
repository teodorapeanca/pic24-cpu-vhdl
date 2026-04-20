----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:30 03/29/2024 
-- Design Name: 
-- Module Name:    ROM32x24 - Behavioral 
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

entity ROM32x24 is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24;

architecture Behavioral of ROM32x24 is
	type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
	
	constant ROM : tROM :=(
	         --test
				x"808101",  --0	MOV 0x1020, W1
				x"808112",  --1   MOV 0x1022, W2
				x"FB0302",  --2   SE W2, W6     
				x"408182",  --3   ADD W1, W2, W3
				x"FB0282",  --4   SE W2, W5     
				x"32000C",  --5   BRA Z, 0x2DC  
				x"FB0203",  --6   SE W3, W4     
				x"320001",  --7   BRA Z, 0x2CA  
				x"370009",  --8   BRA 0x2DC     
				x"FB0202",  --9   SE W2, W4     
				x"330007",  --10  BRA N, 0x2DC  
				x"FB0281",  --11  SE W1, W5     
				x"330001",  --12  BRA N, 0x2D4  
				x"370004",  --13  BRA 0x2DC     
				x"FB0201",  --14  SE W1, W4     
				x"310002",  --15  BRA C, 0x2DC  
				x"FB0283",  --16  SE W3, W5     
				x"310001",  --17  BRA C, 0x2DE  
				x"37FFFF",  --18  BRA 0x2DC     
				x"37FFEC",  --19  BRA 0x2B8     
				x"000000",  --20
				x"000000",  --21
				x"000000",  --22
				x"000000",  --23
				x"000000",  --24
				x"000000",  --25
				x"000000",  --26
				x"000000",  --27
				x"000000",  --28
				x"000000",  --29
				x"000000",  --30
				x"000000"   --31
				);
begin

	Data	<= ROM(conv_integer(Addr));
end Behavioral;

