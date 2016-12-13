----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Graham Thoms
-- 
-- Create Date:    17:44:59 02/20/2016 
-- Design Name: 
-- Module Name:    FullAdder_VHDL - Behavioral 
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
use WORK.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-----------------------------------------------------------------
--								3 BIT FULL ADDER
-----------------------------------------------------------------

entity FullAdder_VHDL is
    Port ( A 	: in   STD_LOGIC_VECTOR(2 downto 0);		-- input bits A1, A2, A3
           B 	: in   STD_LOGIC_VECTOR (2 downto 0);		-- input bits B1, B2, B3
           Ci 	: in   STD_LOGIC;									-- Carry in bit
           S 	: out  STD_LOGIC_VECTOR (2 downto 0);		-- output sum S(i) = A(i)+B(i)
           Co 	: out  STD_LOGIC);								-- carry out bit
end FullAdder_VHDL;

architecture Behavioral of FullAdder_VHDL is

	-- uses three 1 bit full adders cascaded together

	component FullAdder1bit is
		 Port ( a 	: in   STD_LOGIC;
				  b 	: in   STD_LOGIC;
				  ci 	: in   STD_LOGIC;
				  s 	: out  STD_LOGIC;
				  co 	: out  STD_LOGIC);
	end component;
	
	-- each bit has a different architecture configuration
	
	for B0: FullAdder1bit use entity WORK.FullAdder1bit (FA_dataflow);
	for B1: FullAdder1bit use entity WORK.FullAdder1bit (FA_struct);
	for B2: FullAdder1bit use entity WORK.FullAdder1bit (FA_Behav);
	
	signal cout0,cout1,cout2: STD_LOGIC;
	
begin

	-- three 1-bit full adders

	B0: FullAdder1bit port map (A(0),B(0),Ci,S(0),cout0);
	B1: FullAdder1bit port map (A(1),B(1),cout0,S(1),cout1);
	B2: FullAdder1bit port map (A(2),B(2),cout1,S(2),cout2);
	
	-- carry out bit
	
	Co <= cout2;

end Behavioral;

-----------------------------------------------------------------
--								END 3 BIT FULL ADDER
-----------------------------------------------------------------

