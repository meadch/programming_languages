use "assignment_2.sml";

val all_except_option_test_1 = all_except_option("buzz", ["foo", "bar", "baz"]) = NONE
val all_except_option_test_2 = all_except_option("bar", ["foo", "bar", "baz"]) = SOME(["foo", "baz"])
val all_except_option_test_3 = all_except_option("foo", ["foo", "bar", "baz"]) = SOME(["bar", "baz"])

val get_substitutions1_test1 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val get_substitutions1_test2 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val get_substitutions2_test1 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val get_substitutions2_test2 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]