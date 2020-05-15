use "assignment_1.sml";

(* is_older *)

val is_older_test1 = (is_older((2020, 1, 1), (2019, 1, 1)) = false)
val is_older_test2 = (is_older((2019, 1, 1), (2020, 1, 1)) = true)

val is_older_test3 = (is_older((2020, 1, 2), (2020, 1, 1)) = false)
val is_older_test4 = (is_older((2020, 1, 1), (2020, 1, 2)) = true)

val is_older_test5 = (is_older((2020, 2, 1), (2020, 1, 1)) = false)
val is_older_test6 = (is_older((2020, 1, 1), (2020, 2, 1)) = true)

val is_older_test7 = (is_older((2020, 1, 1), (2020, 1, 1)) = false)

(* number_in_month *)
