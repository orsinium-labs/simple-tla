---- MODULE set ----
LOCAL INSTANCE FiniteSets
LOCAL INSTANCE Naturals

add(s, e) == s \union {e}
all(s, f(_)) == \A e \in s : f(e)
any(s, f(_)) == \E e \in s : f(e)
contains(s, e) == e \in s
difference(a, b) == a \ b
empty == {}
filter(s, f(_)) == {x \in s: f(x)}
find(s, f(_)) == CHOOSE x \in s: f(x)
intersection(a, b) == a \intersect b
is_empty(s) == s = {}
is_finite(s) == IsFiniteSet(s)
len(s) == Cardinality(s)
map(s, f(_)) == {f(x): x \in s}
max(s) == CHOOSE x \in s : \A y \in s : x >= y
min(s) == CHOOSE x \in s : \A y \in s : x =< y
simmetric_difference(a, b) == (a \ b) \union (b \ a)
union(a, b) == a \union b

IsCorrect ==
    /\ add({1, 2}, 3) = {1, 2, 3}
    /\ add({}, 1) = {1}
    /\ all({2, 4, 6}, LAMBDA x: x % 2 = 0)
    /\ ~all({2, 3}, LAMBDA x: x % 2 = 0)
    /\ any({1, 2, 3}, LAMBDA x: x % 2 = 0)
    /\ ~any({1, 3}, LAMBDA x: x % 2 = 0)
    /\ empty = {}
Spec == []IsCorrect
====
