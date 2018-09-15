----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:24 11/30/2016 
-- Design Name: 
-- Module Name:    D_flipflop - Behavioral 
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

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY flipflop_sr IS
PORT ( D, Resetn,PRE, Clock : IN STD_LOGIC ;
Q : OUT STD_LOGIC) ;
END flipflop_sr ;
ARCHITECTURE behavioral OF flipflop_sr IS
BEGIN
PROCESS(Clock)
BEGIN
IF rising_edge(Clock) THEN
IF Resetn = '0' THEN
Q <= '0' ;
ELSE
Q <= D ;
END IF ;
END IF;
END PROCESS ;
END behavioral ;

