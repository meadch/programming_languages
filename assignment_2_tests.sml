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

val all_same_color_test1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val all_same_color_test2 = all_same_color [(Diamonds, Ace), (Hearts, Ace)] = true
val all_same_color_test3 = all_same_color [(Spades, Ace), (Hearts, Ace)] = false

val sum_cards_test1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val sum_cards_test2 = sum_cards [(Clubs, Num 2),(Clubs, Ace)] = 13
val sum_cards_test3 = sum_cards [(Clubs, Num 2),(Clubs, Jack)] = 12

val score_test1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val score_test2 = score ([(Hearts, Num 4),(Clubs, Num 4)], 3) = 15
val score_test3 = score ([(Hearts, Num 4),(Hearts, Num 4)], 3) = 7

val officiate_test1 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val officiate_test2 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], [Draw,Draw,Draw,Draw,Draw], 42) = 3
val officiate_test3 = ((officiate([(Clubs,Jack),(Spades,Num(8))], [Draw,Discard(Hearts,Jack)], 42); false)  handle IllegalMove => true) 