# What is a compiler

1. from high-level language --> another language --> machine language
2. source language --> target language
3. ability to extract properties of a source program and transform it to construct a target program

## source-to-source compiers
1. transpiler or transcompiler
2. typically C-to-C
3. code transformation at source level
example: automattic parallelization, data layout transformations, ...
4. high-level intermediate representation

## Java JIT Compiler
1. the output is a class file (.class)
2. byte code

## Parallelizing compilers
1. input is a sequential code
2. output is parallel code, i.e., expose some kind of parallelism
3. typically, parallelism is extracted from loops
4. some parallelizing compilers enhance parallelization
5. form of parallelism
automatic vectorization(SIMD instructions), multi-threads, distributed memory

## Domain-Specific Languages(DSL)
1. input is a domain_specific-language(DSL)
2. assumptions(and restriction) on the input
3. examples:
openGL Shading Language, SQL for database, Halide for image processing

## Interpreter
1. reads a source program and produces the resluts of executing them

# Qualities
1. correct code
2. fast code
3. conforms to the specifications of the input language
4. consistent optimizations
5. works well with the debugger
6. good diagnostics
7. compilation time proportional to the size of source

## Principles 
1. preserve the meaning of the program being compiled
2. improve the surce code in some way
3. speed of compiled code
4. space
5. feedback
6. debugging
7. compilation time efficiency


# Structure
## General Compiler Structure
![alt tag](http://oga6pysjo.bkt.gdipper.com/structure-of-compilers.jpg)
1. **Front-end** performs the analysis of the source language

	* recognizes legal and illegal programs and reports errors
	* understands the input program and collects its semantics in an Intermediate Representation (IR)
	* produces IR and shapes the code for the back-end
	
2. **Back-end** does the target language synthesis

	* chooses instructions to implement each IR operation
	* translates IR into target code
	* needs to conform with system interfaces
	* automation has been less successful

## mxn compilers with m+n components
![alt tag](http://oga6pysjo.bkt.gdipper.com/image/Course-Compiler-Design/mxn-compilers.jpg)

1. All language-specific knowledge must be encoded in the front-end
2. All target-specific knowledge must be encoded in the back-end

# General process
## Lexical analysis
1. Reads characters in the source program and groups them into words (basic unit of syntax)
2. Produces words and recognizes what sort they are
3. The output is called token and is a pair of the form <type,lexeme> or <token_class, attribute>
E.g.: a=b+c becomes <id,a> <=,> <id,b> <+,> <id,c>
4. Needs to record each id attribute: keep a symbol table
Lexical analysis eliminates white space, etc
5. Speed is important - use a specialized tool
Flex: a tool for generating scanners: programs which recognize lexical patterns in text

## Syntax analysis(Parsing)
1. Imposes a hierarchical structure on the token stream
2. This hierarchical structure is usually expressed by recursive rules
3. Context-free grammars formalise these recursive rules and guide syntax analysis

### Parsing
1. Parsing tree for b\*b-4\*a\*c
![alt tag](http://oga6pysjo.bkt.gdipper.com/image/Course-Compiler-Design/parsing-tree.jpg)

### Abstract syntax tree(AST)
1. AST for b\*b-4\*a\*c
![alt tag](http://oga6pysjo.bkt.gdipper.com/image/Course-Compiler-Design/AST.jpg)
1. an AST is a more useful ata structure for internal representations
2. It is a compressed version of the parse tree
3. ASTs are form of IR

## Semantic analysis(Contex handling)
1. Collects context(semantic) information, checks for semantic errors, and annotates nodes of the tree with the results
2. Examples:

	* type checking: report error if an operator is applied to an incompatible operand
	* check flow-of-controls
	* uniqueness or name-related checks

## Intermediate code generation
1. Translate language-specific constructs in AST into more general constructs
2. A criterion for the level of "generality": it should be straightforward to generate the target code from the intermidiate representation chosen

## Code optimization
1. Optimizations can range from trivial(e.g., constant folding) to highly sophisticated(e.g., inlining)
2. Modern compilers perform such a range of optimizations, that one could argue for:
![alt tag](http://oga6pysjo.bkt.gdipper.com/image/Course-Compiler-Design/code-optimization.jpg)

