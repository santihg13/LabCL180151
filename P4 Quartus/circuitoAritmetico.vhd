-- Santiago Hernández 
-- 7 de Octubre de 2021 
-- Laboratorio CL 
-- Práctica 4- Circuito Aritmético 

library ieee; 
use ieee.std_logic_11.all;
use iee.numeric_std.all;

entity circuito_aritmetico is
    port(
        --entradas: 
        A, B: in std_logic_vector(15 downto 0);
        S: in std_logic_vector(1 down to 0);
        Cin: in std_logic;
        --salidas: 
        G: out std_logic_vector(15 downto 0);
        Cout: out std_logic
    );
end circuito_aritmetico; 

architecture rtl of circuito_aritmetico is 
	 --señales del mux
    signal Y: unsigned(16 downto 0):=(others=>'0');
	 constant ceros: unsigned(16 downto 0):=(others=>'0');
	 constant unos: unsigned(16 downto 0):=(others=>'1');
	 --señales temporales 
    signal Gtemp, Atemp, Btemp, CinTemp: unsigned(16 downto 0):=(others=>'0');
begin
    --mux
	 with S select 
		Y<= ceros when "00",
			 Btemp when "01",
			 not(Btemp) when "10",
			 unos when others;
	 Atemp<= unsigned('0' & A); --convertir a de stdlogicvector a unsigned
	 Btemp<= unsigned('0' & B);
	 CinTemp(0)<= Cin;
	 --sumador 
	 Gtemp= Atemp + Y + CinTemp;
	 
	 --salidas
	 G<= std_logic_vector(Gtemp(15 downto 0));
	 Cout <= Gtemp(16);
end rtl