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

\* increment the value
\*
\* inc(int) -> int
inc(x) == x + 1

\* check if the value is even (divisible by 2)
\*
\* is_even(int) -> bool
is_even(x) == x % 2 = 0

\* check if the value is odd (not divisible by 2)
\*
\* is_odd(int) -> bool
is_odd(x) == x % 2 = 0

\* check if value is integer (a whole number)
\*
\* is_int(any) -> bool
is_int(x) == x \in Int

\* check if value is a natural number (0, 1, 2, ...)
\*
\* is_nat(any) -> bool
is_nat(x) == x \in Int /\ x > -1

\* check if value is zero
\*
\* is_zero(int) -> bool
is_zero(x) == x = 0

\* check if a is less than b.
\*
\* lt(int, int) -> bool
lt(a, b)  == a < b

\* check if a is less than or equal to b.
\*
\* lte(int, int) -> bool
lte(a, b) == a \leq b

\* get tle highest value out of two given
\*
\* max(int, int) -> int
max(a, b) == IF a > b THEN a ELSE b

\* get tle lowest value out of two given
\*
\* min(int, int) -> int
min(a, b) == IF a < b THEN a ELSE b

\* the remainder of modulus division
\*
\* mod(int, int) -> int
mod(a, b) == a % b

\* multiply the arguments
\*
\* mul(int, int) -> int
mul(a, b) == a * b

\* check if arguments are equal
\*
\* ne(int, int) -> bool
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

LOCAL IsCorrect ==
    /\ add      (3, -4) = -1
    /\ add      (3, 4) = 7
    /\ is_int   (2) = TRUE
    /\ is_nat   (-2) = FALSE
    /\ is_nat   (2) = TRUE
    /\ max      (3, 5) = 5
    /\ max      (5, 3) = 5
    /\ min      (3, 5) = 3
    /\ min      (5, 3) = 3
    /\ neg      (3) = -3
    /\ mul      (5, 6) = 30
    /\ pow      (2, 3) = 8
    /\ sub      (4, 7) = -3
    /\ sub      (5, 3) = 2
Spec == []IsCorrect
====
