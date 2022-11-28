---- MODULE temp ----

\* Check if the condition is always true (in all states).
\*
\* always(bool) -> bool
always(x) == []x

\* Check if the condition is eventually true (in at least one state)
\*
\* eventually(bool) -> bool
eventually(x) == <>x

\* if `a` is ever true, `b` must become true some time after that.
\*
\* leads_to(bool, bool) -> bool
leads_to(a, b) == a ~> b

\* Check if the value is the same as in previous state.
\*
\* unchanged(any) -> bool
unchanged(x) == x = x'

\* Check if the value is not the same as in previous state.
\*
\* has_changed(any) -> bool
has_changed(x) == UNCHANGED x

====
