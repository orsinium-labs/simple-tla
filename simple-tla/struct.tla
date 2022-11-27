---- MODULE struct ----

\* Doesn't work yet. Why?

get_(s, k) == s[k]
keys(s) == DOMAIN s
to_set(s) == { s[i] : i \in DOMAIN s }

IsCorrect ==
    get_([a |-> {}, b |-> {}], 1) = 2
    \* /\ get([a |-> 1, b |-> 2], 1) = 1
Spec == []IsCorrect

====
