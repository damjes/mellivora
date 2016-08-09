:- use_module(library(http/json)).

legu_json(Vojo, Dikto) :-
	setup_call_cleanup(
		open(Vojo, read, Fluo, [encoding(utf8)]),
		json_read_dict(Fluo, Dikto),
		close(Fluo)).
