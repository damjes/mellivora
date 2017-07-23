:- encoding(utf8).

% UZU SWI-PROLOG >= 7
% swipl -s mellivora [-t celo]

:- ['kodo/konsili.pl'].

rulu :-
	legu_dosieron(fonto, _ID),
	generu_retejon,
	halt.

kompilu :-
	write('Kompilas programon...'),
	set_prolog_flag(optimise, true),
	qsave_program(mellivora, [
		foreign(save),
		goal(rulu),
		stand_alone(true)]),
	writeln(' OK!').

instalu_aldonajhojn :-
	pack_install(simple_template, [update(true)]).
