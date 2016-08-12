:- use_module(library(st/st_render)).

dosiernomo(Id, Lingvo, Dosiernomo) :-
	vojcheno(Id, Lingvo, Fino),
	string_concat("eligo/", Fino, Dosierarnomo),
	make_directory_path(Dosierarnomo),
	string_concat(Dosierarnomo, "/index.html", Dosiernomo).

generu_paghon(Id, Lingvo) :-
	generu_dikton(Id, Lingvo, Dikto),
	dosiernomo(Id, Lingvo, Dosiernomo), !,
	setup_call_cleanup(
		open(Dosiernomo, write, Fluo),
		st_render_file('diversaj/shablono', Dikto, Fluo, [cache(true)]),
		close(Fluo)
	).

generu_retejon :-
	pagho(Pagho),
	lingvo(Pagho, Lingvo),
	generu_paghon(Pagho, Lingvo),
	fail.
generu_retejon.
