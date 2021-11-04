library ieee;
use ieee.std_logic_1164.all;

package componentes is 

	component multiplexor --mux
	port
	(
		s: in std_logic_vector(1 downto 0);
		a,b,c,d: in std_logic_vector(3 downto 0);
		y:out std_logic_vector(3 downto 0)
	);
	end component;
	--break
	component generador--generador
	
	generic
    (
        nBits: integer:= 30 -- Cantidad de bits para el contador
    );
    port
    (
        -- Entradas
        clk: in std_logic;
        rst: in std_logic;
        -- Salidas
        cod: out std_logic_vector(1 downto 0)
    );
	end component;
	--break
	
	component bcd7--bcd
	
	port(
		ent: in std_logic_vector( 3 downto 0);
		sal: out std_logic_vector (6 downto 0)
		);
		
	end component;
	--break
	component deco24--dec2a4
	port
(
	a: in std_logic_vector(1 downto 0);
	b,c,d,e: out std_logic
	
);
	end component;
	--break
	component circuitoAritmetico
	port
	(
	--entradas
	cin: in std_logic;
	A,B: in std_logic_vector(15 downto 0);
	s: in std_logic_vector(1 downto 0);
	--salidas
	cout: out std_logic;
	g: out std_logic_vector(15 downto 0)
	
	
	);
	end component;
	--break
end componentes;