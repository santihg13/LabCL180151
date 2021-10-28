library ieee;
use ieee.std_logic_1164.all;

entity deco24 is

port
(
	a: in std_logic_vector(1 downto 0);
	b,c,d,e: out std_logic
	
);
end deco24;

architecture Behavioral of deco24 is
begin

b<=not(a(0)) and not(a(1));
c<= not(a(0)) and a(1);
d<=a(0) and not(a(1));
e<=a(0) and a(1);
end Behavioral;