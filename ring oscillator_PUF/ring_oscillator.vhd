----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:13 11/26/2016 
-- Design Name: 
-- Module Name:    ring_oscillator - Behavioral 
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

entity ring_oscilator is
	generic (delay: time := 200ps;
				chain_len: integer := 16);
    port( rst_i : in  std_logic;
			 ro_o  : out  std_logic);
end ring_oscilator;

architecture Behavioral of ring_oscilator is
  signal chain : std_logic_vector(chain_len downto 0);
  attribute keep: boolean;
  attribute keep of chain: signal is true;
begin

--assert chain_len mod 2 = 1 report "Length of ring must be an odd number!" severity failure;

  gen_chain:
  for i in 1 to chain_len generate
    chain(i) <= not chain(i-1) after delay;
  end generate;
  chain(0) <= chain(chain_len) nor rst_i after delay;

 ro_o <= chain(chain_len);

end Behavioral;