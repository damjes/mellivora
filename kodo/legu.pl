:- use_module(library(http/json)).

legu_json(Vojo, Dikto) :-
	setup_call_cleanup(
		open(Vojo, read, Fluo, [encoding(utf8)]),
		json_read_dict(Fluo, Dikto),
		close(Fluo)).

metu_tradukojn(ID, Dikto) :-
	Traduko = Dikto.Lingvo,
	assert(lingvo(ID, Lingvo)),
	assert(traduko(ID, Lingvo, Atributo, Traduko.Atributo)), fail.

metu_atributon(ID, tradukoj, Dikto) :- !,
	metu_tradukojn(ID, Dikto), fail.
metu_atributon(ID, Atributo, Valoro) :-
	assert(atributo(ID, Atributo, Valoro)), fail.

metu_atributojn(ID, Dikto) :-
	metu_atributon(ID, Atributo, Dikto.Atributo); true.

aldonu_tekston(ID, Vojo) :-
	file_base_name(Vojo, Nomo),
	split_string(Nomo, "-_.", "", [Lingvcheno, Ero, "mmd"]),
	atom_string(Lingvo, Lingvcheno),
	assert(fonta_teksto(ID, Lingvo, Ero, Vojo)).

metu_tekstojn(ID, Vojo) :-
	string_concat(Vojo, "/*.mmd", Vojo2),
	expand_file_name(Vojo2, Listo),
	maplist(aldonu_tekston(ID), Listo).

legu_paghon(Vojo, ID) :-
	string_concat(Vojo, "/meta.json", Meta),
	legu_json(Meta, Dikto),
	ID = vojo(Vojo),
	assert(pagho(ID)),
	metu_atributojn(ID, Dikto),
	metu_tekstojn(ID, Vojo),
	(lega_hoko(ID, Vojo, Dikto), fail; true).

legu_dosieron_kun_patro(Patro, Vojo) :-
	legu_dosieron(Vojo, ID),
	assert(patro(Patro, ID)).

legu_dosieron(Vojo, ID) :-
	legu_paghon(Vojo, ID),
	string_concat(Vojo, "/*", Vojo2),
	expand_file_name(Vojo2, Dosieroj),
	include(exists_directory, Dosieroj, Dosieraroj),
	maplist(legu_dosieron_kun_patro(ID), Dosieraroj).
