library IEEE;
use IEEE.STD_LOGIC_1164.all;

package three_modules_pack is


  component Mux1 is
    Port ( data1 : in  STD_LOGIC;
           data2 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           Mux_out : out  STD_LOGIC);
  end component;

  component full_adder is 
  Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           carry_in : in  STD_LOGIC;
           carry_out : out  STD_LOGIC;
           result : out  STD_LOGIC);
	end component;		  
	
	component Mux2 is
       Port ( 
            A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
			  A3 : in  std_logic;

           sel : in  STD_LOGIC_vector(1 downto 0);
           Mux2_out : out  STD_LOGIC);
   end component;
  
end three_modules_pack;

package body three_modules_pack is

end three_modules_pack;
