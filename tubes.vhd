LIBRARY  IEEE; 
USE  IEEE.STD_LOGIC_1164.ALL; 
USE  IEEE.STD_LOGIC_ARITH.ALL; 
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tubes  IS 
	PORT( 
	    CLOCK_50   				: IN STD_LOGIC;
	    S_INPUT    				: IN STD_LOGIC_VECTOR( 6 DOWNTO 0 );	-- Input Tahun
	    PB						: IN STD_LOGIC; 						-- Repeat button
	    s_stable				: IN STD_LOGIC;
	    VGA_R      				: OUT STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	    VGA_G   		  		: OUT STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	    VGA_B     		 		: OUT STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	    VGA_HS		     		: OUT STD_LOGIC;
	    VGA_VS     				: OUT STD_LOGIC;
	    VGA_CLK    				: OUT STD_LOGIC;
	    VGA_BLANK 		 		: OUT STD_LOGIC;
	    GPIO_0     				: OUT STD_LOGIC_VECTOR( 35 DOWNTO 0 );
	    LEDR       				: OUT STD_LOGIC_VECTOR( 6 DOWNTO 0 );	-- LED Input Tahun
	    LEDG 					: OUT STD_LOGIC;						-- LED Repeat Button
		LEDA					: OUT STD_LOGIC;						-- LED Stable State
	    a_7S, b_7S, c_7S, d_7s	: OUT STD_LOGIC_VECTOR( 6 DOWNTO 0));
	    
END tubes; 

ARCHITECTURE behavioral OF tubes  IS 
   
SIGNAL  reset 			: STD_LOGIC;
SIGNAL 	state_binary 	: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL  o_clock			: STD_LOGIC;     
                     
COMPONENT state_trans  IS 
	PORT(
	    clock 			: IN STD_LOGIC; -- Input clock
	    reset			: IN STD_LOGIC; -- FSM's reset
	    PB				: IN STD_LOGIC; -- Repeat button
	    s_input 		: IN STD_LOGIC_VECTOR(6 downto 0); -- Input tahun switch
	    s_stable		: IN STD_LOGIC; -- Input untuk balik ke stable 
	    state_binary	: OUT STD_LOGIC_VECTOR(1 downto 0));
END COMPONENT; 

COMPONENT display_vhd  IS 
	PORT( 
	    i_clk           : IN STD_LOGIC;
	    STATE 			: IN STD_LOGIC_VECTOR ( 1 DOWNTO 0 );
	    S_INPUT			: IN STD_LOGIC_VECTOR ( 6 DOWNTO 0 );                                 
	    VGA_R           : OUT STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	    VGA_G           : OUT STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	    VGA_B           : OUT STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	    VGA_HS          : OUT STD_LOGIC;
	    VGA_VS          : OUT STD_LOGIC;
	    VGA_CLK         : OUT STD_LOGIC;
	    VGA_BLANK       : OUT STD_LOGIC);
END COMPONENT; 

COMPONENT display7s IS
	PORT(
		state					: IN STD_LOGIC_VECTOR(1 downto 0);  
		s_input					: IN STD_LOGIC_VECTOR(6 downto 0); 
		a_7S, b_7S, c_7S,d_7s	: OUT STD_LOGIC_VECTOR(6 downto 0);
		LEDR					: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDG 					: OUT STD_LOGIC;						
		LEDA					: OUT STD_LOGIC
		);
END COMPONENT;

COMPONENT CLOCKDIV IS
	PORT( 
		CLK		: IN STD_LOGIC;
		DIVOUT	: buffer STD_LOGIC);
END COMPONENT;

BEGIN 

CLOCK1 : CLOCKDIV
	PORT MAP (
	CLK 	=> CLOCK_50,
	DIVOUT 	=> o_clock);

state_transition : state_trans
	PORT MAP (
	clock 			=> o_clock,  	-- Input clock
	reset			=> reset, 		-- FSM's reset
	PB				=> PB, 			-- Repeat button
	s_input 		=> S_INPUT,		-- Input tahun switch
	s_stable		=> s_stable,		-- Input untuk balik ke stable 
	state_binary	=> state_binary
);

module_vga : display_vhd 
   PORT MAP (
   i_clk                =>  CLOCK_50, 
   STATE 				=>  state_binary,
   S_INPUT			 	=>	s_input,
   VGA_R                =>  VGA_R,  
   VGA_G                =>  VGA_G,  
   VGA_B                =>  VGA_B,
   VGA_HS               =>  VGA_HS,  
   VGA_VS               =>  VGA_VS,
   VGA_CLK              =>  VGA_CLK,
   VGA_BLANK            =>  VGA_BLANK
);

display_7s : display7s
	PORT MAP(
	state 	=> state_binary,
	s_input => s_input,
	a_7s 	=> a_7s,
	b_7s 	=> b_7s,
	c_7s 	=> c_7s,
	d_7s	=> d_7s,
	LEDR	=> LEDR,
	LEDG 	=> LEDG,
	LEDA	=> LEDA
);

END behavioral; 
