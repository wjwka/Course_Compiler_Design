# Syntax Analysis
## Limits of RE
1. cannot describe all languages
2. non-terminal symbol cannot be used before it haas been fully defined
3. Chomsky
4. Example
  * is the folling language regular?
    1. B = { 0^N1^N | N > 0}
  * Observations
    1. it requires counting
    2. which is beyond the capabilities of RE and FSM
    3. B is Context-Free but **not** Regular
5. The Pumping Lemma for Regular Languages

# Context Free Grammar(CFG)
1. Contex-Free syntax is specified with a context-free grammar
2. A CFG G is a 4-tuple, G=(S,N,T,P), where:
  * S: starting symbols
  * N: set of non-terminal symbols
  * T: set of terminal symbols
  * P: set of production rules
3. Parsing: the process of discovering a dervation
4. Example: CatNoise Grammar
  * Production rules:
    1. CatNoise -> CatNoise meow      (a)
    2. 		| meow                (b)
    3. Head or left-side: the non-terminal to be replaced
    4. Body or right-side: the replacing string of grammar symbols
  * We can use the CatNoise grammar to create sentences
  * The sequence of rewrites is called a **derivation(=>)**
    1. Starting with the start-nonterminal of a grammar
    2. The process of discovering a derivation for some sentences is called **parsing**
    3. e.g. CatNoise => meow
    3. e.g. CatNoise => CatNoise meow => meow meow
    3. e.g. CatNoise => CatNoise meow => CatNoise meow meow => meow meow meow

# Derivation
5. Derivation
  * Derivation: a sequence of derivation steps
    1. at each step, we choose a non-terminal to replace
    2. and a production with that non-terminal as head
  * Different choices
  * Two derivations are of interest
    1. Leftmost derivation
    2. Rightmost derivation
6. Derivation Example
  * CFG: E -> E + E | E * E | -E | (E) | id
  * we have 2 possible derivations
    1. E => -E => -(E) => -(E+E) => -(id+E) => -(id+id)
    2. E => -E => -(E) => -(E+E) => -(E+id) => -(id+id)
  * Note that each non-terminal is replaced with the same body, but the order of replacement is different
7. => means derive in one step(a derives b)
8. =>\*  means derive in several steps
8. =>\+  means derive in at least one step

# Parse Tree
1. A **parse tree** is a graphical representation for a derivation that filters out the choice regarding the replacement order
  * The leaves of the tree(read from left to rigt) constitute a **sentential form**(or *fringe*, )
  *

# Ambiguity
