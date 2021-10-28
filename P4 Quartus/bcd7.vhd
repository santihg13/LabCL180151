library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity bcd7 is
	port(
		ent: in std_logic_vector( 3 downto 0);
		sal: out std_logic_vector (6 downto 0)
		);
		

end bcd7;

architecture Behavioral of bcd7 is
signal sal1: std_logic_vector(6 downto 0):= (others=> '0');
begin

process(ent)
begin

case ent is

when "0000" =>sal1 <= "0000001";
when "0001" =>sal1 <= "1001111";
when "0010" =>sal1 <= "0010010";
when "0011" =>sal1 <= "0000110";
when "0100" =>sal1 <= "1001100";
when "0101" =>sal1 <= "0100100";
when "0110" =>sal1 <= "0100000";
when "0111" =>sal1 <= "0000001";
when "1000" =>sal1<= "0000000";
when "1001" =>sal1 <= "0000100";
when others  =>sal1 <= "1111111";
end case;

end process;
sal<= not(sal1);
end Behavioral;