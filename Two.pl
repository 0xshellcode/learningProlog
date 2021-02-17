% Library/Functions/Rules

:- initialization(main).

writeln(X):-
    write(X),
    write('\n').
    
not(X):-
    \+X. % Original not

presentList([]). % Check for empty list, this is the termination function
presentList([ HEAD | REST ]):- % If not empty, check whats is in the list
    writeln(HEAD),
    presentList(REST).

% Facts or Predicates
% Arity = number of arguments

director(jayRoach, meetTheParents).
director(neilJordan, interviewWithTheVampire).
director(shyamalan, theSixthSense).
director(martinBrest, meetJoeBlack).
director(darrenAronofsky, blackSwan).
director(jonathanDemme, silenceOfTheLambs).
director(johnFrankenheimer , ronin).
director(brianDePalma, missionImpossible).
director(brianDePalma, theUntouchables).
director(stevenSpielberg, ai).
director(stevenSpielberg, minorityReport).
director(francisFordCoppola, theGodfather).
director(francisFordCoppola, dracula).
director(lucBesson, theFifthElement).
director(lucBesson, leon).
director(martinScorsese, taxiDriver).
director(martinScorsese, theWolfOfWallStreet).

kindOfMovie(terror, dracula).
kindOfMovie(terror, interviewWithTheVampire).
kindOfMovie(terror, theSixthSense).
kindOfMovie(action, missionImpossible).
kindOfMovie(action, leon).
kindOfMovie(action, theUntouchables).
kindOfMovie(drama, meetJoeBlack).
kindOfMovie(drama, blackSwan).
kindOfMovie(drama, taxiDriver).
kindOfMovie(suspense, silenceOfTheLambs).
kindOfMovie(suspense, theGodfather).
kindOfMovie(suspense, ronin).
kindOfMovie(fiction, ai).
kindOfMovie(fiction, theFifthElement).
kindOfMovie(fiction, minorityReport).
kindOfMovie(comedy, theWolfOfWallStreet).
kindOfMovie(comedy, meetTheParents).

actsIn(winonaRider, dracula).
actsIn(winonaRider, blackSwan).
actsIn(bradPitt, meetJoeBlack).
actsIn(bradPitt, interviewWithTheVampire).
actsIn(anthonyHopkins, meetJoeBlack).
actsIn(anthonyHopkins, silenceOfTheLambs).
actsIn(jodieFoster, taxiDriver).
actsIn(jodieFoster, silenceOfTheLambs).
actsIn(tomCruise, interviewWithTheVampire).
actsIn(tomCruise, missionImpossible).
actsIn(tomCruise, minorityReport).
actsIn(jeanReno, missionImpossible).
actsIn(nataliePortman, leon).
actsIn(nataliePortman, blackSwan).
actsIn(jeanReno, leon).
actsIn(jeanReno, ronin).
actsIn(robertDeNiro, taxiDriver).
actsIn(robertDeNiro, theGodfather).
actsIn(robertDeNiro, ronin).
actsIn(robertDeNiro, theUntouchables).
actsIn(robertDeNiro, meetTheParents).
actsIn(haleyJoelOsment, ai).
actsIn(haleyJoelOsment, theSixthSense).
actsIn(bruceWillis, theSixthSense).
actsIn(bruceWillis, theFifthElement).
actsIn(leonardoDiCaprio, theWolfOfWallStreet).

% Rules

likesActor(Client, Actor):-
    purchase(Client, Movie),
    actsIn(Actor, Movie).

likesKindOfMovie(Client, Kind):-
    purchase(Client, Movie),
    kindOfMovie(Kind, Movie).
    
recommend(Client, Movie):-
    likesActor(Client, Actor),
    actsIn(Actor, Movie),
    likesKindOfMovie(Client, Kind),
    kindOfMovie(Kind, Movie),
    not(purchase(Client, Movie)).
    
% Updating Data

dataUpdate:-
    % asserta updates something to the knowledge database
    asserta(purchase("Juan Pérez", taxiDriver)),
    asserta(purchase("Juan Pérez", theGodfather)),
    asserta(purchase("Juan Pérez", theWolfOfWallStreet)),
    asserta(purchase("Juan Pérez", interviewWithTheVampire)),
    asserta(purchase("Juan Pérez", theSixthSense)).
    

% Execution

main:-
    writeln('Recommendation System'),
    dataUpdate,
    likesActor("Juan Pérez", Actor), % Give me the name of an actor that Juan Pérez likes
    writeln(Actor),
    writeln('----------------'),
    findall(AllTheActors, likesActor("Juan Pérez", AllTheActors), List),
    writeln(List),
    writeln('----------------'),
    presentList(List),
    writeln('----------------'),
    sort(List),
    presentList(List),
    writeln('----------------'),
    recommend("Juan Pérez", Movie),
    writeln(Movie),
    writeln('----------------'),
    findall(TheMovie,recommend("Juan Pérez", TheMovie), RecommendationList),
    writeln(RecommendationList),
    writeln('----------------'),
    sort(RecommendationList),
    presentList(RecommendationList).
