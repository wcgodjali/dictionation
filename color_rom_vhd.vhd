LIBRARY  IEEE; 
USE  IEEE.STD_LOGIC_1164.ALL; 
USE  IEEE.STD_LOGIC_ARITH.ALL; 
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY color_rom_vhd  IS 
	PORT(
		state 			: IN STD_LOGIC_VECTOR( 1 DOWNTO 0 ); -- State FSM
		s_input			: IN STD_LOGIC_VECTOR( 6 DOWNTO 0 ); -- Input Tahun
	    i_pixel_column  : IN STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	    i_pixel_row     : IN STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	    o_red           : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	    o_green         : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	    o_blue          : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 ));
END color_rom_vhd; 

ARCHITECTURE behavioral OF color_rom_vhd  IS 

SIGNAL BLUE_FIN                 	: STD_LOGIC; 
SIGNAL GRN_IRL, ORG_IRL         	: STD_LOGIC; 
SIGNAL RED_POL              		: STD_LOGIC; 
SIGNAL RED_INA                  	: STD_LOGIC;
SIGNAL RED_ISL, BLUE_ISL			: STD_LOGIC;
SIGNAL GRN_SLE, BLUE_SLE			: STD_LOGIC;
SIGNAL GRN_NGA 						: STD_LOGIC;
SIGNAL GRN_GAB, YLW_GAB, BLUE_GAB	: STD_LOGIC;
SIGNAL WHITE						: STD_LOGIC;
              		 			

BEGIN 

PROCESS(i_pixel_row,i_pixel_column) -- PIXEL COLORING
BEGIN
	case state is       -- display hasil operasi
		when "00"=>
				--D
				IF (((i_pixel_row >=110 AND i_pixel_row < 160) AND (i_pixel_column >= 100 AND i_pixel_column < 110)) OR
					(((i_pixel_row >= 110 AND i_pixel_row < 120) OR (i_pixel_row >= 150 AND i_pixel_row < 160)) AND (i_pixel_column >= 110 AND i_pixel_column < 130)) OR
					((i_pixel_row >= 120 AND i_pixel_row < 150) AND (i_pixel_column >= 130 AND i_pixel_column < 140))) THEN
					 o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--I
				ELSIF ((i_pixel_row >= 110 AND i_pixel_row < 160) AND (i_pixel_column >= 190 AND i_pixel_column < 200)) THEN
						o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--C
				ELSIF (((i_pixel_row >= 120 AND i_pixel_row < 150) AND (i_pixel_column >= 260 AND i_pixel_column < 270)) OR
					(((i_pixel_row >= 110 AND i_pixel_row < 120) OR (i_pixel_row >= 150 AND i_pixel_row < 160)) AND (i_pixel_column >= 270 AND i_pixel_column < 300))) THEN
						o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--T
				ELSIF (((i_pixel_row >= 190 AND i_pixel_row < 230) AND (i_pixel_column >= 190 AND i_pixel_column < 200)) OR
					((i_pixel_row >= 180 AND i_pixel_row < 190) AND (i_pixel_column >= 180 AND i_pixel_column < 210))) THEN
						o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--I
				ELSIF ((i_pixel_row >= 180 AND i_pixel_row < 230) AND (i_pixel_column >= 270 AND i_pixel_column < 280)) THEN
						o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--O
				ELSIF (((i_pixel_row >= 190 AND i_pixel_row < 220) AND (i_pixel_column >= 340 AND i_pixel_column < 350)) OR
					(((i_pixel_row >= 180 AND i_pixel_row < 190) OR (i_pixel_row >= 220 AND i_pixel_row < 230)) AND 
					(i_pixel_column >= 350 AND i_pixel_column < 370)) OR ((i_pixel_row >= 190 AND i_pixel_row < 220) 
					AND (i_pixel_column >= 370 AND i_pixel_column < 380))) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--N
				ELSIF (((i_pixel_row >= 250 AND i_pixel_row < 300) AND ((i_pixel_column >= 260 AND i_pixel_column < 270) 
					OR (i_pixel_column >= 290 AND i_pixel_column < 300))) OR ((i_pixel_row >= 260 AND i_pixel_row < 270) 
					AND (i_pixel_column >= 270 AND i_pixel_column < 280)) OR ((i_pixel_row >= 270 AND i_pixel_row < 280) AND 
					(i_pixel_column >= 280 AND i_pixel_column < 290))) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--A
				ELSIF (((i_pixel_row >= 260 AND i_pixel_row < 300) AND (i_pixel_column >= 340 AND i_pixel_column < 350)) OR
					(((i_pixel_row >= 250 AND i_pixel_row < 260) OR (i_pixel_row >= 270 AND i_pixel_row < 280)) AND 
					(i_pixel_column >= 350 AND i_pixel_column < 370)) OR ((i_pixel_row >= 260 AND i_pixel_row < 300) 
					AND (i_pixel_column >= 370 AND i_pixel_column < 380))) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--T
				ELSIF (((i_pixel_row >= 260 AND i_pixel_row < 300) AND (i_pixel_column >= 430 AND i_pixel_column < 440)) OR
					((i_pixel_row >= 250 AND i_pixel_row < 260) AND (i_pixel_column >= 420 AND i_pixel_column < 450))) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--I
				ELSIF ((i_pixel_row >= 320 AND i_pixel_row < 370) AND (i_pixel_column >= 350 AND i_pixel_column < 360)) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--O
				ELSIF (((i_pixel_row >= 330 AND i_pixel_row < 360) AND (i_pixel_column >= 420 AND i_pixel_column < 430)) OR
					(((i_pixel_row >= 320 AND i_pixel_row < 330) OR (i_pixel_row >= 360 AND i_pixel_row < 370)) AND 
					(i_pixel_column >= 430 AND i_pixel_column < 450)) OR ((i_pixel_row >= 330 AND i_pixel_row < 360) AND 
					(i_pixel_column >= 450 AND i_pixel_column < 460))) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				--N
				ELSIF (((i_pixel_row >= 320 AND i_pixel_row < 370) AND ((i_pixel_column >= 500 AND i_pixel_column < 510) OR 
					(i_pixel_column >= 530 AND i_pixel_column < 540))) OR ((i_pixel_row >= 330 AND i_pixel_row < 340) AND 
					(i_pixel_column >= 510 AND i_pixel_column < 520)) OR ((i_pixel_row >= 340 AND i_pixel_row < 350) AND 
					 (i_pixel_column >= 520 AND i_pixel_column < 530))) THEN
					o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				-- stripe 1
				ELSIF (i_pixel_row >= 130 AND i_pixel_row < 140) AND ((i_pixel_column < 80) OR (i_pixel_column > 320)) THEN
					 o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";

				-- stripe 2
				ELSIF (i_pixel_row >= 200 AND i_pixel_row < 210) AND ((i_pixel_column < 160) OR (i_pixel_column > 400))  THEN
					 o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				-- stripe 3
				ELSIF (i_pixel_row >= 270 AND i_pixel_row < 280) AND ((i_pixel_column < 240) OR (i_pixel_column > 480))  THEN
					 o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				-- stripe 4
				ELSIF (i_pixel_row >= 340 AND i_pixel_row < 350) AND ((i_pixel_column < 320) OR (i_pixel_column > 560))  THEN
					 o_red <= X"00"; o_green <= X"00"; o_blue <= X"00";
				ELSE o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				END IF;
		when "01" =>
			if s_input = "0001010" then --FIN
				IF ((i_pixel_row > 0)  AND (i_pixel_row < 175)) AND ((i_pixel_column > 178 )  AND (i_pixel_column < 285)) THEN
					o_red <= X"00"; o_green <= X"33"; o_blue <= X"88";
				ELSIF ((i_pixel_row >=175) AND (i_pixel_row < 305)) THEN
					o_red <= X"00"; o_green <= X"33"; o_blue <= X"88";
				ELSIF (i_pixel_row >= 305) AND ((i_pixel_column > 178)  AND (i_pixel_column < 285)) THEN
					o_red <= X"00"; o_green <= X"33"; o_blue <= X"88";
				ELSE 
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				END IF;
			elsif s_input = "0101000" then --ISL
				IF ((i_pixel_row > 0)  AND (i_pixel_row < 186)) AND ((i_pixel_column > 178) AND (i_pixel_column < 204)) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF ((i_pixel_row > 0)  AND (i_pixel_row < 186)) AND ((i_pixel_column >= 204) AND (i_pixel_column < 256)) THEN
					o_red <= X"DD"; o_green <= X"11"; o_blue <= X"33";
				ELSIF ((i_pixel_row > 0)  AND (i_pixel_row < 186)) AND ((i_pixel_column >= 256) AND (i_pixel_column < 281)) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF (i_pixel_row >= 186)  AND (i_pixel_row < 213) AND ((i_pixel_column > 0) AND (i_pixel_column < 204)) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF (i_pixel_row >= 186)  AND (i_pixel_row < 213) AND (i_pixel_column >= 204) AND (i_pixel_column < 256) THEN
					o_red <= X"DD"; o_green <= X"11"; o_blue <= X"33";
				ELSIF (i_pixel_row >= 186)  AND (i_pixel_row < 213) AND (i_pixel_column >= 256) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF (i_pixel_row >= 213)  AND (i_pixel_row < 267) THEN
					o_red <= X"DD"; o_green <= X"11"; o_blue <= X"33";
				ELSIF (i_pixel_row >= 267)  AND (i_pixel_row < 294) AND (i_pixel_column > 0) AND (i_pixel_column < 204) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF (i_pixel_row >= 267)  AND (i_pixel_row < 294) AND (i_pixel_column >= 204) AND (i_pixel_column < 256) THEN
					o_red <= X"DD"; o_green <= X"11"; o_blue <= X"33";
				ELSIF (i_pixel_row >= 267)  AND (i_pixel_row < 294) AND (i_pixel_column >= 256) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF (i_pixel_row >= 294) AND (i_pixel_column > 178) AND (i_pixel_column < 204) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSIF (i_pixel_row >= 294) AND (i_pixel_column >= 204) AND (i_pixel_column < 256) THEN
					o_red <= X"DD"; o_green <= X"11"; o_blue <= X"33";
				ELSIF (i_pixel_row >= 294) AND (i_pixel_column >= 256) AND (i_pixel_column < 281) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSE
					o_red <= X"00"; o_green <= X"33"; o_blue <= X"99";
				END IF;
			elsif s_input ="0111100" then --SLE
				IF ((i_pixel_row > 0)  AND (i_pixel_row < 160)) THEN
					o_red <= X"11"; o_green <= X"BB"; o_blue <= X"33";
				ELSIF ((i_pixel_row >= 160)  AND (i_pixel_row < 320 )) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSE 
					o_red <= X"00"; o_green <= X"99"; o_blue <= X"cc";
				END IF;
			ELSE
				o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
			END IF;
		when "10"=>
			if s_input = "0001010" then --IRL
				IF ((i_pixel_column > 0)  AND (i_pixel_column <= 212)) THEN
					o_red <= X"11"; o_green <= X"99"; o_blue <= X"66";
				ELSIF ((i_pixel_column > 212)  AND (i_pixel_column <= 427 )) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSE 
					o_red <= X"FF"; o_green <= X"88"; o_blue <= X"33";
				END IF;
			elsif s_input = "0101000" then --INA
				IF (i_pixel_row < 239) THEN
					o_red <= X"FF"; o_green <= X"00"; o_blue <= X"00";
				ELSE 
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				END IF;
			elsif s_input ="0111100" then --NGA
				IF (i_pixel_row >= 0 AND i_pixel_row < 480) AND ((i_pixel_column > 212)  AND (i_pixel_column < 427)) THEN
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				ELSE 
					o_red <= X"00"; o_green <= X"88"; o_blue <= X"55";
				END IF;
				ELSE
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
			end if;
		when "11"=>
			if s_input = "0001010" then --POL
				IF i_pixel_row > 239 THEN
					o_red <= X"ee"; o_green <= X"11"; o_blue <= X"11";
				ELSE
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				END IF;
			elsif s_input = "0101000" then --INA
				IF (i_pixel_row < 239) THEN
					o_red <= X"FF"; o_green <= X"00"; o_blue <= X"00";
				ELSE 
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
				END IF;
			elsif s_input ="0111100" then --GAB
				IF ((i_pixel_row > 0)  AND (i_pixel_row < 160)) THEN
					o_red <= X"00"; o_green <= X"99"; o_blue <= X"66";
				ELSIF ((i_pixel_row >= 160)  AND (i_pixel_row < 320 )) THEN
					o_red <= X"ff"; o_green <= X"Dd"; o_blue <= X"11";
				ELSE 
					o_red <= X"00"; o_green <= X"77"; o_blue <= X"ff";
				END IF;
				ELSE
					o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
			end if;
	
		END CASE;

-- COLOR ASSIGNMENTS
--IF    (BLUE_FIN = '1') 	THEN o_red <= X"00"; o_green <= X"35"; o_blue <= X"80";
--ELSIF (GRN_IRL = '1') 	THEN o_red <= X"00"; o_green <= X"73"; o_blue <= X"39";
--ELSIF (ORG_IRL = '1') 	THEN o_red <= X"E7"; o_green <= X"63"; o_blue <= X"00";
--ELSIF (RED_POL = '1') 	THEN o_red <= X"DC"; o_green <= X"14"; o_blue <= X"3C";
--ELSIF (RED_INA = '1') 	THEN o_red <= X"C8"; o_green <= X"FF"; o_blue <= X"2E";
--ELSIF (RED_ISL = '1') 	THEN o_red <= X"D7"; o_green <= X"28"; o_blue <= X"28";
--ELSIF (BLUE_ISL = '1') 	THEN o_red <= X"00"; o_green <= X"38"; o_blue <= X"97";
--ELSIF (GRN_SLE = '1') 	THEN o_red <= X"01"; o_green <= X"CC"; o_blue <= X"00";
--ELSIF (BLUE_SLE = '1')	THEN o_red <= X"00"; o_green <= X"00"; o_blue <= X"D0";
--ELSIF (GRN_NGA = '1') 	THEN o_red <= X"19"; o_green <= X"84"; o_blue <= X"00";
--ELSIF (GRN_GAB = '1') 	THEN o_red <= X"00"; o_green <= X"80"; o_blue <= X"50";
--ELSIF (YLW_GAB = '1') 	THEN o_red <= X"EF"; o_green <= X"DA"; o_blue <= X"0A";
--ELSIF (BLUE_GAB = '1') 	THEN o_red <= X"09"; o_green <= X"00"; o_blue <= X"7B";
--ELSIF (WHITE = '1') 	THEN o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
--ELSE o_red <= X"FF"; o_green <= X"FF"; o_blue <= X"FF";
--END IF;
--END IF;
END PROCESS;


END behavioral; 
