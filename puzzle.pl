puzzle(List, X, S) :-
    maplist(number_ast, List, ListWithAst),
    puzzle2(ListWithAst, X, S).

number_ast(X, (X,  X)).

puzzle2([(X, S)], X, S).
puzzle2(List, X, S) :-
    select(List, Before, (First, FirstAst), (Second, SecondAst), After),
    operator(Op),
    operation(Op, First, Second, OpResult),
    append(Before, [(OpResult, (Op, FirstAst, SecondAst))|After], Next),
    puzzle2(Next, X, S).


select(List, Before, First, Second, After) :-
    append(Before, [First, Second|After], List).

operator(add).
operator(subtract).
operator(times).
%operator(divide).

operation(add, X, Y, Z) :- Z is X + Y.
operation(subtract, X, Y, Z) :- Z is X - Y.
operation(times, X, Y, Z) :- Z is X * Y.
%operation(divide, X, Y, Z) :- Z is X + Y.

:- puzzle([1], 1, _).
:- puzzle([3, 2], 1, _).
:- puzzle([10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 2017, S), print(S).
