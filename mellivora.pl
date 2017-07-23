:- encoding(utf8).

% UZU SWI-PROLOG >= 7
% swipl -s mellivora [-t celo]

konsilu :-
	['kodo/konsili.pl'].

rulu :-
	konsilu,
	legu_dosieron(fonto, _ID),
	generu_retejon,
	halt.

instalu_aldonajhojn :-
	pack_install(simple_template, [interactive(false), update(true)]).

kompilu :-
	instalu_aldonajhojn,
	konsilu,
	writeln('Kompilas programon...'),
	set_prolog_flag(optimise, true),
	qsave_program(mellivora, [
		foreign(save),
		goal(rulu),
		stand_alone(true)]),
	writeln('Programo pretas!').
