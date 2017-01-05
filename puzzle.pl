puzzle(List, X, S) :-
    indexed(List, IndexedList),
    puzzle2(IndexedList, X, S).

indexed(List, IndexedList) :- indexed(List, IndexedList, 0).

indexed([], [], _).
indexed([Head|Tail], [(Index, Head)|IndexedTail], Index) :-
    NextIndex is Index + 1,
    indexed(Tail, IndexedTail, NextIndex).

puzzle2([(_, X)], X, []).
puzzle2(List, X, [(FirstIndex, First, Second, Op)|S]) :-
    select(List, Before, (FirstIndex, First), (_, Second), After),
    operator(Op),
    operation(Op, First, Second, OpResult),
    append(Before, [(FirstIndex, OpResult)|After], Next),
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
