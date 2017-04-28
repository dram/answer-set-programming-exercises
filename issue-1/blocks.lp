%%% Facts

block(a).
block(b).
block(c).
block(d).

cube(a).
cube(b).
cube(c).
pyramid(d).


%%% Possible solutions

%% Block need to be placed on table or another block.
on_table(X) ; on(X, Y) : block(Y) :- block(X).


%%% Constraints

%% Only one block can be placed on table.
:- on_table(X), on_table(Y), X != Y.

%% For any blocks only one block can be placed on it.
:- on(X, Z), on(Y, Z), X != Y.

%% No block can be placed on a pyramid.
:- on(_, X), pyramid(X).

%% No loops.
above(X, Y) :- on(X, Y).
above(X, Y) :- on(X, Z), above(Z, Y).
:- above(X, X).


%%% Output

#show on/2.
#show on_table/1.
