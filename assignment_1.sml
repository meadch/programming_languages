(* a “date” is an SML value of type int*int*int, where the first part is the year, the second part is the month, and the third part is the day *)
type date = (int * int * int)
fun year (d : date) = #1(d)
fun month (d : date) = #2(d)
fun day (d : date) = #3(d)
val month_strings = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

fun is_older (date_a : date, date_b : date) =
    (* 
       Evaluates to `true` if the first argument is a date that comes before the second argument.
       If the two dates are the same, the result is `false`. 
     *)
    let 
       fun make_is_older (f: (date) -> int) = fn (a: date, b: date) => f(a) < f(b)
       fun test_in_order (fns : ((date) -> int) list) =
            if null fns then false else make_is_older(hd(fns))(date_a, date_b) orelse test_in_order(tl(fns))
    in
        test_in_order([year, month, day])
    end

fun number_in_month (dates : date list, month_num : int) =
    (*  takes a list of dates and a month and returns how many dates in the list are in the given month.*)
    let fun count_month(dates: date list, count : int) = 
            if null dates 
            then count
            else
                if month(hd(dates)) = month_num 
                then count_month(tl(dates), count + 1) 
                else count_month(tl(dates), count)
    in
        count_month(dates, 0)
    end

fun number_in_months (dates : date list, months : int list) = 
    (* takes a list of dates and a list of months (i.e., an int list) and returns the number of dates in the list of dates that are in any of the months in the list of months. *)
    let fun count_months(months: int list, count: int) = 
            if null months 
            then count 
            else count_months(tl(months), count + number_in_month(dates, hd(months)))
    in
        count_months(months, 0)
    end

fun filter_dates (dates: date list, f: (date) -> bool) =
    if null dates
    then []
    else if f(hd(dates)) then hd(dates)::filter_dates(tl(dates), f) else filter_dates(tl(dates), f)

fun dates_in_month (dates: date list, m: int) =
    (* takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. *)
    filter_dates(dates, fn (date: date) => month(date) = m)

fun dates_in_months (dates: date list, months: int list) =
    (* dates_in_months takes a list of dates and a list of months (i.e., an int list) and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months. *)
    if null months
    then []
    else dates_in_month(dates, hd(months))@dates_in_months(dates, tl(months))

fun get_nth (strings: string list, n: int) = 
    if n = 0 then hd(strings) else get_nth(tl(strings), n - 1)
    
fun date_to_string(date: date) = 
    (* takes a date and returns a string of the form January 20, 2013 *)
    get_nth(month_strings, month(date) - 1)^" "^Int.toString(day(date))^", "^Int.toString(year(date))


fun number_before_reaching_sum (sum: int, xs: int list) = 
    (*  return an int n such that the first n elements of the list add to less than sum, but the first n + 1 elements of the list add to sum or more *)
    let fun sum_until(s: int, i: int, xs: int list) =
            if s >= sum then i - 1 else sum_until(s + hd(xs), i + 1, tl(xs))
    in
        sum_until(0, 0, xs)
    end

fun what_month (day_num: int) =
    (* takes a day of year (i.e., an int between 1 and 365) and returns what month that day is in *)
    let val days_in_months = [
            31, (* January *)
            28, (* February *)
            31, (* March *)
            30, (* April *)
            31, (* May *)
            30, (* June *)
            31, (* July *)
            31, (* August *)
            30, (* September *)
            31, (* October *)
            31, (* November *)
            31 (* December *)
        ]
    in number_before_reaching_sum(day_num, days_in_months) + 1 end
