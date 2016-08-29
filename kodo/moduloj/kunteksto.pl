% ni aldonas "lingvo" valoron kun aktuala lingvo
valoro(_, Lingvo, lingvo, Lingvo).

% ... kaj "id" kun identigilo
valoro(Id, _, id, Id).

valoro(_, _, radiko_id, Id) :-
	radiko(Id).
