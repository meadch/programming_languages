use "assignment_2.sml";

val all_except_option_test_1 = all_except_option("buzz", ["foo", "bar", "baz"]) = NONE
val all_except_option_test_2 = all_except_option("bar", ["foo", "bar", "baz"]) = SOME(["foo", "baz"])
val all_except_option_test_3 = all_except_option("foo", ["foo", "bar", "baz"]) = SOME(["bar", "baz"])