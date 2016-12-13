----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Graham Thoms
-- 
-- Create Date:    19:44:35 02/20/2016 
-- Design Name: 
-- Module Name:    FullAdder1bit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


-----------------------------------------------------------------
--								1 BIT FULL ADDER
-----------------------------------------------------------------

entity FullAdder1bit is
    Port ( a 	: in   STD_LOGIC;		-- bit a
           b 	: in   STD_LOGIC;		-- bit b
           ci 	: in   STD_LOGIC;		-- bit carry in
           s 	: out  STD_LOGIC;		-- bit sum = a + b + ci
           co 	: out  STD_LOGIC);	-- bit carry out
end FullAdder1bit;

----------------- data flow ---------------------------

architecture FA_dataflow of FullAdder1bit is

	-- dataflow of fulladder

begin

	-- logic gates for full adder design

	s <= ((a xor b) xor ci);						-- sum
	co <= ((a and b) or ((a xor b) and ci));	-- carry out

end FA_dataflow;

----------------- end data flow ----------------------

----------------- structural -------------------------

architecture FA_struct of FullAdder1bit is

	-- components needed for building circuit

	component xor_2 is
		 Port ( x : in   STD_LOGIC;
				  y : in   STD_LOGIC;
				  g : out  STD_LOGIC);
	end component;
	
	component and_2 is
		 Port ( x : in   STD_LOGIC;
				  y : in   STD_LOGIC;
				  g : out  STD_LOGIC);
	end component;
	
	component or_2 is
		 Port ( x : in   STD_LOGIC;
				  y : in   STD_LOGIC;
				  g : out  STD_LOGIC);
	end component;

	-- intermediate wires

	signal wireABxor, wireABand, wireABCand:STD_LOGIC;
	
	begin
	
	-- porting of individual components to make full adder
	
		U0: xor_2 port map(a,b,wireABxor);
		U1: and_2 port map(a,b,wireABand);
		U2: xor_2 port map(wireABxor,ci,s);
		U3: and_2 port map(wireABxor,ci,wireABCand);
		U4: or_2  port map(wireABCand,wireABand,co);

end FA_struct;

----------------- end structural ---------------------

----------------- behavioural ------------------------

architecture FA_Behav of FullAdder1bit is

begin

	FA: process(a,b,ci)
	begin
	
	-- multiplexer logic for full adder
	
			if(a = '0' and b = '0' and Ci = '0')then s <= '0'; co <= '0'; 
		elsif(a = '0' and b = '0' and Ci = '1')then s <= '1'; co <= '0';
		elsif(a = '0' and b = '1' and Ci = '0')then s <= '1'; co <= '0'; 
		elsif(a = '0' and b = '1' and Ci = '1')then s <= '0'; co <= '1'; 
		elsif(a = '1' and b = '0' and Ci = '0')then s <= '1'; co <= '0'; 
		elsif(a = '1' and b = '0' and Ci = '1')then s <= '0'; co <= '1'; 
		elsif(a = '1' and b = '1' and Ci = '0')then s <= '0'; co <= '1'; 
		else 	s <= '1'; co <= '1';
		end if;
	
	end process FA;

end FA_Behav;

----------------- end behavioural --------------------

-----------------------------------------------------------------
--								END 1 BIT FULL ADDER
-----------------------------------------------------------------
-----------------------------------------------------------------
--								XOR2
-----------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- two input XOR gate

entity xor_2 is
    Port ( x : in   STD_LOGIC;		-- input x
           y : in   STD_LOGIC;		-- input y
           g : out  STD_LOGIC);		-- output g = x and y
end xor_2;

architecture structural of xor_2 is

begin
	g <= x xor y;	-- output

end structural;
-----------------------------------------------------------------
--								END XOR2
-----------------------------------------------------------------
-----------------------------------------------------------------
--								AND2
-----------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- two input AND gate

entity and_2 is
    Port ( x : in   STD_LOGIC;		-- input x
           y : in   STD_LOGIC;		-- input y
           g : out  STD_LOGIC);		-- output g = x and y
end and_2;

architecture structural of and_2 is

begin
	g <= x and y;	-- output

end structural;
-----------------------------------------------------------------
--								END AND2
-----------------------------------------------------------------
-----------------------------------------------------------------
--								OR2
-----------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- two input OR gate

entity or_2 is
    Port ( x : in   STD_LOGIC;		-- input x
           y : in   STD_LOGIC;		-- input y
           g : out  STD_LOGIC);		-- output g = x or y
end or_2;

architecture structural of or_2 is

begin
	g <= x or y;	-- output

end structural;
-----------------------------------------------------------------
--								END OR2
-----------------------------------------------------------------

