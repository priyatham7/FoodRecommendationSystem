(deffacts start
    (state start))
	
(defrule start
    ?state <- (state start)
    =>
    (printout t crlf)
	(printout t "--------------------------------------------------------" crlf)
    (printout t "        Welcome to FOOD RECOMMENDATION SYSTEM" crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t crlf)
    (retract ?state)
    (assert (state question)))

(defrule ask-cuisine
    (declare (salience 85))
    ?state <- (state question)
    (not (asked cuisine))
    =>
    (printout t "What cuisine would you prefer ?" crlf)
    (printout t "(Chinese/Indian/Seafood/Western/Japanese/CrossCultural)" crlf)
    (bind ?response (read))
    (switch ?response
        (case Chinese then (assert (preference (property cuisine) (symbolValue Chinese))))
        (case Indian then (assert (preference (property cuisine) (symbolValue Indian))))
        (case Seafood then (assert (preference (property cuisine) (symbolValue Seafood))))
        (case Western then (assert (preference (property cuisine) (symbolValue Western))))
        (case Japanese then (assert (preference (property cuisine) (symbolValue Japanese))))
        (case CrossCultural then (assert (preference (property cuisine) (symbolValue CrossCultural))))
        (default (printout t "Great, lemme search across all cuisines!" crlf)))
    (assert (asked cuisine)))

(defrule process-cuisine
    (declare (salience 80))
    (preference (property cuisine) (symbolValue ?preferred))
    ?dish <- (dish (cuisine ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?dish)))

(defrule check-after-cuisine
    (declare (salience 78))
    (preference (property cuisine))
    (not (checked-after cuisine))
    =>
    (assert (check-remaining))
    (assert (checked-after cuisine)))

(defrule ask-vegetarian
    (declare (salience 75))
    ?state <- (state question)
    (not (asked vegetarian))
    =>
    (printout t "Do you prefer vegetarian food? (yes/no/Either)" crlf)
    (bind ?response (read))
    (switch ?response
        (case yes then (assert (preference (property vegetarian) (symbolValue TRUE))))
        (case no then (assert (preference (property vegetarian) (symbolValue FALSE))))
        (default (printout t "Great, so I'll search across vegetarian AND non-vegetarian dishes!" crlf)))
    (assert (asked vegetarian)))

(defrule process-vegetarian
    (declare (salience 70))
    (preference (property vegetarian) (symbolValue ?preferred))
    ?dish <- (dish (vegetarian ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?dish)))

(defrule check-after-vegetarian
    (declare (salience 68))
    (preference (property vegetarian))
    (not (checked-after vegetarian))
    =>
    (assert (check-remaining))
    (assert (checked-after vegetarian)))

(defrule ask-taste
    (declare (salience 65))
    ?state <- (state question)
    (not (asked taste))
    =>
    (printout t "choose your taste preference -- sweet / spicy / sour " crlf)
    (bind ?response (read))
    (switch ?response
        (case spicy then
            (assert (preference (property taste) (symbolValue spicy) )))
        (case sour then
            (assert (preference (property taste) (symbolValue sour) )))
        (case sweet then
            (assert (preference (property taste) (symbolValue sweet) )))
  
        (default
            (printout t "Didn't catch that. I'm going to assume you're a 2." crlf)
            (assert (preference (property spiciness) (numberValue 2)))))
		
			
    (assert (asked taste))
	(assert (explore level))
	
	)
	
(defrule chosen-taste	
    (declare (salience 63))
    (preference  (property taste) (symbolValue ?preferred))
    ?dish <- (dish (taste ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?dish))
		)


(defrule ask-value
	
    (declare (salience 60))
    ?state <- (state question)
    (not (asked value))
    (explore level)
    =>
	
    (printout t "On a scale of 0-4, what's your tolerance (or preference) of your chosen taste?" crlf)
    (bind ?response (read))
    (switch ?response
        (case 0 then
            (assert (preference (property tasted) (numberValue 0))))
        (case 1 then
            (assert (preference (property tasted)(numberValue 1))))
        (case 2 then
            (assert (preference (property tasted)(numberValue 2))))
        (case 3 then
            (assert (preference (property tasted) (numberValue 3))))
        (case 4 then
            (assert (preference (property tasted) (numberValue 4))))
        (default
            (assert (preference (property tasted) (numberValue 2)))))
			
    (assert (asked value)))

(defrule process-value
	
    (declare (salience 58))
    (preference (property tasted)(numberValue ?preferred))
    ?dish <- (dish (level ?found))
    =>
	(if (> ?found ?preferred)
    then
        (retract ?dish)
	)
	)

(defrule check-after-value
    (declare (salience 56))
    (preference (numberValue ?preferred))
    (not (checked-after value))
    =>
	(assert (check-remaining))
    (assert (checked-after value)))

(defrule ask-nutrition
    (declare (salience 35))
    ?state <- (state question)
    (not (asked nutrition))
    =>
    (printout t "Do you want to specify any nutrition preferences? (yes/no)" crlf)
    (bind ?response (read))
    (if (eq ?response yes)
    then
        (printout t "Got it. Let me ask you a few more questions about your nutrition preferences." crlf)
        (assert (explore nutrition))
    else
        (retract ?state)
        (assert (state suggest))
        (assert (asked all)))
    (assert (asked nutrition)))

(defrule ask-lowcal
    (declare (salience 30))
    ?state <- (state question)
    (not (asked lowcal))
    (explore nutrition)
    =>
    (printout t "Do you prefer food that has low calories? (yes/no/Either)" crlf)
    (bind ?response (read))
    (switch ?response
        (case yes then (assert (preference (property lowcal) (symbolValue TRUE))))
        (case no then (assert (preference (property lowcal) (symbolValue FALSE)))))
    (assert (asked lowcal)))

(defrule process-lowcal
    (declare (salience 28))
    (preference (property lowcal) (symbolValue ?preferred))
    ?dish <- (dish (lowcal ?found))
    =>
    (if (not (eq ?found ?preferred))
    then
        (retract ?dish)))

(defrule check-after-lowcal
    (declare (salience 26))
    (preference (property lowcal))
    (not (checked-after lowcal))
    =>
    (assert (check-remaining))
    (assert (checked-after lowcal)))



(defrule ask-lowfat
    (declare (salience 18))
    ?state <- (state question)
    (not (asked lowfat))
    (explore nutrition)
    =>
    (printout t "Do you prefer food that has low fat? (yes/no/Either)" crlf)
    (bind ?response (read))
    (switch ?response
        (case yes then (assert (preference (property lowfat) (symbolValue TRUE))))
        (case no then (assert (preference (property lowfat) (symbolValue FALSE)))))
    (assert (asked lowfat)))

(defrule process-lowfat
    (declare (salience 16))
    (preference (property lowfat) (symbolValue ?preferred))
    ?dish <- (dish (lowfat ?found))
    =>
    (if (not (eq ?found ?preferred))
    then
        (retract ?dish)))

(defrule check-after-lowfat
    (declare (salience 14))
    (preference (property lowfat))
    (not (checked-after lowfat))
    =>
    (assert (check-remaining))
    (assert (checked-after lowfat))
	)
	

(defrule ask-highfiber
    (declare (salience 12))
    ?state <- (state question)
    (not (asked highfiber))
    (explore nutrition)
    =>
    (printout t "Do you prefer food that has high fiber? (yes/no/Either)" crlf)
    (bind ?response (read))
    (switch ?response
        (case yes then (assert (preference (property highfiber) (symbolValue TRUE))))
        (case no then (assert (preference (property highfiber) (symbolValue FALSE)))))
    (assert (asked highfiber)))

(defrule process-highfiber
    (declare (salience 10))
    (preference (property highfiber) (symbolValue ?preferred))
    ?dish <- (dish (highfiber ?found))
    =>
    (if (not (eq ?found ?preferred))
    then
        (retract ?dish)))

(defrule check-after-highfiber
    (declare (salience 8))
    (preference (property highfiber))
    (not (checked-after highfiber))
    ?state <- (state question)
    =>
    (assert (check-remaining))
    (assert (checked-after highfiber))
    (retract ?state)
    (assert (state suggest))
    (assert (asked all)))

(defrule start-drink-module
	(declare (salience 7))
	(state question2)
	(state drink)
	(not (asked cool/hot-drink))
	=>
	(printout t "What do you prefer? (cool/hot/Either)" crlf)
    (bind ?response (read))
    (switch ?response
        (case cool then (assert (preference (property drink) (symbolValue cool))))
        (case hot then (assert (preference (property drink) (symbolValue hot))))
        (default (printout t "Great, so I'll search across cool AND hot drinks!" crlf)))
    (assert (asked cool/hot-drink))
)

(defrule process-drink
    (declare (salience 6))
    (preference (property drink) (symbolValue ?preferred))
    ?dis <- (drink (category ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?dis)))
		
(defrule check-after-drink
    (declare (salience 5))
	(state drink)
	(not (asked all2))
    (not (checked-after drink))
    =>
    (assert (check-remaining))
    (assert (checked-after drink))
	(assert (asked all2)))

(defrule out-of-questions2
    (declare (salience 3))
    ?state <- (state question2)
    (asked all2)
    =>
    (retract ?state)
    (assert (state suggest2)))
	
(defrule out-of-questions
    (declare (salience 4))
    ?state <- (state question)
    (asked all)
    =>
    (retract ?state)
    (assert (state suggest)))
	
	
(defrule terminate
    (declare (salience 99))
    (state terminated)
    =>
    (printout t "Would you like to have a drink? (yes/no)" crlf)
    (bind ?response (read))
    (if (eq ?response yes)
    then
        (assert (state question2))
		(assert (state drink))
    else
        (printout t "Would you like to try one more dish? (yes/no)" crlf)
		(bind ?response (read))
		(if (eq ?response yes)
		then
			(reset)
		else
			(printout t "Great! Visit again when you're hungry." crlf)
        	(halt))
		))

		
(defrule terminate2
    (declare (salience 99))
    (state terminated2)
    =>
    (printout t "Would you like to try one more dish? (yes/no)" crlf)
    (bind ?response (read))
    (if (eq ?response yes)
    then
        (reset)
    else
		(printout t "Great! Visit again when you're hungry." crlf)
        (halt)))
		
(defrule suggest
    (declare (salience 95))
    ?state <- (state suggest)
    =>
    (bind ?dishes (find-all-facts ((?f dish)) (eq 1 1)))
    (if (eq (length$ ?dishes) 0)
    then
        (printout t "Sorry, I can't find any dishes with your preferences!!" crlf)
        (retract ?state)
        (assert (state terminated))
    else
        (bind ?somedish (nth$ (+ 1 (mod (random) (length$ ?dishes))) ?dishes))
        (bind ?name (fact-slot-value ?somedish name))
        (printout t "I'd suggest you to try " ?name ". Doesn't that sounds good? (yes/no)" crlf)
        (bind ?response (read))
        (if (eq ?response yes)
        then
            (retract ?state)
            (assert (state terminated))
        else
            (retract ?somedish)
            (retract ?state)
            (assert (state question)))))



(defrule suggest2
    (declare (salience 94))
	(state drink)
    ?state <- (state suggest2)
    =>
    (bind ?drinks (find-all-facts ((?f drink)) (eq 1 1)))
    (if (eq (length$ ?drinks) 0)
    then
        (printout t "Sorry, I can't find any drinks with your preferences!!" crlf)
        (retract ?state)
        (assert (state terminated2))
    else
        (bind ?somedrink (nth$ (+ 1 (mod (random) (length$ ?drinks))) ?drinks))
        (bind ?name (fact-slot-value ?somedrink name))
        (printout t "I'd suggest you to try " ?name ". Doesn't that sounds good? (yes/no)" crlf)
        (bind ?response (read))
        (if (eq ?response yes)
        then
            (retract ?state)
            (assert (state terminated2))
        else
            (retract ?somedrink)
            (retract ?state)
            (assert (state question2)))))
			
			

(defrule one-option-or-less
    (declare (salience 90))
    ?check <- (check-remaining)
    ?state <- (state question)
    =>
    (if (< (length$ (find-all-facts ((?f dish)) (eq 1 1))) 2)
    then
        (retract ?state)
        (assert (state suggest))
	)
	;(printout t "one-option-or-less" crlf)
    (retract ?check))
