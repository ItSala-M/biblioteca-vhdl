----------------------------------------------------------------------------------
-- Compa��a:            Estado Finito
-- Ingeniero:           Carlos Ramos
-- 
-- Fecha de creaci�n:   2014/04/13 08:27:57
-- Nombre del m�dulo:   clk0_25Hz - Behavioral 
-- Comentarios adicionales: 
--   Implementaci�n mediante aproximaci�n, a caso con escala ajustada par (de 200000000 a 200000000).
--   La frecuencia fue ajustada al entero m�s pr�ximo.
----------------------------------------------------------------------------------
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clk0_25Hz is
    Port (
        clk     : in  STD_LOGIC; -- Reloj de entrada de 50000000Hz.
        reset   : in  STD_LOGIC;
        clk_out : out STD_LOGIC  -- Reloj de salida de 0.25Hz.
    );
end clk0_25Hz;
 
architecture Behavioral of clk0_25Hz is
    signal temporal: STD_LOGIC;
    signal contador: integer range 0 to 99999999 := 0;
begin
    divisor_frecuencia: process (clk, reset) begin
        if (reset = '1') then
            temporal <= '0';
            contador <= 0;
        elsif rising_edge(clk) then
            if (contador = 99999999) then
                temporal <= NOT(temporal);
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;
 
    clk_out <= temporal;
end Behavioral;