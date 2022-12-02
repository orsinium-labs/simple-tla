---- MODULE set ----
LOCAL INSTANCE FiniteSets
LOCAL INSTANCE Naturals

\* add an element into the set
\*
\* add(set[t], t) -> set[t]
add(s, e) == s \union {e}

\* get all possible subsets of a set
\*
\* all_subsets(set[t]) -> set[set[t]]
all_subsets(s) == SUBSET s

\* check if the function is true for all elements in the set
\*
\* all(set[t], f(t) -> bool) -> bool
all(s, f(_)) == \A e \in s : f(e)

\* check if the function is true for any element in the set
\*
\* any(set[t], f(t) -> bool) -> bool
any(s, f(_)) == \E e \in s : f(e)

\* check if the set contains the element
\*
\* contains(set[t], t) -> bool
contains(s, e) == e \in s

\* get elements of the first set that aren't in the second set
\*
\* difference(set[t], set[t]) -> set[t]
difference(a, b) == a \ b

\* an empty set
empty == {}

\* get a set that contains only elements from the set from which the function is true
\*
\* filter(set[t], f(t) -> bool) -> bool
filter(s, f(_)) == {x \in s: f(x)}

\* get an element from the set for which the function returns true.
\*
\* find(set[t], f(t) -> bool) -> t
find(s, f(_)) == CHOOSE x \in s: f(x)

\* get a set with elements that are in any of the given sets
\*
\* intersection(set[t], set[t]) -> set[t]
intersection(a, b) == a \intersect b

\* check if the set is empty
\*
\* is_empty(set[t]) -> bool
is_empty(s) == s = {}

\* check if the set is not infinite
\*
\* is_empty(set[t]) -> bool
is_finite(s) == IsFiniteSet(s)

\* check if the first set is a subset of the second set
\*
\* is_subset(set[t], set[t]) -> bool
is_subset(subset, set) == subset \subseteq set

\* get the number of elements in the set
\*
\* len(set[t]) -> nat
len(s) == Cardinality(s)

\* get set of results of applying the function to each element of the given set
\*
\* map(set[t], f(t) -> r) -> set[r]
map(s, f(_)) == {f(x): x \in s}

\* get the highest value from the set
\*
\* max(set[t]) -> t
max(s) == CHOOSE x \in s : \A y \in s : x >= y

\* get the lowest value from the set
\*
\* min(set[t]) -> t
min(s) == CHOOSE x \in s : \A y \in s : x =< y


\* get a set of integer numbers from a to b (inclusive)
\*
\* range(int, int) -> set[int]
range(a, b) == a .. b

\* get elements that are only in one of the sets but not in both
\*
\* simmetric_difference(set[t], set[t]) -> set[t]
simmetric_difference(a, b) == (a \ b) \union (b \ a)

\* get elements that are in both sets
\*
\* union(set[t], set[t]) -> set[t]
union(a, b) == a \union b

LOCAL S345 == {4, 3, 5}
LOCAL IsCorrect ==
    /\ add          ({}, 1) = {1}
    /\ add          ({1, 2}, 3) = {1, 2, 3}
    /\ all          ({2, 3}, LAMBDA x: x % 2 = 0) = FALSE
    /\ all          ({2, 4, 6}, LAMBDA x: x % 2 = 0) = TRUE
    /\ any          ({1, 2, 3}, LAMBDA x: x % 2 = 0) = TRUE
    /\ any          ({1, 3}, LAMBDA x: x % 2 = 0) = FALSE
    /\ filter       (S345, LAMBDA x: x % 2 = 1) = {3, 5}
    /\ intersection ({1, 2}, {2, 3}) = {2}
    /\ len          (S345) = 3
    /\ map          (S345, LAMBDA x: x * 2) = {6, 8, 10}
    /\ max          (S345) = 5
    /\ min          (S345) = 3
    /\ range        (4, 7) = {4, 5, 6, 7}
    /\ union        ({1, 2}, {2, 3}) = {1, 2, 3}
    /\ empty = {}
Spec == []IsCorrect
====
