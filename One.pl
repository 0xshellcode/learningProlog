% Library/Functions/Rules

:- initialization(main).

writeln(X):-
    write(X),
    write('\n').
    
not(X):-
    \+X. % Original not

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
woman(maria).

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
    
nobodyLikesHim(X):-
    man(X),
    not(somebodyLikesHim(X)).

blindDateProposal(X, Y):-
    weCanProposeADate,
    man(X),
    woman(Y).

dateProposal(X, Y):-
    weCanProposeADate,
    man(X),
    woman(Y),
    likes(X, Y),
    likes(Y, X).
    
showAllMan:-
    findall(men, man(men), List),
    writeln(List).

showWhoLikesWho:-
    findall((A, B), likes(A,B), List),
    writeln(List).


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
    writeln('----------------'),
    blindDateProposal(Man, Woman),
    writeln(Man),
    writeln(Woman),
    writeln('----------------'),
    findall((Him, Her), blindDateProposal(Him, Her), DateList),
    writeln(DateList),
    writeln('----------------'),
    dateProposal(He, She),
    writeln(He),
    writeln(She),
    writeln('----------------'),
    nobodyLikesHim(PoorGuy),
    writeln(PoorGuy),
    writeln('----------------'),
    findall(PoorGuys, nobodyLikesHim(PoorGuys), PoorGuysList),
    writeln(PoorGuysList).
    
