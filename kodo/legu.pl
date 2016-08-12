:- use_module(library(http/json)).

:- dynamic lega_hoko/2.

legu_json(Vojo, Dikto) :-
	setup_call_cleanup(
		open(Vojo, read, Fluo, [encoding(utf8)]),
		json_read_dict(Fluo, Dikto),
		close(Fluo)).

metu_tradukojn(Vojo, Dikto) :-
	Traduko = Dikto.Lingvo,
	assert(lingvo(Vojo, Lingvo)),
	assert(traduko(Vojo, Lingvo, Atributo, Traduko.Atributo)), fail.

metu_atributon(Vojo, tradukoj, Dikto) :- !,
	metu_tradukojn(Vojo, Dikto), fail.
metu_atributon(Vojo, Atributo, Valoro) :-
	assert(atributo(Vojo, Atributo, Valoro)), fail.
metu_atributojn(Vojo, Dikto) :-
	metu_atributon(Vojo, Atributo, Dikto.Atributo); true.

aldonu_tekston(Vojo) :-
	file_directory_name(Vojo, Dosieraro),
	file_base_name(Vojo, Nomo),
	split_string(Nomo, "-_.", "", [Lingvcheno, Ero, "mmd"]),
	atom_string(Lingvo, Lingvcheno),
	assert(fonta_teksto(Dosieraro, Lingvo, Ero, Vojo)).

metu_tekstojn(Vojo) :-
	string_concat(Vojo, "/*.mmd", Vojo2),
	expand_file_name(Vojo2, Listo),
	maplist(aldonu_tekston, Listo).

legu_paghon(Vojo) :-
	string_concat(Vojo, "/meta.json", Meta),
	legu_json(Meta, Dikto),
	assert(pagho(Vojo)),
	metu_atributojn(Vojo, Dikto),
	metu_tekstojn(Vojo),
	(lega_hoko(Vojo, Dikto); true).

legu_dosieron(Patro, Vojo) :-
	legu_dosieron(Vojo),
	assert(patro(Patro, Vojo)).

legu_dosieron(Vojo) :-
	legu_paghon(Vojo),
	string_concat(Vojo, "/*", Vojo2),
	expand_file_name(Vojo2, Dosieroj),
	include(exists_directory, Dosieroj, Dosieraroj),
	maplist(legu_dosieron(Vojo), Dosieraroj).
