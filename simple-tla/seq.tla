---- MODULE seq ----
LOCAL INSTANCE Sequences
LOCAL INSTANCE Naturals


\* check if the function is true for all elements
\*
\* all(seq[t], f(t) -> bool) -> bool
all(s, f(_)) == \A e \in { s[i] : i \in DOMAIN s } : f(e)

\* check if the function is true for any element
\*
\* any(seq[t], f(t) -> bool) -> bool
any(s, f(_)) == \E e \in { s[i] : i \in DOMAIN s } : f(e)

\* add the element at the end of the sequence
\*
\* append(seq[t], t) -> seq[t]
append(s, e) == s \o <<e>>

\* check if the element is in the sequence
\*
\* contains(seq[t], t) -> bool
contains(s, e) == \E i \in 1..Len(s) : s[i] = e

\* an empty sequence
empty == <<>>

\* join sequences
\*
\* extend(seq[t], seq[t]) -> seq[t]
extend(s1, s2) == s1 \o s2

\* get elements from the sequence for which the function returns true
\*
\* filter(seq[t], f(t) -> bool) -> seq[t]
filter(s, f(_)) == SelectSeq(s, f)

\* get an element from the sequence by its index (starting from 1).
\*
\* get(seq[t], nat) -> t
get(s, i) == s[i]

\* get the first element of the sequence
\*
\* head(seq[t]) -> t
head(s) == s[1]
first(s) == s[1]

\* get index of the first occurence of the element in the sequence
\*
\* index_of(seq[t], t) -> nat
index_of(s, e) == CHOOSE i \in 1..Len(s): s[i] = e

\* insert the element at the given index
\*
\* insert_at(seq[t], nat, t) -> seq[t]
insert_at(s, i, e) == SubSeq(s, 1, i-1) \o <<e>> \o SubSeq(s, i, Len(s))

\* check if the sequence is empty
\*
\* is_empty(seq[t], ) -> bool
is_empty(s) == s = <<>>

\* check if all elements of the sequence are unique
\*
\* is_unique(seq[t], ) -> bool
is_unique(s) == \A i, j \in 1..Len(s) : i # j => s[i] # s[j]

\* get the last element of the sequence
\*
\* last(seq[t], ) -> t
last(s) == s[Len(s)]

\* get the number of elements in the sequence
\*
\* len(seq[t]) -> nat
len(s) == Len(s)

\* apply function to all elements of sequence and return sequence of results
\*
\* map(seq[t], f(t) -> r) -> seq[r]
map(s, f(_)) == LET res[i \in 1..Len(s)] == f(s[i]) IN res

\* get the highest value from the sequence
\*
\* max(seq[t]) -> t
max(s) ==
    LET items == { s[i] : i \in DOMAIN s }
    IN CHOOSE x \in items : \A y \in items : x >= y

\* get the lowest value from the sequence
\*
\* min(seq[t]) -> t
min(s) ==
    LET items == { s[i] : i \in DOMAIN s }
    IN CHOOSE x \in items : \A y \in items : x =< y

\* make a new sequence containing the two given elements
\*
\* pair(t, t) -> seq[t]
pair(a, b) == <<a, b>>

\* add an element at the beginning of the sequence
\*
\* prepend(seq[t], t) -> seq[t]
prepend(s, e) == <<e>> \o s

\* multiply together all numbers in the sequence
\*
\* prod(seq[int]) -> int
RECURSIVE prod(_)
prod(s) == IF s = <<>> THEN 1 ELSE s[1] * prod(Tail(s))

\* apply function accumulatively to all elements in sequence
\*
\* reduce(seq[e], a, f(a, e) -> a) -> a
reduce(s, acc, f(_, _)) ==
    IF s = <<>> THEN acc ELSE
    LET
        size == Len(s)
        reduced[i \in 1..size] ==
          IF i = 1 THEN f(acc, s[i])
          ELSE f(reduced[i-1], s[i])
    IN reduced[size]

\* remove an element at the given index
\*
\* remove_at(seq[t], nat) -> seq[t]
remove_at(s, i) == SubSeq(s, 1, i-1) \o SubSeq(s, i+1, Len(s))

\* remove all occurences of the value from the sequence
\*
\* remove_all(seq[t], t) -> seq[t]
remove_all(s, e) == SelectSeq(s, LAMBDA t: t # e)

\* replace all occurences of the value in the sequence with another value
\*
\* replace_all(seq[t], t, t) -> seq[t]
replace_all(s, old, new) == [i \in 1 .. Len(s) |-> IF s[i] = old THEN new ELSE s[i]]

\* replace the element at the given index (1-indexed) with the given value
\*
\* replace_at(seq[t], nat, t) -> seq[t]
replace_at(s, i, e) == [s EXCEPT ![i] = e]

\* reverse the sequence
\*
\* reverse(seq[t]) -> seq[t]
reverse(s) == [ i \in 1..Len(s) |-> s[(Len(s) - i) + 1] ]

\* get all elements in the sequence from the given index to the given index
\*
\* slice(seq[t], nat, nat) -> seq[t]
slice(s, from, to) == SubSeq(s, from, to)

RECURSIVE sort(_)
sort(s) ==
    IF Len(s) < 2 THEN s ELSE LET
        items == { s[i] : i \in DOMAIN s }
        i == CHOOSE i \in DOMAIN s : \A x \in items : x >= s[i]
        new == SubSeq(s, 1, i-1) \o SubSeq(s, i+1, Len(s))
    IN <<s[i]>> \o sort(new)

\* add together all numbers in the sequence
\*
\* sum(seq[int]) -> int
RECURSIVE sum(_)
sum(s) == IF s = <<>> THEN 0 ELSE s[1] + sum(Tail(s))

\* get all elements of the sequence except the first one
\*
\* tail(seq[t]) -> seq[t]
tail(s) == Tail(s)

\* convert the sequence to a set
\*
\* to_set(seq[t]) -> set[t]
to_set(s) == { s[i] : i \in DOMAIN s }

\* return a sequence of pairs of passed elements
\*
\* zip(seq[t], seq[t]) -> seq[seq[t]]
zip(a, b) ==
    LET stop == IF Len(a) <= Len(b) THEN Len(a) ELSE Len(b)
    IN  [ i \in 1 .. stop |-> <<a[i], b[i] >> ]

LOCAL S456 == <<4, 5, 6>>
LOCAL IsCorrect ==
    /\ all          (<<2, 3, 6>>, LAMBDA x: x % 2 = 0) = FALSE
    /\ all          (<<2, 4, 6>>, LAMBDA x: x % 2 = 0) = TRUE
    /\ any          (<<1, 3, 5>>, LAMBDA x: x % 2 = 0) = FALSE
    /\ any          (<<2, 3, 6>>, LAMBDA x: x % 2 = 0) = TRUE
    /\ any          (<<2, 4, 6>>, LAMBDA x: x % 2 = 0) = TRUE
    /\ append       (<<1, 2>>, 3)   = <<1, 2, 3>>
    /\ contains     (<<1, 2>>, 3)   = FALSE
    /\ contains     (<<1, 3>>, 3)   = TRUE
    /\ extend       (<<1, 2>>, <<3, 4>>) = <<1, 2, 3, 4>>
    /\ first        (S456)          = 4
    /\ get          (<<3, 4>>, 2)   = 4
    /\ head         (S456)          = 4
    /\ index_of     (S456, 5)       = 2
    /\ is_empty     (<<>>)          = TRUE
    /\ is_empty     (<<1, 2>>)      = FALSE
    /\ last         (S456)          = 6
    /\ len          (S456)          = 3
    /\ map          (<<>>, LAMBDA x: x*2) = <<>>
    /\ map          (S456, LAMBDA x: x*2) = <<8, 10, 12>>
    /\ max          (<<4, 5, 3>>)   = 5
    /\ min          (<<4, 3, 5>>)   = 3
    /\ pair         (3, 4)          = <<3, 4>>
    /\ prepend      (<<1, 2>>, 3)   = <<3, 1, 2>>
    /\ prod         (<<4, 5, 2>>)   = 40
    /\ reduce       (<<>>, 0, +)    = 0
    /\ reduce       (S456, 0, +)    = 15
    /\ remove_all   (<<4, 5, 4, 6>>, 4) = <<5, 6>>
    /\ remove_at    (S456, 2)       = <<4, 6>>
    /\ replace_all  (<<4, 5, 4, 6>>, 4, 7) = <<7, 5, 7, 6>>
    /\ replace_at   (S456, 2, 7)    = <<4, 7, 6>>
    /\ reverse      (S456)          = <<6, 5, 4>>
    /\ sort         (<<>>)          = <<>>
    /\ sort         (<<1>>)         = <<1>>
    /\ sort         (<<3, 1>>)      = <<1, 3>>
    /\ sort         (<<4, 6, 5>>)   = S456
    /\ sort         (S456)          = S456
    /\ sum          (S456)          = 15
    /\ tail         (S456)          = <<5, 6>>
    /\ to_set       (S456)          = {4, 5, 6}
Spec == []IsCorrect

====
