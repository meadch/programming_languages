(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(* Write a function only_capitals that takes a string list and returns a string list that has only the strings in the argument that start with an uppercase letter. Assume all strings have at least 1 character. Use List.filter, Char.isUpper, and String.sub to make a 1-2 line solution. *)
val only_capitals = List.filter(fn (s) => Char.isUpper(String.sub(s, 0)))

 (* Write a function longest_string1 that takes a string list and returns the longest string in the list. If the list is empty, return "". In the case of a tie, return the string closest to the beginning of the list. Use foldl, String.size, and no recursion (other than the implementation of foldl is recursive). *)

 val longest_string1 = foldl(fn (s, longest) => if String.size(s) > String.size(longest) then s else longest) ""

 (* Write a function longest_string2 that is exactly like longest_string1 except in the case of ties it returns the string closest to the end of the list. Your solution should be almost an exact copy of `longest_string1`. Still use foldl and String.size. *)

 val longest_string2 = foldl(fn (s, longest) => if String.size(s) >= String.size(longest) then s else longest) ""

(* Write functions longest_string_helper, longest_string3, and longest_string4 such that:
    • longest_string3 has the same behavior as longest_string1 and longest_string4 has the same behavior as longest_string2.
    • longest_string_helper has type (int * int -> bool) -> string list -> string (notice the currying). This function will look a lot like longest_string1 and longest_string2 but is more general because it takes a function as an argument.
    • If longest_string_helper is passed a function that behaves like > (so it returns true exactly when its first argument is stricly greater than its second), then the function returned has the same behavior as longest_string1.
    • longest_string3 and longest_string4 are defined with val-bindings and partial applications of longest_string_helper. *)

fun longest_string_helper f = 
    fn lst => foldl(fn (s, result) => if f(String.size(s), String.size(result)) then s else result) "" lst
val longest_string3 = longest_string_helper op>
val longest_string4 = longest_string_helper op>=

(* Write a function longest_capitalized that takes a string list and returns the longest string in the list that begins with an uppercase letter, or "" if there are no such strings. Assume all strings have at least 1 character. Use a val-binding and the ML library’s o operator for composing functions. Resolve ties like in problem 2. *)

val longest_capitalized = longest_string3 o only_capitals

(* Write a function rev_string that takes a string and returns the string that is the same characters in reverse order. Use ML’s o operator, the library function rev for reversing lists, and two library functions in the String module. (Browse the module documentation to find the most useful functions.) *)
val rev_string = String.implode o List.rev o String.explode

(* Write a function first_answer of type (’a -> ’b option) -> ’a list -> ’b (notice the 2 arguments are curried). The first argument should be applied to elements of the second argument in order until the first time it returns SOME v for some v and then v is the result of the call to first_answer. If the first argument returns NONE for all list elements, then first_answer should raise the exception NoAnswer. Hints: Sample solution is 5 lines and does nothing fancy. *)
fun first_answer (f) = fn (lst) =>
  case lst of 
        []      => raise NoAnswer
      |x::rest => case f(x) of
                        SOME x => x
                      | NONE   => first_answer f rest

(* Write a function all_answers of type (’a -> ’b list option) -> ’a list -> ’b list option (notice the 2 arguments are curried). The first argument should be applied to elements of the second argument. If it returns NONE for any element, then the result for all_answers is NONE. Else the calls to the first argument will have produced SOME lst1, SOME lst2, ... SOME lstn and the result of all_answers is SOME lst where lst is lst1, lst2, ..., lstn appended together (order doesn’t matter). Hints: The sample solution is 8 lines. It uses a helper function with an accumulator and uses @. Note all_answers f [] should evaluate to SOME []. *)
fun all_answers (f) = fn (lst) =>
    let
      fun aux (lst, accum) =
       case lst of
          []      => SOME(accum)
        | x::rem  => let val res = f(x) in
          case res of
              NONE   => NONE
            | SOME x => aux(rem, accum @ x)
        end 
    in
        aux(lst, [])
    end

datatype pattern = Wildcard (*  Wildcard matches everything and produces the empty list of bindings. *)
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(* (a) Use g to define a function count_wildcards that takes a pattern and returns how many Wildcard patterns it contains. *)
fun count_wildcards (p) = g (fn () => 1) (fn (x) => 0) p
    
(* (b) Use g to define a function count_wild_and_variable_lengths that takes a pattern and returns the number of Wildcard patterns it contains plus the sum of the string lengths of all the variables in the variable patterns it contains. (Use String.size. We care only about variable names; the constructor names are not relevant.) *)
fun count_wild_and_variable_lengths (p) = g (fn () => 1) String.size p

(* (c) Use g to define a function count_some_var that takes a string and a pattern (as a pair) and returns the number of times the string appears as a variable in the pattern. We care only about variable names; the constructor names are not relevant. *)
fun count_some_var (s, p) = 
    g (fn () => 0) (fn (x) => if x = s then 1 else 0) p

(* Write a function check_pat that takes a pattern and returns true if and only if all the variables appearing in the pattern are distinct from each other (i.e., use different strings). The constructor names are not relevant. Hints: The sample solution uses two helper functions. The first takes a pattern and returns a list of all the strings it uses for variables. Using foldl with a function that uses @ is useful in one case. The second takes a list of strings and decides if it has repeats. List.exists may be useful. *)

val check_pat =
    let
      fun variable_names(p) =
        case p of
              Variable x => [x]
            | TupleP ps => foldl (fn (p', a) => a @ variable_names(p')) [] ps
            | ConstructorP(_,p) => variable_names p
            | _ => []
      fun no_repeats (lst) =
        case lst of 
             [] => true
            |x::rest => not(List.exists (fn (x') => x' = x) rest) andalso no_repeats(rest)
    in
      no_repeats o variable_names
    end

(* Write a function match that takes a valu * pattern and returns a (string * valu) list option, namely NONE if the pattern does not match and SOME lst where lst is the list of bindings if it does. Note that if the value matches but the pattern has no patterns of the form Variable s, then the result is SOME []. Hints: Sample solution has one case expression with 7 branches. The branch for tuples uses all_answers and ListPair.zip. Sample solution is 13 lines. Remember to look above for the rules for what patterns match what values, and what bindings they produce. These are hints: We are not requiring all_answers and ListPair.zip here, but they make it easier. *)

fun match (v, ptn) =
  case (v, ptn) of
      (v, Variable s) => SOME([(s, v)])
    | (_, Wildcard) => SOME([])
    | (Unit, UnitP) => SOME([])
    | (Const i, ConstP j) => if i = j then SOME([]) else NONE
    | (Constructor(i, v), ConstructorP(j, p)) => if i = j then match(v, p) else NONE
    | (Tuple(vals), TupleP(ptns)) => all_answers match (ListPair.zip(vals, ptns))
    | _ => NONE


(* Write a function first_match that takes a value and a list of patterns and returns a (string * valu) list option, namely NONE if no pattern in the list matches or SOME lst where lst is the list of bindings for the first pattern in the list that matches. Use first_answer and a handle-expression. Hints: Sample solution is 3 lines. *)

fun first_match v ptns =
  SOME( first_answer (fn (x) => match(v, x)) ptns ) handle NoAnswer => NONE