## Functions
```
# let <name> <parameter> = <expression>;;

```

### Anonymous Function
```
# let max x y = if x > y then x else y;;
```
It is an anonymous function, meaning that anything can come in as input.
For example, 
```
# let x = 10 and y = 7 in
  max x y;;
- : int = 10
# let a = 'a' and b = 'b' in
  max a b;;
- : char = 'b'
```

A Function is a 'value' that represents the function.
```
# fun x y -> if x > y then x else y;;
- : 'a -> 'a -> 'a = <fun>
```
In order to use this function, 
```
# (fun x y -> if x > y then x else y) 4 5;;
- : int = 5
```
We can give a name to a function.
```
# let max : fun x y -> if x > y then x else y;;
val max : 'a -> 'a -> 'a = <fun>

# max 4 5;;
- : int = 5
```

### Polymorphic Functions
Function that can have parameters of different types
Usually avoid having arithmetic functions inside them

### Higher Order Functions
Functions that take other functions as parameter or returns a function as output
```
# let my_function f x y = f x y;;

# my_function (fun x y -> if x > y then x else y) 5 6;;
- : int = 6

# my_function max 8 9;;
- : int = 9
```

### Currying
Even when we pass multiple variables as parameter, what happens is the function receives only one value and a chain of function gets created in the background that only receives one values as input.
Currying is the technique of transforming a function that takes multiple arguments in such a way that it can be called a chain of functions, each with a single argument.
```
# let multiply x y = x * y;;
# multiply 5 6;;
- : int = 30
# (multiply 5) 6;;
- : int = 30

# let multiply5 = multiply 5;;
# multiply5 6;;
- : int 30
```

## Variables
```
# let x = 10;;
# x;;
- : int = 10
```
The value of x does not change

```
# let y = ref 10;;
# y;;
- : int ref = {contents = 10}
# !y;;
- : int = 10
```
The Value of Mutable Variables can change
```
# y := 7;;
# y;;
- : int ref = {contents = 7}
# !y;;
- : int = 7
```

## Tuples
An n-tuple is an ordered sequence of n values
The order of components is very important
n can be 0, which gives the empty tuple (). This is called "unit" in OCaml.
```
# let fst_of_3tuple (a, b, c) = a;;
val fst_of_3tuple : 'a * 'b * 'c -> 'a = <fun>
# fst_of_3tuple (44, "hi", true);;
- : int = 44
```

## Pattern Matching
- match <expression> with <match>
- match <expression> with
	<pattern 1> -> <expression 1> |
	<pattern 2> -> <expression 2> |
	...
	<pattern N> -> <expression N>
```
# let int_to_month i = 
	match i with
	  1 -> "Jan"
	| 2 -> "Feb"
	| 3 -> "Mar"
	| 4 -> "Apr"
	| 5 -> "May"
	| 6 -> "Jun"
	| 7 -> "Jul"
	| 8 -> "Aug"
	| 9 -> "Sep"
	| 10 -> "Oct"
	| 11 -> "Nov"
	| 12 -> "Dec"
	| _ -> "None"
	;;
```
The type of the input variable and output variable can be specified.
```
# let int_to_month (i : int) : string = 
```

## Recursive Functions
Recursive functions must include the keyword "rec"
```
# let rec fibonacci n = 
  if n < 2 then
    1
  else
    fibonacci(n-1) + fibonacci(n-2)
  ;;
```
or with pattern matching, 
```
# let rec fibonacci x = 
  match x with
    0 -> 1
  | 1 -> 1
  | n -> fibonacci(x-1) + fibonacci(x-2)
  ;;
```
Another form of patter matching is
```
# let rec fibonacci = function
    0 -> 1
  | 1 -> 1
  | n -> fibonacci(n-1) + fibonacci(n-2)
  ;;
```

### Mutually Recursive Functions
Mutually Recursive Functions depend on each other for definition. 
Hence mutually recursive functions must be defined simultaneously. 
```
# let rec fun1 x = 
  match x with
    0 -> "zero"
  | _ -> fun2 x
  and
  fun2 y = 
  match y with
    1 -> "one"
  | _ -> fun1(y-1)
  ;;
```

## Compiling
- "ocamlc" is the bytecode compiler
	Slower, but works on different architectures
```
ocamlc -o file file.ml
```
- "ocamlopt" is the native code compiler
	Faster, but works only on the native architecture
```
ocamlopt -o file file.ml
```

