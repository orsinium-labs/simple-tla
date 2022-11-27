---- MODULE set ----
LOCAL INSTANCE FiniteSets

add(s, e) == s \union {e}
contains(s, e) == e \in s
difference(a, b) == a \ b
empty() == {}
filter(s, f) == {x \in s: f(x)}
find(s, f) == CHOOSE x \in s: f(x)
intersection(a, b) == a \intersect b
is_empty(s) == s = {}
is_finite(s) == IsFiniteSet(s)
len(s) == Cardinality(s)
map(s, f) == {f(x): x \in s}
max(s) == CHOOSE x \in s : \A y \in s : x >= y
min(s) == CHOOSE x \in s : \A y \in s : x =< y
simmetric_difference(a, b) == (a \ b) \union (b \ a)
union(a, b) == a \union b
====
