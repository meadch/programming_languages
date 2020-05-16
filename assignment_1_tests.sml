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

val date_list = [(2020, 1, 1), (2020, 1, 2), (2019, 1, 3), (2020, 2, 1)]
val number_in_month_test_1 = number_in_month(date_list, 1) = 3
val number_in_month_test_2 = number_in_month(date_list, 2) = 1
val number_in_month_test_3 = number_in_month(date_list, 3) = 0


