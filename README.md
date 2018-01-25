# Stat-Array
This repo contains MATLAB Code for optimizing Stat Array v1.1  for 5e DND character stats.

The Array can be found at https://drive.google.com/open?id=1zXDdAmKhxDGl3x-zHvycHX9udPv2UxOi9bHPxXUs5tY

INSTRUCTIONS FOR USING THE ARRAY

Step 1: A player rolls two six sided dice at the same time and records the sum. 
	
	Example: A player rolls 2d6 and one die rolls a 2 and the other a 1. The Array die roll is the sum, so 2+1=3.

Step 2: Repeat step 1 six times so that the player has a roll for each stat. 

	Example: Player 1 rolls 2d6 6 times and gets the following dice rolls {3, 7, 8 , 11, 6, 8}.

If a player rolls a "2" then they will need to roll a 20 sided dice and record that number with the corrisponding "2." 
	
	Example: Player 2 rolls 2 on one of their 2d6 and then rolls a d20 and gets a 16 so their die roll is 2(16).

Step 3: For each sum a player chooses a column in the array to assign that sum to. 

	Example: "I want to use the 11 I rolled on my 2d6 in Column G for a  17 as my starting stat score."

Step 4: A player uses each of the sums they rolled in a different column until they have used every column(B, C, D, E, F, and G) exactly one time. The player can choose where they want to use each sum. 
	
	Example: (using the rolls in the example in step 2) "My stats are 16 [using an 8 in column G], 16 [using the 11 in Column F], 13 [using the 6 in Column E], 10 [using the 3 in Column D], 11 [using the 8 in Column C], and 8 [using the 7 in Column B], for a total of 74 when you add up all my scores"

If a player has a two they can use it in any column but they can still only have one stat from each column. 
	
	Example: Player 2 might say the following if their rolls were {4, 8, 2(16), 11, 11, 9} "using a 2(16) I can get a 14 for my stat in Column E so I'm going to use it there and use this extra 11 I rolled in D so that my stats are 16[from 8], 16[11], 14[2(16)], 13[11], 9[4], and 9[9] for a total of 77. Wow, I got lucky with that d20 on my 2 and it actually helped my stats out." 
	Player 2 could also assign their scores 17[11], 16[11], 12[4], 12[8], 11[2(16)], 9[9]. Which would also net them a total of 77.


The blue space in the blue and yellow section below the Array can be edited by typing die rolls in column A to reference and then using the dropdowns in columns B through G to play with where to put those die rolls



The optimizer only works with up to one rolled 2 in a set of 6 rolls of the 2d6. It will not display your stats but it will sort them into a variable called statssorted which can be explored to see options of how to assign your dice rolls.
