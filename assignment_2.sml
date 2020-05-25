
(* 1. This problem involves using first-name substitutions to come up with alternate names. For example, Fredrick William Smith could also be Fred William Smith or Freddie William Smith. Only part (d) is specifically about this, but the other problems are helpful. *)

(* (a) Write a function all_except_option, which takes a string and a string list. Return NONE if the string is not in the list, else return SOME lst where lst is identical to the argument list except the string is not in it. You may assume the string is in the list at most once. Use same_string, provided to you, to compare strings. Sample solution is around 8 lines. *)

(* val all_except_option = fn : string * string list -> string list option *)
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

fun all_except_option(x, xs) = 
    if some(xs, fn (y) => same_string(x, y))
    then SOME(filter(xs, fn (y) => not(same_string(x, y))))
    else NONE