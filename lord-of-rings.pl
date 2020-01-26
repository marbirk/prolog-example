male(ecthelion).
male(adrahil).
male(thengel).
male(denethor).
male(eomund).
male(theoden).
male(boromir).
male(faramir).
male(eomer).
male(theodred).
male(elboron).
male(elfwein).
male(barahir).

female(morwen).
female(finduilas).
female(theodwyn).
female(elfhild).
female(eowyn).
female(lothiriel).

parent(ecthelion, denethor).
parent(adrahil, finduilas).
parent(thengel, theodwyn).
parent(thengel, theoden).
parent(morwen, theodwyn).
parent(morwen, theoden).
parent(denethor, boromir).
parent(denethor, faramir).
parent(finduilas, boromir).
parent(finduilas, faramir).
parent(eomund, eowyn).
parent(eomund, eomer).
parent(theodwyn, eowyn).
parent(theodwyn, eomer).
parent(theoden, theodred).
parent(elfhild, theodred).
parent(faramir, elboron).
parent(eowyn, elboron).
parent(eomer, elfwein).
parent(lothiriel, elfwein).
parent(elboron, barahir).

father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
son(X,Y) :- male(X), parent(Y,X).
daughter(X,Y) :- female(X), parent(Y,X).

grandfather(X,Y) :- male(X), parent(X,Somebody), parent(Somebody,Y).
grandmother(X,Y) :- female(X), parent(X,Somebody), parent(Somebody,Y).
grandson(X,Y) :- male(X), parent(Somebody,X), parent(Y,Somebody).
granddaughter(X,Y) :- female(X), parent(Somebody,X), parent(Y,Somebody).

greatgrandfather(X,Y) :- male(X), parent(X,Somebody), parent(Somebody,AnotherSomebody), parent(AnotherSomebody,Y).
greatgrandmother(X,Y) :- female(X), parent(X,Somebody), parent(Somebody,AnotherSomebody), parent(AnotherSomebody,Y).
greatgrandson(X,Y) :- male(X), parent(Somebody,X), parent(AnotherSomebody,Somebody), parent(Y,AnotherSomebody).
greatgranddaughter(X,Y) :- female(X), parent(Somebody,X), parent(AnotherSomebody,Somebody), parent(Y,AnotherSomebody).

child(X,Y) :- son(X,Y); daughter(X,Y).
grandchild(X,Y) :- grandson(X,Y); granddaughter(X,Y).
greatgrandchild(X,Y) :- greatgrandson(X,Y); greatgranddaughter(X,Y).

descendant(X,Y) :- child(X,Y); grandchild(X,Y); greatgrandchild(X,Y).