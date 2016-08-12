dosiernomo("1", unua).
dosiernomo("2", dua).

valoro(Id, _, Nomo, Valoro) :-
	atributo(Id, Nomo, Valoro).

valoro(Id, Lingvo, Nomo, Valoro) :-
	traduko(Id, Lingvo, Nomo, Valoro).

valoro(Id, Lingvo, Nomo, Valoro) :-
	fonta_teksto(Id, Lingvo, Ero, Vojo),
	dosiernomo(Ero, Nomo),
	=(Vojo, Valoro). % FARENDA (TODO)

generu_dikton(Id, Lingvo, Dikto) :-
	findall(Nomo-Valoro, valoro(Id, Lingvo, Nomo, Valoro), Paroj),
	dict_pairs(Dikto, pagho, Paroj).

radiko(Id) :-
	patro(Id, _),
	\+ patro(_, Id), !.

vojo(Id, _, X, X) :-
	radiko(Id).

vojo(Id, Lingvo, X, Y) :-
	valoro(Id, Lingvo, slugo, Slugo),
	patro(Patro, Id),
	vojo(Patro, Lingvo, X, [Slugo | Y]).
