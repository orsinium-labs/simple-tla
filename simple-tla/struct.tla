---- MODULE struct ----

get(s, k) == s[k]
keys(s) == DOMAIN s
to_set(s) == { s[i] : i \in DOMAIN s }
====
