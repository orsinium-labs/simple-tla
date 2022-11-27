---- MODULE int ----
LOCAL INSTANCE Naturals

add(a, b) == a + b
sub(a, b) == a - b
mul(a, b) == a * b
pow(a, b) == a ^ b
eq(a, b)  == a = b
ne(a, b)  == a # b
lt(a, b)  == a < b
gt(a, b)  == a > b
lte(a, b) == a \leq b
gte(a, b) == a \geq b
div(a, b) == a \div b
mod(a, b) == a % b
neg(a) == 0 - a

IsCorrect ==
    /\ add(3, 4) = 7
    /\ sub(5, 3) = 2
    /\ mul(5, 6) = 30
    /\ pow(2, 3) = 8
Spec == []IsCorrect
====
