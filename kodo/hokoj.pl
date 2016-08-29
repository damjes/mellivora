:- dynamic marko/2.

lega_hoko(Vojo, Dikto) :-
	member(Marko, Dikto.get(markoj)),
	assert(marko(Vojo, Marko)).
