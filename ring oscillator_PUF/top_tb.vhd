--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:04:18 11/28/2016
-- Design Name:   
-- Module Name:   C:/Users/riagh/puf_design/top_tb.vhd
-- Project Name:  puf_design
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         shift_i : IN  std_logic;
         rst_i : IN  std_logic;
         dout_o : OUT  std_logic_vector(3 downto 0);
         sel_i : IN  std_logic_vector(7 downto 0);
         clk_i : IN  std_logic;
         puf_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal shift_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal sel_i : std_logic_vector(7 downto 0) := (others => '0');
   signal clk_i : std_logic := '0';

 	--Outputs
   signal dout_o : std_logic_vector(3 downto 0);
   signal puf_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          shift_i => shift_i,
          rst_i => rst_i,
          dout_o => dout_o,
          sel_i => sel_i,
          clk_i => clk_i,
          puf_out => puf_out
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
