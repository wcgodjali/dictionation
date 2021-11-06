LIBRARY  IEEE; 
USE  IEEE.STD_LOGIC_1164.ALL; 
USE  IEEE.STD_LOGIC_ARITH.ALL; 
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY state_trans  IS 
	PORT(
	    clock 			: IN STD_LOGIC; -- Input clock
	    reset			: IN STD_LOGIC; -- FSM's reset
	    PB				: IN STD_LOGIC; -- Repeat button
	    s_input 		: IN STD_LOGIC_VECTOR(6 downto 0); -- Input tahun switch
	    s_stable		: IN STD_LOGIC; -- Input untuk balik ke stable 
	    state_binary	: OUT STD_LOGIC_VECTOR(1 downto 0)); -- Transformasi state ke binary
END state_trans; 

ARCHITECTURE behavioral OF state_trans  IS 
-- State and counter signal
type mystate is (A, B, C, D);
signal state: mystate;
signal count: STD_LOGIC_VECTOR(3 downto 0);
constant firstsec : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
constant secondsec : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";

BEGIN 

PROCESS(clock, reset, PB, s_input, s_stable)
BEGIN 
	IF reset = '1' THEN
		state <= A;
		count <= X"0";
	-- Analisis State
	ELSIF (CLOCK'EVENT AND CLOCK = '1') THEN
		CASE state is
			WHEN A =>
				IF s_stable = '1' THEN
					state <= A;
				ELSIF s_stable = '0' AND (s_input = "0111100" OR s_input = "0101000" OR s_input = "0001010") THEN
					state <= B;
					count <= X"0";
				ELSE
					state <= A;
				END IF; 
			WHEN B =>
				IF count < firstsec AND (s_input = "0111100" OR s_input = "0101000" OR s_input = "0001010") THEN
					state <= B;
					count <= count + 1;
				ELSIF count >= firstsec AND (s_input = "0111100" OR s_input = "0101000" OR s_input = "0001010") THEN
					state <= C;
					count <= X"0";
				ELSE
					state <= A;
					count <= X"0";
				END IF;
			WHEN C =>
				IF count < firstsec AND (s_input = "0111100" OR s_input = "0101000" OR s_input = "0001010") THEN
					state <= C;
					count <= count + 1;
				ELSIF count >= firstsec AND (s_input = "0111100" OR s_input = "0101000" OR s_input = "0001010") THEN
					state <= D;
					count <= X"0";
				ELSE
					state <= A;
					count <= X"0";
				END IF;
			WHEN D =>
				IF  (s_stable = '0')  AND (s_input = "0111100" OR s_input = "0101000" OR s_input = "0001010") AND (PB = '1') THEN
					state <= D;
					count <= X"0";
				ELSIF (PB = '0') AND (s_stable = '0') THEN
					state <= B;
					count <= X"0";
				ELSE
					state <= A;
					count <= X"0";
				END IF;
		END CASE;
	END IF;

CASE state IS 
	WHEN A =>
		state_binary <= "00";
	WHEN B =>
		state_binary <= "01";
	WHEN C =>
		state_binary <= "10";
	WHEN D =>
		state_binary <= "11";
END CASE;

-- Analisis Output
--IF (s_input = "00001010") THEN
--	CASE state IS
--		WHEN A =>
--		WHEN B =>
--		WHEN c =>
--		WHEN D =>
--	END CASE;
--ELSIF (s_input = "00101000" THEN
--	CASE state IS
--		WHEN A =>
--		WHEN B =>
--		WHEN c =>
--		WHEN D =>
--	END CASE;
--ELSIF (s_input = "00111100") THEN
--	CASE state IS
--		WHEN A =>
--		WHEN B =>
--		WHEN c =>
--		WHEN D =>
--	END CASE;
--ELSE
--END IF;
--IF (state <= A) THEN
--
--ELSIF (state <= B) AND (s_input = "00001010") THEN
--	
--ELSE 
--  IF ((i_pixel_row > R_TF_1)  AND (i_pixel_row < R_TF_2)  ) AND ((i_pixel_column > C_TF2_R)  AND (i_pixel_column < C_TF1_L)  ) 
--	THEN M_TF1 <=  '1';
--	ELSE  M_TF1 <=  '0';
--  END IF;
--
--  IF    (M_TF1 = '1') THEN  o_red <= X"FF"; o_green <= X"00"; o_blue <= X"00";
--  ELSE  o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
--  END IF;
  
-- Madagascar Flag

-- IF ((i_pixel_row > 0) AND (i_pixel_row < 239) AND (i_pixel_column > 212) AND (i_pixe;_column <639))
-- THEN ORANYE_MAD <= '1';
-- ELSIF ((i_pixel_row > 240) AND (i_pixel_row < 439) AND (i_pixel_column > 212) AND (i_pixe;_column <639))
-- THEN HIJAU_MAD <= '1';
-- ELSE WHITE <= '1';
  
END PROCESS;


END behavioral; 