% Answers to the questions:
/*

Question 2:
Write a query that answers the question is Tethys a female?
?- female(tethys).
true.

Question 3:
Write a query that answers the question which gods are children of Rhea and Chronus? This should be written on one line, and you should get five answers.
?- child(X, rhea), child(X, chronus).
X = hera ;
X = hades ;
X = demeter ;
X = poseidon ;
X = zeus ;
false.

Question 5:
Write a query that answers the question who is the mother of Phoebe?
?- mother(phoebe, X).
X = leto ;
false.

Question 7:
Write a query that answers the question which gods are partners of Hermes? You should receive two answers.
?- partner(hermes, X).
X = dryope ;
X = aphrodite ;
false.

Question 9:
Write a query that answers the question who are bachelors? You should receive seven unique answers.

Question 11:
Write a query that answers the question who is a sibling of Apollo? You should receive one unique answer, but it can be repeated.
?- sibling(apollo, X).
X = artemis ;
X = artemis ;
false.

Question 13:
Write a query that answers the question who is a part of Ares family? You should receive five unique answers.
?- family(ares, X).
X = zeus ;
X = hera ;
X = eros ;
X = hephaestus ;
X = hephaestus ;
X = hephaestus ;
X = hephaestus ;
X = aphrodite ;
X = aphrodite ;
false.

Question 15:
Write a query, without creating a new rule, that answers the question which goddesses have more than one partner? There can be duplicates among the answers.
?- female(X), partner(X, Y), partner(X, Z), Y\=Z.
X = aphrodite,
Y = ares,
Z = hermes ;
X = aphrodite,
Y = hermes,
Z = ares ;
false.

*/




% Question 1:
child(pan, hermes).
child(pan, dryope).


child(rhea,uranus).
child(rhea,gaia).
child(chronus,uranus).
child(chronus,gaia).
child(phoebe,uranus).
child(phoebe,gaia).
child(coeus,uranus).
child(coeus,gaia).
child(iapetus,uranus).
child(iapetus,gaia).
child(tethys,uranus).
child(tethys,gaia).
child(oceanus,uranus).
child(oceanus,gaia).
child(hera,chronus).
child(hera,rhea).
child(hades,chronus).
child(hades,rhea).
child(demeter,chronus).
child(demeter,rhea).
child(poseidon,chronus).
child(poseidon,rhea).
child(zeus,chronus).
child(zeus,rhea).
child(leto,phoebe).
child(leto,coeus).
child(epimetheus,iapetus).
child(atlas,iapetus).
child(pleione,tethys).
child(pleione,oceanus).
child(hephaestus,zeus).
child(hephaestus,hera).
child(ares,zeus).
child(ares,hera).
child(persephone,zeus).
child(persephone,demeter).
child(artemis,zeus).
child(artemis,leto).
child(apollo,zeus).
child(apollo,leto).
child(dione,epimetheus).
child(dryope,atlas).
child(dryope,pleione).
child(maia,atlas).
child(maia,pleione).
child(aphrodite,zeus).
child(aphrodite,dione).
child(hermes,zeus).
child(hermes,maia).
child(eros,ares).
child(eros,aphrodite).
child(hermaphroditus,aphrodite).
child(hermaphroditus,hermes).
child(athena,zeus).
female(gaia).
female(rhea).
female(phoebe).
female(tethys).
female(hera).
female(demeter).
female(leto).
female(pleione).
female(persephone).
female(aphrodite).
female(athena).
female(artemis).
female(dione).
female(dryope).
female(maia).



% Rules:
% C is a daughter of P if C is the child of P, and C is female.
daughter(C,P) :- child(C,P), female(C).
% Gp is the grandparent of C if (for any P) C is the child of P, and P is the child of Gp.
grandchild(C,Gp) :- child(C,P), child(P,Gp).
% C is a son of P if C is the child of P, and C is not female.
son(C,P) :- child(C,P), \+ female(C).
% A is parther with B if they have a child together.
% partner(A, B) :- child(C, A), child(C, B), not(A = B) .
% X and Y are in a family if X is the child of Y, or Y is the child of X.
% Question 12:
family(X,Y) :- child(X,Y).
family(X,Y) :- child(Y,X).
family(X,Y) :- sibling(X,Y).
family(X,Y) :- sibling(Y,X).
family(X,Y) :- partner(X,Y).
family(X,Y) :- partner(Y,X).
% X is a titan if X is the child of Y, and Y is Uranus.
% Question 14:
titan(X) :- child(X,uranus).

% Question 4:
mother(M, C) :- child(C, M), female(M).

% Question 6:
partner(A, B) :- child(C,A), child(C, B), A\=B.

% Question 8:
bachelor(X) :- \+ child(X, C), \+ female(X).

% Question 10:
sibling(A, B) :- child(A, M), child(B, M), child(A,P), child(B,P), A\=B, M\=P.




% Printouts from prompt:
% Is Atlas female?
% ?- female(atlas).
% false.
% Who is the parent of both Apollo and Ares?
% ?- child(apollo,P), child(ares,P).
% P = zeus
% false.