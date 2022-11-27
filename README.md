# simple-tla

Simple TLA is a collection of useful "operators" (functions) to make TLA+ easier to learn and to use.

+ The goal is to abstract away obscure operators, symbols, and syntax and provide primitives that languages like Elixir or Python provide out-of-the-box.
+ The idea is inspired by Clojure and LISP-like languages that sell the idea of keeping the language syntax to the minimum. While I cautious of that idea in general, it works great for TLA+ because it has very alienating syntax, and so trimming down that syntax is a good idea.
+ The target audience are people who are more engineers than mathematicians. I want to make TLA+ more similar to other modern programming languages, or at least less diffferent, without writing my own DSL.

## Installation

TLA+ doesn't have a package manager. So, installation is a bit tricky. Follow instruction from [CommunityModules](https://github.com/tlaplus/CommunityModules): [How to use it](https://github.com/tlaplus/CommunityModules#how-to-use-it).

## Usage

```tla
EXTENDS init

bool!and(TRUE, FALSE)
```

What happens there:

1. `EXTENDS init` will extend the current namespace with all modules provided by simple-tla. You cna find all the modules in [simple-tla](./simple-tla/) directory.
1. `bool` is the module name you want to use.
1. `!` is like `.` in other languages (or `:` in some). Use it to get a definition from a module.
1. `and` is the function name to call.
1. `(TRUE, FALSE)` is calling the function with 2 arguments.

## See also

+ [Learn TLA+](https://learntla.com/index.html): the best place to learn TLA+.
+ [tlacli](https://github.com/hwayne/tlacli): the tool we use to run tests.
+ [CommunityModules](https://github.com/tlaplus/CommunityModules): the source of some more complex functions.
+ [StandardModules](https://github.com/tlaplus/tlaplus/tree/master/tlatools/org.lamport.tlatools/src/tla2sany/StandardModules): the source code of TLA+ stdlib modules.
