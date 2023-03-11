# TemaMN
Vladu Denis-Marius
311CB
Tema de casa MN



Subiect 1: Nearest Neighbour

nn_2x2: 
	- definire x y
	- aflare nr puncte cu fct length
	- initializarea matricii cu fct zeros
	- parcurgerea matricii
	- apelarea fct round pentru a afla cel mai
apropiat pixel din imagine
	- calcularea pixelului din imaginea finala

nn_2x2_RGB:
	- initializarea canalelor celor 3 culori
	- extragerea canalelor fiecarei culori in
ordinea data folosind fct nn_2x2 pe acestea
	- initializarea matricii rezultat cu fct zeros
	- formarea imaginii finale culoare cu culoare
( nu am folosit functia cat din pacate )

nn_resize:
	- cast la double cu fct double ( evident )
	- initializarea matricii cu fct zeros
	- calcularea factorilor de scalare; am urmat
indicatiile comentariilor si am luat valorile precedente
( q-1 s.a.m.d )
	- definire matricea pentru redimensionare T ( o 
matrice 2x2 cu 0-uri pe diagonala secundara, iar pe cea
principala factorii de scalare calculati anterior)
	- calcularea inversei matricii T de mai sus
	- transformarea inversa: ec = U * [x;y];
si calculam x_p si y_p prin apelarea matricii ec 
coresp fiecarui numar, ec(1) respectiv ec(2)
	- trecerea variabilelor la valorile corespunzatoare
interpolarii ( +1 la fiecare )
	- calcularea vecinilor folosind fct round
	- calcularea pixelului din imaginea finala si
trecerea rezultatului la uint8

nn_resize_RGB:
	- initializarea canalelor celor 3 culori
	- extragerea canalelor fiecarei culori in
ordinea data folosind fct nn_resize pe acestea
	- formarea imaginii folosind fct cat


Subiect 2: Bilinear

bilinear_coef:
	- calculare matricea A
	- calculare vectorul b
	- calculare matricea a si cast double la ea

bilinear_2x2:
	- definire x y
	- aflare nr puncte cu fct length
	- calcularea coeficientilor de interpolare
biliniara folosind fct biliniar_coef
	- initializarea matricii cu fct zeros
	- parcurgerea matricii
	- ecuatia pentru a calcula valoarea pixelului
	- convertirea valorii pixelului la uint8

bilinear_2x2_RGB:
	- initializarea canalelor celor 3 culori
	- extragerea canalelor fiecarei culori in
ordinea data folosind fct bilinear_2x2 pe acestea
	- formarea imaginii folosind fct cat

surrounding_points:
	- calcularea punctelor folosind fct floor
(si +1 pentru x2 si y2)
	- ca sa ne asiguram ca y2 si x2 nu ies din
matrice, daca acestea isi depasesc limitele, 
reinitializam y1 si x1 respectiv cu 1	


bilinear_resize:
	- initializarea matricii cu fct zeros
	- cast la double cu fct double (iarasi)
	- calcularea factorilor de scalare; am urmat
indicatiile comentariilor si am luat valorile precedente
( q-1 s.a.m.d )
	- definire matricea pentru redimensionare T ( o 
matrice 2x2 cu 0-uri pe diagonala secundara, iar pe cea
principala factorii de scalare calculati anterior)
	- calcularea inversei matricii T de mai sus
	- transformarea inversa: ec = U * [x;y];
si calculam x_p si y_p prin apelarea matricii ec 
coresp fiecarui numar, ec(1) respectiv ec(2)
	- trecerea variabilelor la valorile corespunzatoare
interpolarii ( +1 la fiecare )
	- descoperirea punctelor inconjuratoare folosind
fct surrounding_points
	- calcularea coeficientilor de interpolare folosind
fct bilinear_coef
	- ecuatia ce calculeaza valoarea interpolata a 
pixelului, tinand cont de apelarea vectorului si de 
trecerea la coordinatele specifice
	- convertirea valorii pixelului la uint8

bilinear_resize_RGB:
	- initializarea canalelor celor 3 culori
	- extragerea canalelor fiecarei culori in
ordinea data folosind fct bilinear_resize pe acestea
	- formarea imaginii folosind fct cat
	
bilinear_rotate:
	- cast la double cu fct double (mai merge unu')
	- cos si sin de rotation_angle
	- initializarea matricii cu fct zeros
	- definire matricea pentru redimensionare T
	|c  s|
	|-s c|
	- calcularea inversei T cu functia inv pentru
ca nu mai pot trisa ca adineaori
	- transformarea inversa: ec = invers * [x;y];
si calculam x_p si y_p prin apelarea matricii ec 
coresp fiecarui numar, ec(1) respectiv ec(2)
	- trecerea variabilelor la valorile corespunzatoare
interpolarii ( +1 la fiecare )
	- conditia de continuitate la negru: treci de
margini, treci mai departe
	- descoperirea punctelor inconjuratoare folosind
fct surrounding_points
	- calcularea coeficientilor de interpolare folosind
fct bilinear_coef
	- efectiv aceeasi ecuatie de la bilinear_resize
ce calculeaza valoarea interpolata a pixelului
	- convertirea valorii pixelului la uint8

bilinear_rotate_RGB:
	- initializarea canalelor celor 3 culori
	- extragerea canalelor fiecarei culori in
ordinea data folosind fct bilinear_rotate pe acestea
	- formarea imaginii folosind fct cat

	

Subiect 3: Bicubic

fx:
	- derivata fata de x a lui f
fy:
	- derivata fata de y a lui f
fxy:
	- derivata fata de x si y a lui f

precalc_d:
	- calcularea dimensiunilor imaginii
	- cast la matricea I pt fiecare derivata
intai initializarea cu zeros si apoi cast cu double
	- calcularea matricei cu derivate fata de x Ix
folosind fct fx
	- calcularea matricei cu derivate fata de y Iy
folosind fct fy
	- calcularea matricei cu derivate fata de xy Ixy
folosind fct fxy

surrounding_points:
	- analog bilinear

bicubic_coef: 
	- calcularea si scrierea matricilor intermediare de
stanga (St), dreapta (Dr) si mijloc (Mid)
	- cast la double pentru fiecare matrice intermediara
	- inmultirea acestora pentru a obtine matricea finala

bicubic_resize:
	initializarea matricii cu fct zeros
	- cast la double cu fct double (ultima oara sper)
	- calcularea factorilor de scalare; am urmat
indicatiile comentariilor si am luat valorile precedente
( q-1 s.a.m.d )
	- definire matricea pentru redimensionare T ( o 
matrice 2x2 cu 0-uri pe diagonala secundara, iar pe cea
principala factorii de scalare calculati anterior)
	- calcularea inversei matricii T de mai sus
	- precalcularea derivatelor Ix, Iy si Ixy folosind
fct precalc_d
	- transformarea inversa si calcularea x_p si y_p 
corespunzator
	- trecerea variabilelor la valorile corespunzatoare
interpolarii ( +1 la fiecare )
	- descoperirea punctelor inconjuratoare folosind
fct surrounding_points
	- calcularea coeficientilor de interpolare folosind
fct bilinear_coef
	- trecerea coordoantelor in patratul unitate
	- ecuatia ce calculeaza valoarea interpolata a 
pixelului, tinand cont de apelarea vectorului si de 
trecerea la coordinatele specifice
	- convertirea valorii pixelului la uint8
	
bicubic_resize_RGB:
	- initializarea canalelor celor 3 culori
	- extragerea canalelor fiecarei culori in
ordinea data folosind fct bicubic_resize pe 
acestea
	- formarea imaginii folosind fct cat

