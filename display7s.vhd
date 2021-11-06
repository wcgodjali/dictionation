library IEEE;  
use IEEE.std_logic_1164.all;  
use IEEE.std_logic_arith.all;  
use IEEE.std_logic_unsigned.all;  
 
entity display7S is  
	port(
		state					: IN STD_LOGIC_VECTOR(1 downto 0);  
		s_input					: IN std_logic_vector(6 downto 0);  	-- input tahun  
		a_7S, b_7S, c_7S, d_7s	: OUT std_logic_vector(6 downto 0); 	-- display pada 7 segment
		LEDR 					: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); 	-- led input tahun
		LEDG 					: OUT STD_LOGIC;						-- led push button
		LEDA					: OUT STD_LOGIC						-- led stable state input		
 );  
end display7S;  
 
architecture display7S_arc of display7S is  
begin  
	process(state, s_input) 
	begin
	d_7s <= "1111111";  -- BCD-7-Segmen bagian d tidak digunakan
	case state is       -- display hasil operasi
		when "00"=>
			LEDG <='0';
			LEDR <="1111111";
			LEDA <='1';
			a_7S <="1001000"; -- H
			b_7s <="0001000"; -- A
			c_7s <="1001111"; -- I
		when "01" => 
			LEDG <='0';
			LEDR <="0000000";
			LEDA <='0';
			if s_input = "0001010" then --FIN
				a_7S <="0111000"; -- F
				b_7s <="1001111"; -- I
				c_7s <="0001001"; -- N
			elsif s_input = "0101000" then --ISL
				a_7S <="1001111"; -- I
				b_7s <="0100100"; -- S
				c_7s <="1110001"; -- L
			elsif s_input ="0111100" then --SLE
				a_7S <="0100100"; -- S
				b_7s <="1110001"; -- L
				c_7s <="0110000"; -- E
			else 
				LEDG <='0';
			LEDR <="1111111";
			LEDA <='1';
			a_7S <="1001000"; -- H
			b_7s <="0001000"; -- A
			c_7s <="1001111"; -- I
			end if;
		when "10"=>
			LEDG <='0';
			LEDR <="0000000";
			LEDA <='0';
			if s_input = "0001010" then --IRL
				a_7S <="1001111"; -- I
				b_7s <="1111010"; -- R
				c_7s <="1110001"; -- L
			elsif s_input = "0101000" then --INA
				a_7S <="1001111"; -- I
				b_7s <="0001001"; -- N
				c_7s <="0001000"; -- A
			elsif s_input ="0111100" then --NGA
				a_7S <="0001001"; -- N
				b_7s <="0100000"; -- G
				c_7s <="0001000"; -- A
			else 
				LEDG <='0';
			LEDR <="1111111";
			LEDA <='1';
			a_7S <="1001000"; -- H
			b_7s <="0001000"; -- A
			c_7s <="1001111"; -- I
			end if;
		when "11"=>
			LEDG <='1';
			LEDR <="0000000";
			LEDA <='1';
			if s_input = "0001010" then --POL
				a_7S <="0011000"; -- P
				b_7s <="0000001"; -- O
				c_7s <="1110001"; -- L
			elsif s_input = "0101000" then --INA
				a_7S <="1001111"; -- I
				b_7s <="0001001"; -- N
				c_7s <="0001000"; -- A
			elsif s_input ="0111100" then --GAB
				a_7S <="0100000"; -- G
				b_7s <="0001000"; -- A
				c_7s <="0000000"; -- B atau "1100000" -- b
				else 
				LEDG <='0';
			LEDR <="1111111";
			LEDA <='1';
			a_7S <="1001000"; -- H
			b_7s <="0001000"; -- A
			c_7s <="1001111"; -- I
			end if;
			
	--switch used: 0-6 and 9
	--push button used: key[0]
			
	end case;
--	when "0001"=> a_7S <="1001111"; -- '1'  
--	when "0010"=> a_7S <="0010010"; -- '2'  
--	when "0011"=> a_7S <="0000110"; -- '3'  
--	when "0100"=> a_7S <="1001100"; -- '4'  
--	when "0101"=> a_7S <="0100100"; -- '5'  
--	when "0110"=> a_7S <="0100000"; -- '6'  
--	when "0111"=> a_7S <="0001111"; -- '7'  
--	when "1000"=> a_7S <="0000000"; -- '8'  
--	when "1001"=> a_7S <="0000100"; -- '9'  
--	when others=> a_7S <="1111111"; OFF 
--	end case;  
 
--b_7S <= "1110110"; -- display karakter "="  
--c_7S <= "1111010"; -- display karakter "r"  
 
--	case sel is              -- display pilihan selektor  
--	when "00"=> d_7S <="0000001"; -- '0'  
--	when "01"=> d_7S <="1001111"; -- '1'  
--	when "10"=> d_7S <="0010010"; -- '2' 
--	when "11"=> d_7S <="0000110"; -- '3'  
--	end case;  
	end process;  
end display7S_arc; 
