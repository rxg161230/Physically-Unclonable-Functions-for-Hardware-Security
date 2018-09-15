----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:11 11/30/2016 
-- Design Name: 
-- Module Name:    Final_top - Behavioral 
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

entity Final_top is
port ( Clock :IN STD_LOGIC;
PRE : IN STD_LOGIC;
Resetn : IN STD_LOGIC;
excite : IN std_logic;
response1 : OUT std_logic;

response2 : OUT std_logic;

response3 : OUT std_logic);


end Final_top;

architecture Behavioral of Final_top is
component Butterfly_top
port (
Clock :IN STD_LOGIC;
PRE : IN STD_LOGIC;
Resetn : IN STD_LOGIC;
excite : IN std_logic;
response : OUT std_logic);

end component;
signal output1 : STD_LOGIC;
signal output2 : STD_LOGIC;
signal output3 : STD_LOGIC;
begin

U1 : Butterfly_top
port map(
 Clock  => Clock,
 PRE => PRE,
 excite => excite,
 Resetn => Resetn,
 response => output1);
 
 U2 : Butterfly_top
port map(
 Clock  => Clock,
 PRE => PRE,
 excite => excite,
 Resetn => Resetn,
 response => output2);
 
 U3 : Butterfly_top
port map(
 Clock  => Clock,
 PRE => PRE,
 excite => excite,
 Resetn => Resetn,
 response => output3);
 
 
response1 <= output1;
response2 <= output2;
response3 <= output3;


 
end Behavioral;




