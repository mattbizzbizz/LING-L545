all: spa.gen.hfst 

spa.lexc.hfst: spa.lexc
	        hfst-lexc spa.lexc -o spa.lexc.hfst
spa.twol.hfst: spa.twol
	        hfst-twolc spa.twol -o spa.twol.hfst
spa.gen.hfst: spa.lexc.hfst spa.twol.hfst
	        hfst-compose-intersect -1 spa.lexc.hfst -2 spa.twol.hfst -o spa.gen.hfst
