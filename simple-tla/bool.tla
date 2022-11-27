---- MODULE bool ----
and(x, y) == x /\ y
and3(x, y, z) == x /\ y /\ z
or(x, y) == x \/ y
or3(x, y) == x \/ y \/ z
not(x) == ~x
xor(x, y) == x = ~y
implies(x, y) == x => y
====
