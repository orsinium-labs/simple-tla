---- MODULE seq ----
LOCAL INSTANCE Sequences

append(s, e) == s \o <<e>>
contains(s, e) == \E i \in 1..Len(s) : s[i] = e
empty() == <<>>
extend(s1, s2) == s1 \o s2
filter(s, f) == SelectSeq(s, f)
first(s) == s[1]
head(s) == s[1]
insert_at(s, i, e) == SubSeq(s, 1, i-1) \o <<e>> \o SubSeq(s, i, Len(s))
is_empty(s) == s = <<>>
is_unique(s) == \A i, j \in 1..Len(s) : i # j => s[i] # s[j]
last(s) == s[Len(s)]
len(s) == Len(s)
prepend(s, e) == <<elt>> \o seq
range(a, b) == a .. b
remove_at(s, i, e) == SubSeq(s, 1, i-1) \o SubSeq(s, i+1, Len(s))
remove(s, e) == SelectSeq(s, LAMBDA t: t # e)
replace_all(s, old, new) == [i \in 1 .. Len(s) |-> IF s[i] = old THEN new ELSE s[i]]
replace_at(s, i, e) == [s EXCEPT ![i] = e]
reverse(s) == [ i \in 1..Len(s) |-> s[(Len(s) - i) + 1] ]
slice(s, from, to) == SubSeq(s, from, to)
tail(s) == Tail(s)
to_set(s) == { s[i] : i \in DOMAIN s }
tuple(a, b) == <<a, b>>
zip(a, b) ==
    LET stop == IF Len(s) <= Len(t) THEN Len(s) ELSE Len(t)
    IN  [ i \in 1 .. stop |-> <<s[i], t[i] >> ]
====