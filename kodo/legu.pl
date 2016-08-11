:- use_module(library(http/json)).

:- dynamic lega_hoko/2.

legu_json(Vojo, Dikto) :-
	setup_call_cleanup(
		open(Vojo, read, Fluo, [encoding(utf8)]),
		json_read_dict(Fluo, Dikto),
		close(Fluo)).

metu_tradukojn(Vojo, Dikto) :-
	assert(traduko(Vojo, Lingvo, Atributo, Dikto.Lingvo.Atributo)), fail.

metu_atributon(Vojo, tradukoj, Dikto) :- !,
	metu_tradukojn(Vojo, Dikto), fail.

metu_atributon(Vojo, Atributo, Valoro) :-
	assert(atributo(Vojo, Atributo, Valoro)), fail.

metu_atributojn(Vojo, Dikto) :-
	metu_atributon(Vojo, Atributo, Dikto.Atributo); true.

metu_tekstojn(_).

legu_paghon(Vojo) :-
	string_concat(Vojo, "/meta.json", Meta),
	legu_json(Meta, Dikto),
	metu_atributojn(Vojo, Dikto),
	metu_tekstojn(Vojo),
	(lega_hoko(Vojo, Dikto); true).
