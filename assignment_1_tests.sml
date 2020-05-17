use "assignment_1.sml";

(* is_older *)

val is_older_test1 = (is_older((2020, 1, 1), (2019, 1, 1)) = false)
val is_older_test2 = (is_older((2019, 1, 1), (2020, 1, 1)) = true)
val is_older_test3 = (is_older((2020, 1, 2), (2020, 1, 1)) = false)
val is_older_test4 = (is_older((2020, 1, 1), (2020, 1, 2)) = true)
val is_older_test5 = (is_older((2020, 2, 1), (2020, 1, 1)) = false)
val is_older_test6 = (is_older((2020, 1, 1), (2020, 2, 1)) = true)
val is_older_test7 = (is_older((2020, 1, 1), (2020, 1, 1)) = false)
val is_older_test8 = (is_older((2020, 1, 1), (2018, 5, 13)) = false)

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

(* number_before_reaching_sum *)
val number_before_reaching_sum_test_1 = number_before_reaching_sum(5, [1,2,3,4,5]) = 2
val number_before_reaching_sum_test_2 = number_before_reaching_sum(1, [1,2,3,4,5]) = 0
val number_before_reaching_sum_test_3 = number_before_reaching_sum(12, [1,2,3,4,5]) = 4
val number_before_reaching_sum_test_4 = number_before_reaching_sum(7, [1,2,3,4,5]) = 3

(* what_month *)
val what_month_test_1 = what_month(31) = 1
val what_month_test_2 = what_month(32) = 2
val what_month_test_3 = what_month(59) = 2
val what_month_test_4 = what_month(60) = 3
val what_month_test_5 = what_month(90) = 3
val what_month_test_6 = what_month(91) = 4

(* month_range *)
val month_range_test_1 = month_range(31, 32) = [1, 2]
val month_range_test_2 = month_range(2, 1) = []
val month_range_test_3 = month_range(364, 365) = [12, 12]
val month_range_test_4 = month_range(29, 33) = [1, 1, 1, 2, 2]

(* oldest *)
val oldest_test_1 = oldest(date_list) = SOME(2018, 5, 13)
val oldest_test_2 = oldest([]) = NONE
val oldest_test_3 = oldest([(2020, 1, 1)]) = SOME((2020, 1, 1))

(* number_in_months_challenge *)
val number_in_months_challenge_test_1 = number_in_months_challenge(date_list, [1, 2, 1]) = 4
val number_in_months_challenge_test_2 = number_in_months_challenge(date_list, [2, 2, 5]) = 2
val number_in_months_challenge_test_3 = number_in_months_challenge(date_list, [5, 7, 7, 5]) = 1
val number_in_months_challenge_test_4 = number_in_months_challenge(date_list, [13, 13, 13]) = 0

(* dates_in_months_challenge *)
val dates_in_months_challenge_test_1 = dates_in_months_challenge(date_list, [1, 5, 1, 5]) = [(2020, 1, 1), (2020, 1, 2), (2019, 1, 3), (2018, 5, 13)]
val dates_in_months_challenge_test_2 = dates_in_months_challenge(date_list, [2, 5, 2, 2]) = [(2020, 2, 1), (2018, 5, 13)]
val dates_in_months_challenge_test_3 = dates_in_months_challenge(date_list, [2, 6, 6, 2]) = [(2020, 2, 1)]

(* reasonable_date *)
val reasonable_date_test_1 = reasonable_date((0, 0, 0)) = false
val reasonable_date_test_2 = reasonable_date((2000, 13, 5)) = false
val reasonable_date_test_3 = reasonable_date((2000, 1, 50)) = false

(* leap years *)
val reasonable_date_test_4 = reasonable_date((2000, 2, 29)) = true
val reasonable_date_test_5 = reasonable_date((2001, 2, 29)) = false