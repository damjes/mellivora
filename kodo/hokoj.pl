:- dynamic marko/2.

lega_hoko(ID, _, Dikto) :-
	member(Marko, Dikto.get(markoj)),
	assert(marko(ID, Marko)).
