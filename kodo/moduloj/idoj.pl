pliposta(IdA, IdB) :-
	atributo(IdA, dato, DatoA),
	atributo(IdB, dato, DatoB),
	DatoA @> DatoB.

aligu_2([], X, X).
aligu_2([X|Xoj], [], [X|Xoj]).
aligu_2([X|Xoj], [Y|Yoj], [Z|Zoj]) :-
	(
			pliposta(X, Y)
		*->
			X=Z,
			aligu_2(Xoj, [Y|Yoj], Zoj)
		;
			Y=Z,
			aligu_2([X|Xoj], Yoj, Zoj)
	).

praidoj_en_ordo(Id, Listo) :-
	findall(Ido, patro(Id, Ido), Idoj),
	% ni trovas idaron
	maplist(praidoj_en_ordo, Idoj, Praidaro),
	% praidaro havas listojn de nepoj, pranepoj, ...
	% unu listu po unu ido
	foldl(aligu_2, Praidaro, Idoj, Listo).
	% ni gluas idaron kun praidarojn

valoro(Id, _, praidaro, Listo) :-
	praidoj_en_ordo(Id, Listo).
