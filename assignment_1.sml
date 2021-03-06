(* a “date” is an SML value of type int*int*int, where the first part is the year, the second part is the month, and the third part is the day *)
type date = (int * int * int)
fun year (d : date) = #1(d)
fun month (d : date) = #2(d)
fun day (d : date) = #3(d)
val month_strings = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
fun append (xs : int list, ys : int list) = (* part of the course logo :) *)
    if null xs
    then ys
    else hd(xs) :: append(tl(xs), ys)
fun leap_year(y: int) = 
            (y mod 400 = 0) orelse ((y mod 4 = 0) andalso not((y mod 100 = 0)))
fun days_in_month_for(year: int) =
    [
            31, (* January *)
            if leap_year(year) then 29 else 28, (* February *)
            31, (* March *)
            30, (* April *)
            31, (* May *)
            30, (* June *)
            31, (* July *)
            31, (* August *)
            30, (* September *)
            31, (* October *)
            30, (* November *)
            31 (* December *)
    ]
    

fun is_older (date_a : date, date_b : date) =
    (* 
       Evaluates to `true` if the first argument is a date that comes before the second argument.
       If the two dates are the same, the result is `false`. 
     *)
    let 
       fun make_is_older (f: (date) -> int) = fn (a: date, b: date) => f(a) < f(b)
       fun test_in_order (fns : ((date) -> int) list) =
            if null fns 
            then false 
            else 
                let 
                    val f = hd(fns)
                in
                    make_is_older(f)(date_a, date_b)
                    orelse
                    (f(date_a) = f(date_b) andalso test_in_order(tl(fns)))
                end
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

fun get_nth (xs, n: int) = 
    if n = 1 then hd(xs) else get_nth(tl(xs), n - 1)
    
fun date_to_string(date: date) = 
    (* takes a date and returns a string of the form January 20, 2013 *)
    get_nth(month_strings, month(date))^" "^Int.toString(day(date))^", "^Int.toString(year(date))


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
            30, (* November *)
            31 (* December *)
        ]
    in number_before_reaching_sum(day_num, days_in_months) + 1 end

fun month_range(day1: int, day2: int) =
    (* takes two days of the year day1 and day2 and returns an int list [m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month of day day2 *)
    if day1 > day2 then [] else what_month(day1)::month_range(day1 + 1, day2)

fun oldest(dates: date list) =
    (*takes a list of dates and evaluates to an (int*int*int) option. It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list*)
    if null dates 
    then NONE
    else
    let 
        val first = hd(dates) 
        val rest = tl(dates)
    in
        if null(rest) 
        then SOME(first)
        else 
            let 
                val second = hd(rest)
            in
                if is_older(first, second) 
                then oldest(first::tl(rest))
                else oldest(rest)
            end 
    end

fun includes(xs: int list, x: int) =
    if null xs
    then false
    else hd(xs) = x orelse includes(tl(xs), x)

fun uniq(xs: int list) =
    let 
        fun recurse(orig: int list, result: int list) =
            if null orig
            then result
            else 
                if includes(result, hd(orig))
                then recurse(tl(orig), result)
                else recurse(tl(orig), append(result, [hd(orig)]))
    in
        recurse(xs, [])
    end

fun number_in_months_challenge(dates : date list, months : int list) = 
    number_in_months(dates, uniq(months))

fun dates_in_months_challenge(dates : date list, months : int list) = 
    dates_in_months(dates, uniq(months))

fun reasonable_date(date: date) =
    let
        fun valid_year(y: int) = y > 0
        fun valid_month(m: int) = m > 0 andalso m < 13
        fun valid_day(d: int) = d > 0 andalso d <= get_nth(days_in_month_for(year(date)), month(date))
    in
        valid_year(year(date)) andalso valid_month(month(date)) andalso valid_day(day(date))
    end