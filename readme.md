# DD1350 Logik fo ̈r dataloger Laboration 1: Beviskontroll med Prolog

## Denna lab arbetas på av
 - Trolle Geuna
 - Christian Johansson

## Var inte tokig och fuska!!!

D. Gurov, A. Lundblad
1 Introduktion
I den ha ̈r laborationen ska du konstruera och implementera en algoritm som kontrollerar huruvida ett bevis skrivet i naturlig deduktion (som beskrivet i kursboken) a ̈r korrekt eller inte. Indata till ditt program a ̈r en sekvent och ett bevis, och programmet ska svara “yes” om det givna beviset a ̈r korrekt och visar att den givna sekventen ga ̈ller och “no” annars.
Som du ka ̈nner till utgo ̈rs naturlig deduktion av en uppsa ̈ttning regler som beskriver na ̈r och hur nya formler kan ha ̈rledas. Ett spr ̊ak va ̈l la ̈mpat fo ̈r att kontrollera att s ̊adana regler fo ̈ljs a ̈r Prolog, vilket vi kommer anva ̈nda i denna laboration.
Laborationen utfo ̈rs individuellt eller i par.
2 Angreppss ̈att
Hur ett korrekt bevis i naturlig deduktion ska se ut defineras i figur 1.
Ett bevis kontrolleras allts ̊a la ̈mpligtvis rad fo ̈r rad genom att verifiera att premisserna fo ̈r respektive regel a ̈r uppfyllda. Vad man beho ̈ver ha tillg ̊ang till fo ̈r att avgo ̈ra om en regel a ̈r korrekt applicerad a ̈r vilka formler och box- ar som ha ̈rletts ovanfo ̈r i beviset. Va ̈ljer du att g ̊a igenom beviset uppifr ̊an och ner, m ̊aste du bokfo ̈ra vilka formler och boxar som redan kontrollerats. Va ̈ljer man att g ̊a nerifr ̊an och upp kan man finna informationen i den del av beviset som man har kvar att g ̊a igenom.
En stor del av arbetet g ̊ar ut p ̊a att se till att boxar hanteras p ̊a ett kor- rekt sa ̈tt, dvs att man kan referera till hela boxar men inte till individuella
1
￼￼￼Ett bevis (eller ha ̈rledning) till en sekvent a ̈r en for- melsekvens:
• da ̈r varje formel antingen a ̈r:
– en premiss i sekventen, eller
– ett tillfa ̈lligt antagande, eller
– resultatet av n ̊agon regel applicerad p ̊a formler som:
∗ kommer tidigare i sekvensen, och
∗ inte fo ̈rekommer i n ̊agon avslutad box.
• da ̈r alla antaganden a ̈r friade, och • som slutar i sekventens slutsats
￼Figur 1: Definitionen av ett bevis i naturlig deduktion.
formler inuti en sta ̈ngd box. Detta kan lo ̈sas p ̊a m ̊anga sa ̈tt. En lo ̈sning a ̈r att se till att en box o ̈ppnas vid och endast vid ett antagande och da ̈refter, tempora ̈rt, bortse fr ̊an boxen tills alla rader i boxen kontrollerats. En annan lo ̈sning a ̈r att go ̈ra det rekursivt, genom att utnyttja det faktum att boxar i sig m ̊aste uppfylla samma krav som ett komplett bevis.
Samtliga regler fr ̊an figur 1.2 p ̊a sid. 27 i boken (se sista appendix), samt regeln copy ska hanteras. Den fullsta ̈ndiga listan o ̈ver regler hittar du i appendix A.
2.1 Exempel
Antag att vi vill kontrollera att beviset i figur 2 a ̈r ett korrekt bevis fo ̈r fo ̈ljande sekvent: ¬¬(p → ¬p) ⊢ ¬p. Det fo ̈rsta vi go ̈r a ̈r att kontrollera att m ̊alet, dvs ho ̈gerledet av sekventen, (i detta fall ¬p) st ̊ar p ̊a sista raden i beviset. Da ̈refter kontrollerar vi rad fo ̈r rad som beskrivet i figur 3. I figuren l ̊ater vi understreck (” ”) st ̊a fo ̈r va ̈rden som vi inte bryr oss om, precis som i Prolog.
2
￼
¬¬(p → ¬p) ⊢ ¬p
1 ¬¬(p → ¬p)
2 p → ¬p
3 4
3 Uppgifter
Laborationen best ̊ar av fo ̈ljande uppgifter:
1. Skriv ett icke-trivialt korrekt bevis och ett icke-trivialt felaktigt bevis, b ̊ada med boxar.
2. Torrko ̈rr din ta ̈nkta algoritm med penna och papper och visa hur den fungerar fo ̈r dessa tv ̊a bevis.
3. Implementera beviskontrolleringen i Prolog fo ̈r bevis i formatet som definieras i appendix A.
4. Ko ̈r ditt program p ̊a bevisen som du hittat p ̊a sja ̈lv och p ̊a alla fo ̈r- definierade testfall (se tips nedan).
5. Sammansta ̈ll resultaten och tillva ̈gag ̊angssa ̈ttet i en rapport. Rappor- ten la ̈mnas in och fungerar som underlag vid redovisningen. Rappor- ten betygssa ̈tts med G eller VG. Fo ̈r VG kra ̈vs en bra, va ̈lskriven och helta ̈ckande rapport. Fo ̈rutom en generell beskrivning av den valda beviskontrollalgoritmen och speciellt boxhanteringen, bo ̈r rapporten inneh ̊alla en tabell som listar namnen p ̊a era predikat samt na ̈r varje predikat a ̈r sant respektive falskt. Inkludera a ̈ven programkoden och exempelbevisen i ett appendix.
6. Under redovisningen ska du kunna argumentera att lo ̈sningen a ̈r kor- rekt, och vara beredd p ̊a att besvara fr ̊agor om er lo ̈sning och fo ̈ljande fr ̊agor: skulle ditt beviskontrolleringsprogram kunna anva ̈ndas fo ̈r att generera bevis fo ̈r sekventer? Vad ga ̈ller fo ̈r begra ̈nsade fall?
3
premise ¬¬e 1
¬i 3-5 Figur 2: En sekvent och exempel p ̊a bevis.
￼5
6 ¬p
p assumption ¬p →e 3, 2
⊥ ¬e 3, 4
￼￼￼
￼￼￼1 ¬¬(p → ¬p) premise .
Rad 1 a ̈r OK eftersom ¬¬(p → ¬p) finns bland ma ̈ngden av premisser.
￼￼￼￼￼1 ¬¬(p → ¬p) premise 2 p→¬p ¬¬e1
.
Rad 2 a ̈r OK eftersom 1 ¬¬(p → ¬p)
finns ovanfo ̈r i beviset vilket a ̈r kriteriet fo ̈r att f ̊a applicera ¬¬e. Radnumret ska sta ̈mma o ̈verens med det som a ̈r angivet efter regeln men vi inte bryr oss om hur ¬¬(p → ¬p) ha ̈rleddes.
￼￼￼￼1 ¬¬(p → ¬p) 2 p→¬p
3 p
.
premise ¬¬e1 assumption
Rad 3 a ̈r OK d ̊a en box o ̈ppnats.
￼￼￼￼￼￼￼1 ¬¬(p → ¬p) 2 p→¬p
3 p
4 ¬p
.
premise ¬¬e1 assumption →e3,2
Rad 4 a ̈r OK d ̊a b ̊ade
2 p→¬p och
3p
finns i beviset ovan, vilket a ̈r kriteriet fo ̈r att f ̊a applicera →e.
￼￼￼￼￼￼￼￼￼￼￼1 ¬¬(p → ¬p) premise
2 p→¬p ¬¬e1
3 4
5
Rad 5 a ̈r OK d ̊a b ̊ade
3p och
4 ¬p
finns i beviset ovan, vilket a ̈r kriteriet fo ̈r att f ̊a applicera ¬e.
￼￼￼p assumption ¬p →e 3, 2
⊥ ¬e 3, 4
￼￼￼￼￼.
￼￼￼￼￼￼￼1 ¬¬(p → ¬p)
2 p→¬p
3 4
5
6 ¬p
premise ¬¬e1
¬i3-5
Rad 6 a ̈r OK d ̊a en box p ̊a formen 3
.
5
finns i beviset ovan, vilket a ̈r kriteriet fo ̈r att f ̊a applicera ¬i.
p
. .
⊥
￼￼￼￼￼￼￼￼￼￼￼p assumption ¬p →e 3, 2
⊥ ¬e 3, 4
￼￼￼￼￼￼￼￼￼Figur 3: Exempel p ̊a beviskontroll. Notera att hela exemplet lika ga ̈rna kan la ̈sas bakla ̈nges om man va ̈ljer att g ̊a igenom raderna nerifr ̊an och upp.
4
4 Indataformat
Varje indatafil best ̊ar av tre prologtermer:
1. En lista av premisser (va ̈nstra delen av en sekvent) 2. Ett bevism ̊al (ho ̈gra delen av en sekvent)
3. Ett bevis i naturlig deduktion
Exempelsekventen och det tillho ̈rande beviset i figur 2 skulle till exempel se ut p ̊a fo ̈ljande sa ̈tt:
% En lista av premisser (v ̈anstra delen av sekventen.) [neg(neg(imp(p, neg(p))))].
% M ̊alet (h ̈ogra delen av sekventen). neg(p).
% Beviset [
  [1, neg(neg(imp(p,neg(p)))),
  [2, imp(p, neg(p)),
  [
    [3, p,
    [4, neg(p),
    [5, cont,
premise    ],
negnegel(1)],
assumption ],
impel(3,2) ],
negel(3,4) ]
negint(3,5)]
],
  [6, neg(p),
].
Inla ̈sningen av indata a ̈r mycket enkel d ̊a formatet best ̊ar av Prolog-termer. Fo ̈r att skapa ett predikat, verify, som la ̈ser en lista av premisser, ett m ̊al och ett bevis fr ̊an InputFileName och skickar det vidare till ett valid_proof predikat skriver ni
 verify(InputFileName) :- see(InputFileName),
                          read(Prems), read(Goal), read(Proof),
                          seen,
                          valid_proof(Prems, Goal, Proof).
Om detaljerna i formatet a ̈r oklara, se beskrivningen i appendix A. 5
5 Tips
• Fo ̈ljande kommando startar Prolog, laddar beviskoll.pl, testar pre- dikatet verify(’input.txt’) och avslutar Prolog:
      prolog --query-goal "[’beviskoll’], verify(’input.txt’)" --query-goal halt
• Bo ̈rja med lo ̈sa enkla exempel som
         [p].
         p.
         [[1, p, premise]].
Na ̈r detta fungerar la ̈gger du la ̈mpligtvis till funktionalitet fo ̈r o ̈vriga regler och slutligen hantering av boxar.
• Ikatalogen/info/logik14/lab1/testsfinnerduenuppsa ̈ttningtest- fall. Det a ̈r inte ett strikt krav att alla tester ska passera, men i de fall ett test inte passerar ska du i detalj kunna redogo ̈ra varfo ̈r. Fo ̈r att ko ̈ra alla tester kan du kopiera hela test-katalogen till din labb- katalog och anva ̈nda skriptet run all tests eller Prologprogrammet run all tests.pl. S ̊a ha ̈r kan fo ̈rloppet se ut:
     $ cp -r /info/logik14/lab1/tests .
     $ cd tests
     $ prolog
     GNU Prolog 1.3.0
     By Daniel Diaz
     Copyright (C) 1999-2007 Daniel Diaz
     | ?- [’run_all_tests.pl’].
     compiling run_all_tests.pl for byte code...
     tests/run_all_tests.pl compiled, ...
     yes
     | ?- run_all_tests(’../DIN_PROLOG_FIL.pl’).
     compiling DIN_PROLOG_FIL.pl for byte code...
     valid01.txt passed
     valid02.txt passed
     valid03.txt passed
     ...
6
￼￼￼￼
• Genom att ge kommandot trace. innan du ko ̈r ditt program, instru- erar du Prolog att skriva ut vad som anropas, vad som lyckas, och vad som inte lyckas. Anva ̈nd kommandot notrace. fo ̈r att sta ̈nga av funktionen.
• Ta ̈nk p ̊a att i vissa Prolog-tolkar som gprolog s ̊a m ̊aste definitionen av ett predikat m ̊aste vara “sammanha ̈ngande” i filen. Om du “delar upp” predikat p ̊a fo ̈ljande sa ̈tt:
predA(...) :- ... % B ̈orja definera predA
predB(...) :- ... % Definera predB
predA(...) :- ... % Forts ̈att definera predA (FUNGERAR EJ)
kommer du f ̊a ett felmeddelande i stil med
      warning: discontiguous predicate pred/1 - clause ignored
• Om n ̊agot test inte ger det fo ̈rva ̈ntade resultatet, fo ̈rso ̈k ta bort ir- relevanta delar av indata (dvs konstruera ett minimalt motexempel) innan du avlusar med trace. Att stega igenom en stor Prolog-ko ̈rning leder sa ̈llan n ̊agon vart.
• Ett annat sa ̈tt att avlusa ditt program a ̈r att la ̈gga till debuggutskrif- ter. Fo ̈r att till exempel se till att Prolog har lyckats uppfylla ett visst predikat kan du la ̈gga till write(’predikatet uppfyllt!’) i slutet av det predikatet.
7
A Syntax av indatafilerna
Detta appendix beskriver formatet av indatafilerna i detalj.
A.1 Propositioner
Fo ̈r att fo ̈renkla inla ̈sning och hantering av indata a ̈r propositionerna givna som Prolog-termer i prefixnotation. N ̊agra exempel a ̈r listade nedan.
￼Infixnotation
p→q (p∨q)∧r
¬p → ⊥ ((p∧q)∧r)∧s
Motsvarande Prolog-term
imp(p, q)
and(or(p, q), r)
imp(neg(p), cont)
and(and(and(p,q),r),s)
￼￼Formellt kan syntaxen fo ̈r propositionerna beskrivas i s.k. BNF–notation p ̊a fo ̈ljande sa ̈tt:
φ ::= a | b | . . . | z | and(φ,φ) | or(φ,φ) | imp(φ,φ) | neg(φ) | cont A.2 Regelappliceringar
Regelappliceringarna (den ho ̈gra kolumnen i bevisen) a ̈r skrivna med kon- nektivet, fo ̈ljt av int eller el och eventuellt ett eller flera heltal som beskriver vilka rader regelappliceringen syftar p ̊a. Ta ̈nk p ̊a att radreferensernas ord- ning spelar roll! Radreferenserna fo ̈ljer samma ordning som premisserna i reglerna fr ̊an figur 1.2 i boken. Fo ̈r till exempel andint(5,3) ga ̈ller allts ̊a att va ̈nstra konjunkten ska  ̊aterfinnas p ̊a rad 5 och den ho ̈gra p ̊a rad 3.
￼￼Prolog
premise
assumption
copy(x)
andint(x,y)
andel1(x)
andel2(x)
orint1(x)
orint2(x)
orel(x,y,u,v,w)
impint(x,y)
Logisk premise assumption copy x
∧i x, y
∧e1 x
∧e2 x
∨i1 x
∨i2 x
∨e x,y–u,v–w →i x–y
8
Prolog
impel(x,y)
negint(x,y)
negel(x,y)
contel(x)
negnegint(x)
negnegel(x)
mt(x,y)
pbc(x,y)
lem
Logisk →e x,y ¬i x-y ¬e x,y ⊥e x ¬¬i x ¬¬e x mt x,y pbc x-y lem
￼￼￼￼￼￼￼￼￼￼￼
B Exempelko ̈rningar
  $ cat valid.txt
  [imp(p, q), p].
$ cat invalid.txt
[imp(p, q), p].
q. [[
q.
[1, imp(p,q), premise],
[2, p, premise],
[3, q, impel(2,1)]
].
$ prolog
GNU Prolog 1.3.0
By Daniel Diaz
Copyright (C) 1999-2007 Daniel Diaz
| ?- [pc].
compiling /pc.pl for byte code...
/pc.pl compiled
yes
| ?- verify(’valid.txt’).
true ?
yes | ?-
(a) En kontroll av ett korrekt bevis.
[1, imp(p,q), premise],
[2, q, assumption]
].
$ prolog
GNU Prolog 1.3.0
By Daniel Diaz
Copyright (C) 1999-2007 Daniel Diaz
| ?- [pc].
compiling /pc.pl for byte code...
/pc.pl compiled
yes
| ?- verify(’invalid.txt’).
no
| ?-
(b) En kontroll av ett felaktigt bevis.
9
