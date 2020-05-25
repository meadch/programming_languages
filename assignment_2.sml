
(* helpers *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun some(xs, f) =
    case xs of 
        [] => false
        |x::rest => f(x) orelse some(rest, f)

fun filter(xs, f) = 
    case xs of
        [] => []
        | x::rest => if f(x) then x::filter(rest, f) else filter(rest, f)

fun map (xs, f) =
    case xs of
         [] => []
        |x::xs' => f(x)::map(xs', f)

(* types *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank
datatype color = Red | Black
datatype move = Discard of card | Draw 

(* Exceptions *)
exception IllegalMove

(* 1. This problem involves using first-name substitutions to come up with alternate names. For example, Fredrick William Smith could also be Fred William Smith or Freddie William Smith. Only part (d) is specifically about this, but the other problems are helpful. *)

(* (a) Write a function all_except_option, which takes a string and a string list. Return NONE if the string is not in the list, else return SOME lst where lst is identical to the argument list except the string is not in it. You may assume the string is in the list at most once. Use same_string, provided to you, to compare strings. Sample solution is around 8 lines. *)
(* val all_except_option = fn : string * string list -> string list option *)
fun all_except_option(x, xs) = 
    if some(xs, fn (y) => same_string(x, y))
    then SOME(filter(xs, fn (y) => not(same_string(x, y))))
    else NONE

(* (b) Write a function get_substitutions1, which takes a string list list (a list of list of strings, the substitutions) and a string s and returns a string list. The result has all the strings that are in some list in substitutions that also has s, but s itself should not be in the result. *)
(* val get_substitutions1 = fn : string list list * string -> string list *)
fun get_substitutions1(substitutions, s) =
    case substitutions of
        [] => []
        | xs::rest => case all_except_option(s, xs) of
                                NONE => get_substitutions1(rest, s)
                                | SOME(filtered) => filtered @ get_substitutions1(rest, s)

(* (c) Write a function get_substitutions2, which is like get_substitutions1 except it uses a tail-recursive local helper function. *)
(* val get_substitutions2 = fn : string list list * string -> string list *)
fun get_substitutions2(substitutions, s) =
    let 
        fun aux(substitutions, result) = 
            case substitutions of
                [] => result
                | xs::rest => case all_except_option(s, xs) of
                      NONE => aux(rest, result)
                    | SOME(filtered) => aux(rest, result @ filtered)
    in
        aux(substitutions, [])
    end

(* (d) Write a function similar_names, which takes a string list list of substitutions (as in parts (b) and (c)) and a full name of type {first:string,middle:string,last:string} and returns a list of full names (type {first:string,middle:string,last:string} list). The result is all the full names you can produce by substituting for the first name (and only the first name) using substitutions and parts (b) or (c). The answer should begin with the original name (then have 0 or more other names). *)
fun similar_names (args) =
    case args of
        ([],fullname) => [fullname]
        | (substitutions, { first=f, middle=m, last=l }) => 
            { first=f, middle=m, last=l }::map(get_substitutions2(substitutions, f), fn (s) => { first=s, middle=m, last=l })

(* 2. This problem involves a solitaire card game invented just for this question. *)
(* (a) Write a function card_color, which takes a card and returns its color (spades and clubs are black, diamonds and hearts are red). Note: One case-expression is enough. *)
fun card_color (suit, _) =
    case (suit) of
          Clubs    => Black
        | Spades   => Black
        | Diamonds => Red
        | Hearts   => Red

(* Write a function card_value, which takes a card and returns its value (numbered cards have their number as the value, aces are 11, everything else is 10). Note: One case-expression is enough. *)
fun card_value (_, rank) =
    case (rank) of
          Num(i)  => i
        | Ace     => 11
        | _       => 10 (* Handles Jack, Queen, King *)

(* Write a function remove_card, which takes a list of cards cs, a card c, and an exception e. It returns a list that has all the elements of cs except c. If c is in the list more than once, remove only the first one. If c is not in the list, raise the exception e. You can compare cards with =. *)
fun remove_card (cs, c, e) =
    let 
        fun all_except(cs) =
            case cs of 
                  []      => []
                | c'::rem => if c' = c then rem else c'::all_except(rem)
    in
        if not(some(cs, fn (c') => c = c'))
        then raise IllegalMove
        else all_except(cs)
    end

(* (d) Write a function all_same_color, which takes a list of cards and returns true if all the cards in the list are the same color. Hint: An elegant solution is very similar to one of the functions using nested pattern-matching in the lectures. *)

fun all_same_color cs = 
    let
        fun share_color (c1, c2) = card_color(c1) = card_color(c2)
    in
        case cs of
              []          => true
            | c::[]       => true
            | c::c'::rest => share_color(c, c') andalso all_same_color(c'::rest)
    end

(* (e) Write a function sum_cards, which takes a list of cards and returns the sum of their values. Use a locally defined helper function that is tail recursive. (Take “calls use a constant amount of stack space” as a requirement for this problem.) *)

fun sum_cards cs =
    let
        fun aux(cs, sum) =
            case cs of
                  []    => sum
                | c::rest => aux(rest, sum + card_value(c))
    in
        aux(cs, 0)
    end