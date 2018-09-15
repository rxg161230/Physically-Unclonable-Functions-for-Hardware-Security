----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:41:11 11/26/2016 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Generic (
					nr_ro     : natural := 16;
					puf_width : natural := 16
				);
    Port 	( 	
	 				shift_i   : in  std_logic ; --debug
					rst_i   : in STD_LOGIC; 
					dout_o    : out std_logic_vector(3 downto 0); --debug					
					sel_i     : in  std_logic_vector(7 downto 0); --debug	
					clk_i   : in STD_LOGIC;
					
	puf_out : out STD_LOGIC_VECTOR (15 downto 0)
				);
end top;

architecture Behavioral of top is

	constant c_width    : natural := puf_width;
	constant c_number_of_ro : natural := nr_ro;
 
-----------------------------DEBUG-------------------------------------
	signal s_sel     : std_logic_vector(7 downto 0) := (others => '0');
	signal s_dout    : std_logic_vector(3 downto 0) := (others => '0');
	signal s_shift   : std_logic := '0';
   signal s_shift_pre : std_logic := '0';
	signal s_pulse  : std_logic := '0';		
	signal s_msb     : integer range 0 to 16 := 4;
-----------------------------------------------------------------------	

	signal s_reset	   : std_logic := '0';
	signal s_finish   : std_logic_vector (c_width-1 downto 0):= (others => '0');
	signal s_puf_out  : std_logic_vector (c_width-1 downto 0):= (others => '0');

--------------components----------------------------
   component puf_bit
		generic (
						nr_ro: natural := c_number_of_ro
					);
		port 		(
					clk_i     : in  std_logic;
					rst_i     : in  std_logic;
					sel1_i    : in  std_logic_vector(3 downto 0);
					sel2_i    : in  std_logic_vector(3 downto 0);
					finish_o	 : out  std_logic;
					puf_bit_o : out  std_logic
					);
   end component;

	component debouncer
	generic(counter_size  :  integer := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
	port(
    clk_i     : in  std_logic;  --input clock
    button_i  : in std_logic;  --input signal to be debounced
	 enable_i  : in std_logic; 
    result_o  : out  std_logic); --debounced signal
	end component;

begin

s_sel   <= sel_i;    
		dout_o  <= s_puf_out(7 downto 4);
		
		Generate_PUF:
		
	for i in 0 to c_width-1 generate		
		Multiple_Puf_Bits: puf_bit 
			generic map (nr_ro => c_number_of_ro)
			port map (
							clk_i     => clk_i, 
							rst_i     => s_reset, 
							sel1_i    => s_sel(3 downto 0),   
							sel2_i    => s_sel(7 downto 4),
							finish_o	 => s_finish(i),
							puf_bit_o => s_puf_out(i)
			);
		end generate;
		
		reset_debounce: debouncer
		generic map (counter_size => 19)
		port    map (clk_i => clk_i, button_i => not rst_i, enable_i => '1', result_o => s_reset); --On FPGA board btn is low active
	
		btn_debounce: debouncer
		generic map (counter_size => 19)
		port    map (clk_i => clk_i, button_i => not shift_i, enable_i => '1', result_o => s_shift); --On FPGA board btn is low active
	
------------ debug--------------------------------
		

----------------------------------------------	


end Behavioral; 