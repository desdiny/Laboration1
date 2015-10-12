% Laboration 1 Logik för dataloger, Beviskontroll med Prolog

% ta in inputet
verify(InputFileName):-
  see(InputFileName),
  read(Perms),read(Goal), read(Proof),
  seen,
  valid_proof(Perms, Goal, Proof).

% ---------------------------------------------------
%Vi kommer behöva alla dedkutions bevisen

% AND ELIMINATION 1
valid_proof(Premisser, [Rad, Resultat, andel1(X)], Valid):-
  member([X, and(_ , Resultat), _], Valid).

% AND ELIMINATION 2
valid_proof(Premisser, [Rad, Resultat, andel2(X), Valid]):-
  member([X, and(_, Resultat, _)], Valid).

% AND INTRODUCTION
valid_proof(Premisser, [Rad, and(A,B), andint(X,Y)], Valid):-
  member([X,A,_], Valid), member([Y,B,_], Valid).

% OR ELIMINATION TODO: Fixa Or el
valid_proof(orel()):-.

% OR INTRODUCTION 1 TODO: Fixa orint1
valid_proof(orint1(X)):-.

% OR INTRODUCTION TODO: Fixa orint2
valid_proof(orint2(X)):-.

% IMPLICATION ELIMINATION TODO: Fixa impel
valid_proof(impel(X,Y)):-.

% IMPLICATION INTRODUCTION TODO: Fixa impint
valid_proof(impint(X,Y)):-.

% NEGATION ELIMINATION TODO: Fixa negel
valid_proof(negel(X,Y)):-.

% NEGATION INTRODUCTION TODO: Fixa negint
valid_proof(negint(X,Y)):-.

% CONTRADICTION ELIMINATION TODO: Fixa contel
valid_proof(contel(X)):-.

% DOUBLE NEGATION ELIMINATION
valid_proof(Premisser, [Rad, neg(neg(Resultat)), negnegint(X)], Valid):-
  member([X, Resultat, _], Valid).

% COPY
valid_proof(Premisser, [Rad, Resultat, copy(X)], Valid):-
  member([X, Resultat, _], Valid).

% MT?

% DOUBLE NEGATION INTRODUCTION ?

% PBC ??

% LEM ??
% ---------------------------------------------------

% Boxhantering
