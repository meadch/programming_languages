(* a “date” is an SML value of type int*int*int, where the first part is the year, the second part is the month, and the third part is the day *)
type date = (int * int * int)
fun year (d : date) = #1(d)
fun month (d : date) = #2(d)
fun day (d : date) = #3(d)

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

fun number_in_month (date : (int * int * int) list, month_num : int) =
    (*  takes a list of dates and a month and returns how many dates in the list are in the given month.*)
    true
