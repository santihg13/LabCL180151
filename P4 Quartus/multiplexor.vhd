library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexor is

port
	(
		s: in std_logic_vector(1 downto 0);
		a,b,c,d: in std_logic_vector(3 downto 0);
		y:out std_logic_vector(3 downto 0)
	);
end multiplexor;

architecture Behavioral of multiplexor is
begin

with s select

y<= a when "00",
	b when "01",
	c when "10",
	d when others;
	
end Behavioral;