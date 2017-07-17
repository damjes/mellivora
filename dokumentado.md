Statika retpaĝo - dokumentado
=============================

Instalado
---------

Vi bezonas SWI-Prolog en sepa versio (ol pli granda) kun `simple_template` aldonaĵo. Vi povas instali tion tiel:

```
?- pack_install(simple_template).
```

Ankaŭ Vi bezonas MultiMarkDown en Via `PATH`. Sekve Vi bezonas kodon - Vi povas preni tion el ia Gita deponejo:

- https://github.com/matma6/statikaRetpagho.git - ĉefa
- https://bitbucket.org/matma6/statikaretpagho.git
- https://gitlab.com/matma6/statikaRetpagho.git

Dank' al Gita `pushurl`, mi premas ŝanĝojn al ĉiuj supraj deponejoj.

Retejkreado
-----------

Vi kreu arbaron en dosieraro, ekzemple `fonto`. Unu paĝo estas unu dosieraro. En `fonto` dosieraro en deponejo Vi povas trovi ekzemplon.

Paĝo havas kelkajn trajtojn kaj du tekstojn po unu traduko. Vi povas ŝanĝi tion en `kodo/pagho.pl` en `dosiernomo/2`. Trajtoj estas en dosiero `meta.json` kaj teksto havas nomon `lingvo.numero_de_teksto.mmd`, ekzemple `eo.2.mmd` estas suba teksto en Esperanto lingvo.

Tio estas ekzempla `meta.json`:

```
{
	"bildeto": "hejmo",
	"dato": [2016, 8, 7],
	"koloro": "black",
	"kreanto": "Damjes",
	"tradukoj": {
		"eo": {
			"titolo": "rEta hejmo de Damjes",
			"mallonga_titolo": "damj.es",
			"slugo": ""
		},
		"pl": {
			"titolo": "Moje miejsce w sieci",
			"mallonga_titolo": "damj.es",
			"slugo": ""
		}
	}
}
```

Vi povas vidi, ke paĝo povas havi bildeton, daton... Nota bene, ke **`dato` estas bezonata por ordigi, do bonvolu skribi tion**. Dato estas `[jaro, monato, tago]`, ekzemple `[2016, 6, 28]` signifas Tau datfesto (28a julio) en jaro 2016. Vi ne povas skribi `06`, ĉar por JSON tio ne estas numero.

Se Vi havas multilingvan retejon, tradukoj malsamas kaj titoloj ankaŭ malsamas. Do Vi povas doni tradukitajn trajtojn. Naturale, **`slugo` estas bezonata por krei dosiernomojn kaj ligilojn**, kaj, en implicita ŝablono, `titolo` kaj `mallonga_titolo` ankaŭ estas bezonataj.

Uzado
-----

Se Via fonto pretas, Vi iru al SWI-Prolog:

```
$ swipl -s kodo/konsili.pl
```

kaj sekve Vi diru, ke Prolog devas konstrui ĉiajn datumojn el fonto:

```
?- legu_dosieron(fonto, ID).
```

Tio estas grava, ke Vi finas tion kun `.`, sen tio Prolog atendus por fino de instrukcio. Ankaŭ gravas, ke `ID` devas komenci per granda litero, alie tio fiaskos. `ID` estos identigilo de ĉefa paĝo (se oni bezonas). Naturale, `fonto` estas dosieraro kun fonto de Via retejo, kion Vi kreis. Se Vi bezonas ion specialan, Vi skribu:

```
?- legu_dosieron('ia/vojo/al/fonto', ID).
```

Prolog devas diri `true`, kaj tio signifas, ke ĉio ŝajne estas bonega. Nun Vi povas generi retejon:

```
?- generu_retejon.
```

Sekve, Vi prenu `Stir+D` aŭ skribu `halt.` por fermi Prolog.

Vi ankaŭ povas skribi tiajn tri en unu instrukcio:

```
?- legu_dosieron(fonto, ID), generu_retejon, halt.
```

Ŝablono
-------

Nuntempe ŝablono estas en `diversaj/shablono.html`. Tio estas normala simple_template ŝablono, do se deponeja ekzemplo ne sufiĉus, Vi povas legi [anglan dokumentadon de tio](http://www.swi-prolog.org/pack/list?p=simple_template).

Kontakto
--------

Se Vi havas iajn problemojn, bonvolu sendi retmesaĝon al git ĉe damj punkto es.
