use "assignment_3.sml";

val only_capitals_test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals_test2 = only_capitals ["Aa","bB","Cc"] = ["Aa","Cc"]
val only_capitals_test3 = only_capitals ["aA","bB","cC"] = []

val longest_string1_test1 = longest_string1 ["A","bc","C"] = "bc"
val longest_string1_test2 = longest_string1 [] = ""
val longest_string1_test3 = longest_string1 ["aa", "bb"] = "aa"

val longest_string2_test1 = longest_string2 ["A","bc","C"] = "bc"
val longest_string2_test2 = longest_string2 [] = ""
val longest_string2_test3 = longest_string2 ["aa", "bb"] = "bb"

val longest_string3_test1 = longest_string3 ["A","bc","C"] = "bc"
val longest_string3_test2 = longest_string3 [] = ""
val longest_string3_test3 = longest_string3 ["aa", "bb"] = "aa"

val longest_string4_test1 = longest_string4 ["A","bc","C"] = "bc"
val longest_string4_test2 = longest_string4 [] = ""
val longest_string4_test3 = longest_string4 ["aa", "bb"] = "bb"

val longest_capitalized_test1 = longest_capitalized ["A","bc","C"] = "A"
val longest_capitalized_test2 = longest_capitalized ["Ab","Bcd","C"] = "Bcd"
val longest_capitalized_test3 = longest_capitalized ["a","bc","c"] = ""

val rev_string_test1 = rev_string "abc" = "cba"
val rev_string_test2 = rev_string "a" = "a"


val first_answer_test1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val first_answer_test2 = (first_answer (fn x => if x > 3 then SOME x else NONE) [1,1,1] handle NoAnswer => 0) = 0


val all_answers_test1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers_test2 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val all_answers_test3 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4] = SOME [2,3,4]

val count_wildcards_test1a = count_wildcards Wildcard = 1
val count_wildcards_test2a = count_wildcards (Variable "test") = 0
val count_wildcards_test3a = count_wildcards (TupleP([Wildcard, ConstructorP("test", Wildcard)])) = 2

val count_wild_and_variable_lengths_test1a = count_wild_and_variable_lengths (Variable "test") = 4
val count_wild_and_variable_lengths_test2a = count_wild_and_variable_lengths (TupleP([Wildcard, ConstructorP("test", Variable("test"))])) = 5

val count_some_var_test1a = count_some_var ("toast", (Variable "test")) = 0
val count_some_var_test2a = count_some_var ("toast", (TupleP([Wildcard, Variable("toast"), ConstructorP("test", Variable("toast"))]))) = 2

(* 

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME [] *)
