library ieee;
use ieee.std_logic_1164.all;
use work.componentes.all;

entity practica4quartus is
port
(
--entradas
	clk,rst: in std_logic;
	Cin: in std_logic;
	DIP1,DIP2,DIP3,DIP4:in std_logic_vector(3 downto 0);
	Oper: in std_logic_vector(1 downto 0);
	--salidas
	Cout:out std_logic;
	SSEG_CM: out std_logic_vector(3 downto 0);
	SSEG_SC: out std_logic_vector(6 downto 0)
	
);

end practica4quartus;

architecture art of practica4quartus is
--señales emporales para el generador
constant nBits: integer:=10;
signal cod2bits:std_logic_vector(1 downto 0):=(others=>'0');
--señales para el mux
signal a,b,c,d: std_logic_vector(3 downto 0):=(others=>'0');
signal cod4bits: std_logic_vector(3 downto 0):=(others=>'0');
--señales para el circuito aritmetic
signal A2,B2,G2: std_logic_vector(15 downto 0):=(others=>'0');
begin
gen:Generador
	generic map(nBits =>nBits)
	port map(clk=>clk,rst=>rst,cod=>cod2bits);

	
mux2: multiplexor
	port map(s=>cod2bits,a=>a,b=>b,c=>c,d=>d, y=>cod4bits);

dec:deco24
	port map(a=>cod2bits, f=>SSEG_CM(0), g=>SSEG_CM(1),h=>SSEG_CM(2),i=>SSEG_CM(3));
	
conv:bcd7
	port map(entrada=>cod4bits, salida=>SSEG_SC);
	
au: circuitoAritmetico
	port map(cin=>cin,A=>A2,B=>B2, s=>Oper,Cout=>Cout,g=>G2 );
	
	--señales internas
	a<=G2(15 downto 12);
	b<=G2(11 downto 8);
	c<=G2(7 downto 4);
	d<=G2(3 downto 0);
	
	A2(15 downto 8)<=(others=>'0');
	A2(7 downto 4)<=DIP1;
	A2(3 downto 0)<=DIP2;
	
	B2(15 downto 8)<=(others=>'0');
	B2(7 downto 4)<=DIP3;
	B2(3 downto 0)<=DIP4;
	
	
	end art;