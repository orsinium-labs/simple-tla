---- MODULE int ----
LOCAL INSTANCE Integers

\* get absolute value of argument
\*
\* abs(int) -> int
abs(a) == IF a > 0 THEN a ELSE -a

\* add two numbers together
\*
\* add(int, int) -> int
add(a, b) == a + b

\* divide a by b and return the rounded down result
\*
\* div(int, int) -> int
div(a, b) == a \div b

\* check if values are equal
\*
\* eq(int, int) -> bool
eq(a, b)  == a = b

\* check if a is greater than b.
\*
\* gt(int, int) -> bool
gt(a, b)  == a > b

\* check if a is greater than or equal to b.
\*
\* gte(int, int) -> bool
gte(a, b) == a \geq b

\* check if value is integer (a whole number)
is_int(x) == x \in Int

\* check if value is a natural number (0, 1, 2, ...)
is_nat(x) == x \in Int /\ x > -1

\* check if a is less than b.
\*
\* lt(int, int) -> bool
lt(a, b)  == a < b

\* check if a is less than or equal to b.
\*
\* lte(int, int) -> bool
lte(a, b) == a \leq b

\* the remainder of modulus division
\*
\* mod(int, int) -> int
mod(a, b) == a % b

\* multiply the arguments
\*
\* mul(int, int) -> int
mul(a, b) == a * b

\* multiply the arguments
\*
\* mul(int, int) -> int
ne(a, b)  == a # b

\* negate the number
\*
\* neg(int) -> int
neg(a) == 0 - a

\* power
\*
\* pow(int, int) -> int
pow(a, b) == a ^ b

\* substract b from a
\*
\* sub(int, int) -> int
sub(a, b) == a - b

IsCorrect ==
    /\ add(3, -4) = -1
    /\ add(3, 4) = 7
    /\ is_int(2)
    /\ is_nat(2)
    /\ ~is_nat(-2)
    /\ mul(5, 6) = 30
    /\ pow(2, 3) = 8
    /\ sub(4, 7) = -3
    /\ sub(5, 3) = 2
Spec == []IsCorrect
====
