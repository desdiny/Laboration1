% Populate test data
far(abba,benny) :- true.
far(abba,cenny) :- false.

% Real code

% And-function, test-cases:
% and(far(abba, benny), far(abba, benny)). = true
% and(far(abba, benny), far(benny, abba)). = false
% and(far(benny, abba), far(abba, benny)). = false
and(A, B) :- A, B.

% Implication-function, test-cases:
% imp(far(abba, benny), far(benny, abba)). = false
% imp(far(abba, benny), far(abba, benny)). = true
% imp(far(benny, abba), far(abba, benny)). = true
% imp(far(benny, abba), far(benny, abba)). = true
imp(A, B) :- \+ A ; A, B.

% Or-function, test-cases:
% or(far(abba, benny), far(abba, benny)). = true
% or(far(abba, benny), far(benny, abba)). = true
% or(far(benny, abba), far(abba, benny)). = true
% or(far(benny, abba), far(benny, abba)). = false
or(A, B) :- A ; B.

% Neg-function, test-cases:
% neg(far(abba, benny)). = false
% neg(far(benny, abba)). = true
neg(A) :- \+ A.

% Unit test for and()
testAnd :- and(far(abba, benny), far(abba, benny)), 
	\+ and(far(abba, benny), far(benny, abba)),
	\+ and(far(benny, abba), far(abba, benny)).

% Unit test for imp()
testImp :- \+ imp(far(abba, benny), far(benny, abba)),
	imp(far(abba, benny), far(abba, benny)),
	imp(far(benny, abba), far(abba, benny)),
	imp(far(benny, abba), far(benny, abba)).

% Unit test for or()
testOr :- or(far(abba, benny), far(abba, benny)),
	or(far(abba, benny), far(benny, abba)),
	or(far(benny, abba), far(abba, benny)),
	\+ or(far(benny, abba), far(benny, abba)).

% Unit test for neg()
testNeg :- \+ neg(far(abba, benny)),
	neg(far(benny, abba)).
