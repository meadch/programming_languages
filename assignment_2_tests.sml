use "assignment_2.sml";

val all_except_option_test_1 = all_except_option("buzz", ["foo", "bar", "baz"]) = NONE
val all_except_option_test_2 = all_except_option("bar", ["foo", "bar", "baz"]) = SOME(["foo", "baz"])
val all_except_option_test_3 = all_except_option("foo", ["foo", "bar", "baz"]) = SOME(["bar", "baz"])

val get_substitutions1_test1 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val get_substitutions1_test2 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val get_substitutions2_test1 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val get_substitutions2_test2 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val similar_names_test1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"}, {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val card_color_test1 = card_color (Clubs, Num 2) = Black
val card_color_test2 = card_color (Diamonds, Num 6) = Red
val card_color_test3 = card_color (Hearts, Num 8) = Red
val card_color_test4 = card_color (Spades, Num 9) = Black

val card_value_test1 = card_value (Clubs, Num 2) = 2
val card_value_test2 = card_value (Diamonds, Num 6) = 6
val card_value_test3 = card_value (Hearts, Jack) = 10
val card_value_test4 = card_value (Spades, Queen) = 10
val card_value_test5 = card_value (Spades, King) = 10
val card_value_test6 = card_value (Spades, Ace) = 11

val remove_card_test1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val remove_card_test2 = remove_card ([(Hearts, Ace), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace)]
val remove_card_test3 = (remove_card ([(Hearts, Ace)], (Spades, Ace), IllegalMove) handle IllegalMove => []) = []
