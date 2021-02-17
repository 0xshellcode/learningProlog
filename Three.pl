% Libraries / Functions

:-initialization(main).

writeln(X):-
    write(X),
    write('\n').

% Facts

a(1).
a(11).
a(111).

b(1).
b(11).
b(2).

c(1,one).
c(11, eleven).
c(111, oneHundredOne).
c(2, two).

d(X):-
	a(X),
	b(2).   

e(X):-
	a(X),
	b(X).

f(Y):-
	e(X),
	c(X, Y).

main:-
	findall(X, f(X), List),
	writeln(List).
