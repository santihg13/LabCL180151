library ieee;
use ieee.std_logic_1164.all;

entity unidadFuncional is
	port(
		--entradas
		FS: in std_logic_vector(3 downto 0);
		A, B: in std_logic_vector(15 downto 0);
		
		--salidas
		C,N,Z: out std_logic;
		F: out std_logic_vector(15 downto 0);
	)
end unidadFuncional;

architecture rtl of unidadFuncional is 
begin
	
end rtl;