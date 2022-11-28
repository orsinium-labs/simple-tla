---- MODULE seq ----
LOCAL INSTANCE Sequences
LOCAL INSTANCE Naturals


\* check if the function is true for all elements
\*
\* all(seq[t], f(t) -> bool) -> bool
all(s, f(_)) == \A e \in s : f(e)

\* check if the function is true for any element
\*
\* any(seq[t], f(t) -> bool) -> bool
any(s, f(_)) == \E e \in s : f(e)

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

\* make a new sequence containing the two given elements
\*
\* pair(t, t) -> seq[t]
pair(a, b) == <<a, b>>

\* add an element at the beginning of the sequence
\*
\* prepend(seq[t], t) -> seq[t]
prepend(s, e) == <<e>> \o s

\* get a sequence of integer number from a to b (inclusive)
\*
\* range(int, int) -> seq[int]
range(a, b) == a .. b

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

IsCorrect ==
    /\ append   (<<1, 2>>, 3)   = <<1, 2, 3>>
    /\ prepend  (<<1, 2>>, 3)   = <<3, 1, 2>>
    /\ len      (<<4, 5, 6>>)   = 3
    /\ first    (<<4, 5, 6>>)   = 4
    /\ head     (<<4, 5, 6>>)   = 4
    /\ last     (<<4, 5, 6>>)   = 6
    /\ reverse  (<<4, 5, 6>>)   = <<6, 5, 4>>
    /\ tail     (<<4, 5, 6>>)   = <<5, 6>>
Spec == []IsCorrect

====
