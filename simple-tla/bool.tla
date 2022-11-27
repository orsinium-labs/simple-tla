---- MODULE bool ----
and(x, y) == x /\ y
and3(x, y, z) == x /\ y /\ z
or(x, y) == x \/ y
or3(x, y, z) == x \/ y \/ z
not(x) == ~x
xor(x, y) == x = ~y
implies(x, y) == x => y

IsCorrect ==
    /\ and(TRUE, FALSE) = FALSE
    /\ and(TRUE, TRUE) = TRUE
    /\ or(TRUE, FALSE) = TRUE
    /\ or(FALSE, FALSE) = FALSE
Spec == []IsCorrect
====
