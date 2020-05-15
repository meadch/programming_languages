(* a “date” is an SML value of type int*int*int, where the first part is the year, the second part is the month, and the third part is the day *)
fun year (date : (int * int * int)) = #1(date)
fun month (date : (int * int * int)) = #2(date)
fun day (date : (int * int * int)) = #3(date)

fun is_older (date_a : (int * int * int), date_b : (int * int * int)) =
    (* 
       Evaluates to `true` if the first argument is a date that comes before the second argument.
       If the two dates are the same, the result is `false`. 
     *)
    if (year(date_a) < year(date_b)) 
        then true 
        else
            if (month(date_a) < month(date_b))
            then true
            else
                if (day(date_a) < day(date_b))
                then true
                else false

fun number_in_month (date : (int * int * int) list, month_num : int) =
    (*  takes a list of dates and a month and returns how many dates in the list are in the given month.*)
    true
