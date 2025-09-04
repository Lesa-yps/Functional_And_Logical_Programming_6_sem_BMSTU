:- use_module(library(clpfd)).

% Your program goes here


facX(0, X, X) :- !.
facX(N, Acc, X) :- N2 #= N-1,
    Acc2 #= Acc * N,
    facX(N2, Acc2, X).


fibX(0, X, _, X) :- !.
fibX(1, _, X, X) :- !.
fibX(N, FibN1, FibN2, X) :- N2 #= N-1,
    NewFibN1 #= FibN2,
    NewFibN2 #= FibN1 + FibN2,
    fibX(N2, NewFibN1, NewFibN2, X).


:- dynamic memo_fac/2.
:- dynamic memo_fib/2.

clear_fac_cache :- retractall(memo_fac(_, _)).

facXd(N, X) :- memo_fac(N, X), !.
facXd(0, 1) :- !, asserta(memo_fac(0, 1)).
facXd(N, X) :- N2 #= N - 1,
    facXd(N2, X2),
    X #= N * X2,
    asserta(memo_fac(N, X)).

fibXd(N, X) :-memo_fib(N, X), !.
fibXd(0, 0) :- !, asserta(memo_fib(0, 0)).
fibXd(1, 1) :- !, asserta(memo_fib(1, 1)).
fibXd(N, X) :- N #> 1,
    N1 #= N - 1,
    N2 #= N - 2,
    fibXd(N1, X1),
    fibXd(N2, X2),
    X #= X1 + X2,
    asserta(memo_fib(N, X)), !.