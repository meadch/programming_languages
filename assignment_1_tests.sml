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

val date_list = [(2020, 1, 1), (2020, 1, 2), (2019, 1, 3), (2020, 2, 1), (2018, 5, 13)]
val number_in_month_test_1 = number_in_month(date_list, 1) = 3
val number_in_month_test_2 = number_in_month(date_list, 2) = 1
val number_in_month_test_3 = number_in_month(date_list, 3) = 0


(* number_in_months *)
val number_in_months_test_1 = number_in_months(date_list, [1, 2]) = 4
val number_in_months_test_2 = number_in_months(date_list, [2, 5]) = 2
val number_in_months_test_3 = number_in_months(date_list, [5, 7]) = 1
val number_in_months_test_4 = number_in_months(date_list, [13]) = 0

(* dates_in_month *)
val dates_in_month_test_1 = dates_in_month(date_list, 1) = [(2020, 1, 1), (2020, 1, 2), (2019, 1, 3)]
val dates_in_month_test_2 = dates_in_month(date_list, 2) = [(2020, 2, 1)]
val dates_in_month_test_3 = dates_in_month(date_list, 6) = []

(* dates_in_months *)
val dates_in_months_test_1 = dates_in_months(date_list, [1, 5]) = [(2020, 1, 1), (2020, 1, 2), (2019, 1, 3), (2018, 5, 13)]
val dates_in_months_test_2 = dates_in_months(date_list, [2, 5]) = [(2020, 2, 1), (2018, 5, 13)]
val dates_in_months_test_3 = dates_in_months(date_list, [2, 6]) = [(2020, 2, 1)]

(* get_nth *)
val strings = ["Sully", "Janel", "Hank", "Dan"]
val get_nth_test_1 = get_nth(strings, 0) = "Sully"
val get_nth_test_2 = get_nth(strings, 1) = "Janel"
val get_nth_test_3 = get_nth(strings, 2) = "Hank"
val get_nth_test_4 = get_nth(strings, 3) = "Dan"

(* date_to_string *)
val date_to_string_test_1 = date_to_string((2020, 1, 1)) = "January 1, 2020"
val date_to_string_test_2 = date_to_string((2017, 12, 4)) = "December 4, 2017"
