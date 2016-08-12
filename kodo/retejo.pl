:- use_module(library(st/st_render)).

generu_paghon(Id, Traduko) :-
	generu_dikton(Id, Traduko, Dikto),
	current_output(Elfluo),
	st_render_file('diversaj/shablono', Dikto, Elfluo, [cache(true)]).
