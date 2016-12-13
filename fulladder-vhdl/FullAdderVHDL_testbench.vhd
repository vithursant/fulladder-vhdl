--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:22:53 02/22/2016
-- Design Name:   
-- Module Name:   H:/ENGG3050/FullAdderVHDL/FullAdderVHDL_testbench.vhd
-- Project Name:  FullAdderVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FullAdder_VHDL
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FullAdderVHDL_testbench IS
END FullAdderVHDL_testbench;
 
ARCHITECTURE behavior OF FullAdderVHDL_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FullAdder_VHDL
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         Ci : IN  std_logic;
         S : OUT  std_logic_vector(2 downto 0);
         Co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(2 downto 0) := (others => '0');
   signal Ci : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(2 downto 0);
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdder_VHDL PORT MAP (
          A => A,
          B => B,
          Ci => Ci,
          S => S,
          Co => Co
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for period;	
		
		-- keeping A = 6 and cycling through B
		
		A(0) <= '0'; -- 6
		A(1) <= '1';
		A(2) <= '1';
		
		B(0) <= '0';
		B(1) <= '0';
		B(2) <= '0';
		
		Ci <= '0';
		
		S(0) <= '1';
		S(1) <= '1';
		S(2) <= '0';
		Co <= '0';
		
		wait for period;
		
		B(0) <= '1'; -- 1
		B(1) <= '0';
		B(2) <= '0';
		
		Ci <= '0';
		
		S(0) <= '1'; -- 6 + 1 = 7
		S(1) <= '1';
		S(2) <= '1';
		Co <= '0';
		
		wait for period;
		
		B(0) <= '1'; -- 5
		B(1) <= '0';
		B(2) <= '1';
		
		Ci <= '0';
		
		S(0) <= '1'; -- 6 + 5 = 11 
		S(1) <= '1';
		S(2) <= '0';
		Co <= '1';
		
		wait for period;
		
		B(0) <= '1'; -- 7
		B(1) <= '1';
		B(2) <= '1';
		
		Ci <= '1';
		
		S(0) <= '0'; -- 6 + 8 = 14 
		S(1) <= '1';
		S(2) <= '1';
		Co <= '1';
		
      wait for period;
		
		B(0) <= '0'; -- 2
		B(1) <= '1';
		B(2) <= '0';
		
		Ci <= '1';
		
		S(0) <= '1'; -- 6 + 3 = 9 
		S(1) <= '0';
		S(2) <= '1';
		Co <= '1';
		
      wait for period;

      wait;
   end process;

END;
