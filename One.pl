% Library/Functions/Rules

:- initialization(main).

writeln(X):-
    write(X),
    write('\n').

% Facts  or Predicates
% Arity = number of arguments

% Predicates Arity 0

weHaveAPlace.

% Predicates Arity 1

man(john).
man(george).
man(paul).
man(ringo).

woman(shakira).
woman(miley).
woman(selena).

% Predicates Arity 2

likes(paul, shakira).
likes(miley, george).
likes(george, miley).
likes(maria, paul).

% Rules

% The "_" menas 'any'

weCanProposeADate:-
    man(_),
    woman(_),
    weHaveAPlace.

somebodyLikesHim(Y):-
    man(Y),
    woman(X),
    likes(X, Y). % To be read as: She (X), likes him (Y)


% Execution

main :-
    weHaveAPlace,
    writeln('Hello World!'),
    man(X),
    writeln(X),
    findall(Y, man(Y), List),
    writeln(List),
    likes(A,B),
    writeln(A),
    writeln(B),
    findall((C, D), likes(C, D), NewList), % New variables must be used
    writeln(NewList),
    writeln('----------------'),
    weCanProposeADate,
    writeln('Yes we can do it'),
    somebodyLikesHim(LuckyGuy),
    writeln(LuckyGuy),
    findall(Guys, somebodyLikesHim(Guys), LuckyGuys),
    writeln(LuckyGuys).