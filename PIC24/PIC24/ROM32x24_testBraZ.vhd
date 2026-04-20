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
				x"410382",  --2   ADD W2, W2, W7
				x"320002",  --3   BRA Z, 0x2C4  
				x"408182",  --4   ADD W1, W2, W3
				x"320001",  --5   BRA Z, 0x2C6  
				x"37FFFF",  --6   BRA 0x2C4     
				x"37FFF8",  --7   BRA 0x2B8     
				x"000000",  --8   
				x"000000",  --9   
				x"000000",  --10  
				x"000000",  --11  
				x"000000",  --12  
				x"000000",  --13
				x"000000",  --14
				x"000000",  --15
				x"000000",  --16
				x"000000",  --17
				x"000000",  --18
				x"000000",  --19
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

