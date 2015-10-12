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
  member([X, and(_, Resultat, _), Valid]).
% AND INTRODUCTION
valid_proof()
% OR ELIMINATION 1
valid_proof()
% OR ELIMINATION 2
valid_proof()
% OR INTRODUCTION
valid_proof()
% IMPLICATION ELIMINATION
valid_proof()
% IMPLICATION INTRODUCTION
valid_proof()
% NEGATION ELIMINATION
valid_proof()
% NEGATION INTRODUCTION
valid_proof()
% CONTRADICTION ELIMINATION
valid_proof()
% DOUBLE NEGATION ELIMINATION
valid_proof()

% COPY
valid_proof(Premisser, [Rad, Resultat, copy(X)], Valid):-
  member([X, Resultat, _], Valid).
% MT?

% DOUBLE NEGATION INTRODUCTION ?

% PBC ??

% LEM ??
% ---------------------------------------------------

% Boxhantering
