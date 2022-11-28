---- MODULE bool ----

\* true if both arguments are true
\*
\* and(bool, bool) -> bool
and(x, y) == x /\ y


\* true if all 3 arguments are true
\*
\* and3(bool, bool) -> bool
and3(x, y, z) == x /\ y /\ z

\* true if any argument is true
\*
\* or(bool, bool) -> bool
or(x, y) == x \/ y

\* true if any argument is true
\*
\* or3(bool, bool) -> bool
or3(x, y, z) == x \/ y \/ z

\* true if false, false if true
\*
\* not(bool, bool) -> bool
not(x) == ~x

\* true if only one argument is true
\*
\* xor(bool, bool) -> bool
xor(x, y) == x = ~y

\* true if either first is false or both are true
\*
\* implies(bool, bool) -> bool
implies(x, y) == x => y

IsCorrect ==
    /\ and(FALSE, FALSE) = FALSE
    /\ and(FALSE, TRUE) = FALSE
    /\ and(TRUE, FALSE) = FALSE
    /\ and(TRUE, TRUE) = TRUE
    /\ or(FALSE, FALSE) = FALSE
    /\ or(TRUE, FALSE) = TRUE
    /\ or(FALSE, TRUE) = TRUE
    /\ or(TRUE, TRUE) = TRUE
Spec == []IsCorrect
====
