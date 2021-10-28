library ieee; 
use ieee.std_logic_1664.all;

entity circuitoLogico is
	port(
		--entradas
		A,B: in std_logic_vector (15 downto 0);
		S: in std_logic_vector (1 downto 0);
		--salidas
		G: out std_logic_vector(15 downto 0);
	)

end circuitoLogico;

architecture rtl of circuitoLogico is
begin 
	process(A,B,S)
	begin 
		case S is
			when "00" => G <= A and B;
			when "01" => G <= A or B;
			when "10" => G <= A xor B;
			when others => G <= not(A);
	end process;
end rtl;