----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:27 11/26/2016 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
  generic(
    counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
  port(
    clk_i     : in  std_logic;  --input clock
    button_i  : in  std_logic;  --input signal to be debounced
	 enable_i  : in  std_logic;   -- for simulation
    result_o  : out std_logic); --debounced signal
end debouncer;

ARCHITECTURE logic of debouncer is
  signal finish_o   : std_logic;
  signal puf_bit_o  : std_logic;--input flip flops
  signal counter_set : std_logic;                    --sync reset to zero
  signal counter_out : std_logic_vector(counter_size downto 0) := (others => '0'); --counter output
begin

  counter_set <= finish_o xor puf_bit_o;   --determine when to start/reset counter
  
  process(clk_i)
  begin
    if rising_edge(clk_i) then
      finish_o <= button_i;
      puf_bit_o<= finish_o;
		
		if enable_i = '1' then
			if(counter_set = '1') then                  --reset counter because input is changing
				counter_out <= (others => '0');
			elsif(counter_out(counter_size) = '0') then --stable input time is not yet met
				counter_out <= counter_out + 1;
				else                                        --stable input time is met
					result_o <= puf_bit_o;
				end if;
						else
			result_o <= finish_o;
			end if;

		end if;
  end process;
end logic;