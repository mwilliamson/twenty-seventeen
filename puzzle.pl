puzzle([X], X).
puzzle(List, X) :-
    select(List, Before, First, Second, After),
    operation(Op),
    perform_operation(Op, First, Second, OpResult),
    append(Before, [OpResult|After], Next),
    puzzle(Next, X).

select(List, Before, First, Second, After) :-
    append(Before, [First, Second|After], List).

operation(add).
operation(subtract).
operation(times).
%operation(divide).

perform_operation(add, X, Y, Z) :- Z is X + Y.
perform_operation(subtract, X, Y, Z) :- Z is X - Y.
perform_operation(times, X, Y, Z) :- Z is X * Y.
%perform_operation(divide, X, Y, Z) :- Z is X + Y.

:- puzzle([1], 1).
:- puzzle([3, 2], 1).
:- puzzle([10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 2017).
