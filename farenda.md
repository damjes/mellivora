Versio 0.3
==========
* [ ] kreu bonan lokon por ŝablonoj/etosoj
* [ ] ebligu elektadon de ŝablono por subarboj
* [ ] kreu ilon por faciligi ŝablonkreado
* [ ] generu on `radiko/1` el `legu_tutan_fonton/1`, aŭ simila
* [ ] faru paĝonumeradon po dozeno de idoj en unu paĝo
* [ ] prenu grandecon de paĝonumeradon el agordoj
* [ ] prenu implicitan lingvon el agordoj

Versio 0.4
==========
* [ ] generu paĝon kun markoj
* [ ] generu paĝojn unu po marko kun ĉiuj paĝoj rilataj kun ĉi tia marko

Versio 0.5
==========
* [ ] generu menuon
* [ ] generu ligilojn kun tradukoj
* [ ] generu liston de markoj
* [ ] generu enhavotabelon (vi povas sendi du tekstojn al `grep '^<h[1-6]'`)

Versio 0.6+
==========
* [ ] faru kaŝejon
* [ ] metu iajn dosierojn e.g. bildojn
* [ ] priskribu kodumadajn eblecojn

Ekpensoj
========

### faru liston de idoj (ankaŭ kun ligiloj)
### aŭtomate kreu multivalorajn listojn, ekzemplo:

```
valorparto(a, eo, v, a).
valorparto(a, eo, v, b).
valorparto(a, eo, v, c).
```

do veras: `valoro(a, eo, v, [a, b, c]).`
Ankaŭ pensu pri ordigado de partoj!!!

Oni povas uzi tion por krei liston de idoj aŭ markoj.

### jekyll

Jekyll (naturale) estas fekaĵo (unu kialo estas tia programeto). Sed havas
kelkajn mojosaĵojn:

- ŝablonsistemo
	- `\_layouts` -- malsamaj vidoj por subarboj aŭ specialaj paĝoj
	- `\_includes` -- ŝabloneroj
- generiloj -- oni prenas ian datumfonton kaj kreas paĝo(j)n el tio, ekz.
	listo da ligiloj -> ĉia marko ricevas propran paĝon kun rilatajn ligilojn
