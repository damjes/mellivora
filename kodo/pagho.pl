radiko(Id) :-
	patro(Id, _),
	\+ patro(_, Id), !.

vojo(Id, _, _, X, X) :-
	radiko(Id).
vojo(Id, Lingvo, Trajto, X, Y) :-
	valoro(Id, Lingvo, Trajto, Valoro),
	patro(Patro, Id),
	vojo(Patro, Lingvo, Trajto, X, [Valoro | Y]).

gluu_vojon(Fino, Patro, Vojo) :-
	atom_string(Fino, FinCheno),
	string_concat(Patro, "/", Patro2),
	string_concat(Patro2, FinCheno, Vojo).

% ĉefa paĝo en ĉefa lingvo estas ĉefa
% eo estas fiksita ĉefa lingvo (TODO)
vojcheno(Id, eo, "/") :-
	radiko(Id), !.
vojcheno(Id, Lingvo, Vojcheno) :-
	atom_string(Lingvo, Lingvcheno),
	vojo(Id, Lingvo, slugo, Vojo, []),
	foldl(gluu_vojon, [Lingvcheno | Vojo], "", Vojcheno).

dosiernomo("1", unua).
dosiernomo("2", dua).

legu_mmd(Vojo, Cheno) :-
	process_create(path(multimarkdown), [file(Vojo)], [stdout(pipe(Fluo))]),
	read_stream_to_codes(Fluo, Kodoj),
	string_codes(Cheno, Kodoj).

implicita_valoro(_, _, markoj, []).

valoro(Id, Lingvo, vojo, Vojo) :-
	vojo(Id, Lingvo, id, Vojo, []).
valoro(Id, _, Nomo, Valoro) :-
	atributo(Id, Nomo, Valoro).
valoro(Id, Lingvo, Nomo, Valoro) :-
	traduko(Id, Lingvo, Nomo, Valoro).
valoro(Id, Lingvo, Nomo, Valoro) :-
	lingvo(Id, Lingvo),
	dosiernomo(Ero, Nomo),
	(
			fonta_teksto(Id, Lingvo, Ero, Vojo)
		*->
			legu_mmd(Vojo, Valoro)
		;
			Valoro = ""
	).
valoro(Id, Lingvo, Nomo, Valoro) :-
	implicita_valoro(Id, Lingvo, Nomo, Valoro),
	\+ atributo(Id, Nomo, _),
	\+ traduko(Id, Lingvo, Nomo, _).

generu_dikton(Id, Lingvo, Dikto) :-
	findall(Nomo-Valoro, valoro(Id, Lingvo, Nomo, Valoro), Paroj),
	dict_pairs(Dikto, pagho, Paroj).
