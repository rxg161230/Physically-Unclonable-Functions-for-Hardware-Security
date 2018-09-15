----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:10:41 11/30/2016 
-- Design Name: 
-- Module Name:    Butterfly_top - Behavioral 
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

entity Butterfly_top is
port ( Clock :IN STD_LOGIC;
PRE : IN STD_LOGIC;
Resetn : IN STD_LOGIC;
excite : IN std_logic;
response : OUT std_logic);
end Butterfly_top;

architecture Behavioral of Butterfly_top is
component flipflop_sr
port ( D, Resetn,PRE, Clock : IN STD_LOGIC ;
Q : OUT STD_LOGIC) ;

end component;
signal towardsD_ff1 : STD_LOGIC;
signal output : STD_LOGIC;

begin


D_ff_1 : flipflop_sr
port map (
PRE => PRE,
Resetn => excite,
Clock=>Clock,
D=> towardsD_ff1,
Q=> output );




D_ff_2 : flipflop_sr

port map (
PRE => excite,
Resetn => Resetn,
Clock=> Clock,
D=> output,
Q=> towardsD_ff1);


response<= output;

end Behavioral;



 