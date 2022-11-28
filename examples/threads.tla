---- MODULE threads ----
EXTENDS TLC, Sequences, Integers, init

NumThreads == 2
Threads == seq!range(1, NumThreads)

VARIABLES counter, pc

AllDone ==
  seq!all(Threads, LAMBDA t: pc[t] = "Done")

Correct ==
    bool!implies(AllDone, int!eq(counter, NumThreads))


vars == << counter, pc >>

ProcSet == (Threads)

Init ==
    /\ int!is_zero(counter)
    /\ pc = [self \in ProcSet |-> "IncCounter"]

IncCounter(self) ==
    /\ pc[self] = "IncCounter"
    /\ counter' = int!inc(counter)
    /\ pc' = [pc EXCEPT ![self] = "Done"]

thread(self) == IncCounter(self)

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating ==
    /\ seq!all(ProcSet, LAMBDA self: pc[self] = "Done")
    /\ UNCHANGED vars

Next ==
    \/ seq!any(Threads, thread)
    \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == temp!eventually(
    seq!all(ProcSet, LAMBDA self: pc[self] = "Done")
)

====
