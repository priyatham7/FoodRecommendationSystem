(deftemplate drink
	(slot name (type STRING))
	(slot category (type SYMBOL))
)

(deffacts drinks
	(drink (name "Thumbsup") (category cool) )
	(drink (name "Sprite") (category cool) )
	(drink (name "GreenTea") (category hot) )
	(drink (name "Maaza") (category cool) )
	(drink (name "Coffee") (category hot) )
	(drink (name "Tea") (category hot))
)
(deftemplate dish
    (slot name (type STRING))
    (slot cuisine (type SYMBOL))
    (slot vegetarian (type SYMBOL) (default FALSE))
    (slot taste (type SYMBOL) )
    (slot level (type NUMBER) )
	(slot lowcal (type SYMBOL) (default FALSE) )
    (slot lowfat (type SYMBOL) (default FALSE) )
	(slot highfiber (type SYMBOL) (default FALSE)))

(deftemplate preference
    (slot property (type SYMBOL))
    (slot symbolValue (type SYMBOL))
    (slot numberValue (type NUMBER)))
	

(deffacts dishes
    (dish (name "Bak kut teh") (cuisine Chinese)(taste spicy) (level 2) )
    (dish (name "Mee pok") (cuisine Chinese) (taste sour) (level 0)(lowfat TRUE)(lowcal TRUE))
    (dish (name "Char Kway Teow") (cuisine Chinese)(vegetarian TRUE) (taste spicy) (level 2)(lowfat TRUE))
    (dish (name "Chicken rice") (cuisine Chinese) (taste spicy)(level 3)(lowcal TRUE))
    (dish (name "Ban mian") (cuisine Chinese) (vegetarian TRUE) (taste spicy) (level 1)  (lowfat TRUE) )
    (dish (name "You char kuey") (cuisine Chinese) (taste spicy) (level 2)(lowcal TRUE) )
    (dish (name "Kaya toast ") (cuisine Chinese)(taste sweet) (level 2) )
    (dish (name "Seafood hor fun") (cuisine Chinese) (taste spicy) (level 3) )
    
	(dish (name "Chai tow Kway") (cuisine Chinese) (taste spicy)(level 1)(lowcal TRUE))
    (dish (name "Vegetarian Manchuria") (cuisine Chinese) (vegetarian TRUE) (taste sweet)(level 0) (lowfat TRUE))
    (dish (name "Noodles") (cuisine Chinese)  (taste sour)(level 1) )
    
    
	(dish (name "Tandoori chicken") (cuisine Indian) (taste spicy) (level 4)(lowcal TRUE))
    (dish (name "Roti parata") (cuisine Indian) (vegetarian TRUE) (taste sour) (level 3) )
    (dish (name "Chicken Butter Masala") (cuisine Indian) (taste spicy) (level 2)(lowcal TRUE))
    (dish (name "Idlee Saambaar") (cuisine Indian) (vegetarian TRUE) (taste sweet) (level 2) (lowfat TRUE) )
    (dish (name "Paneer Butter Masala ") (cuisine Indian) (vegetarian TRUE) (taste sweet)(level 1)  (highfiber TRUE))
	(dish (name "Garbanzo Tomato Pasta ") (cuisine Indian) (vegetarian TRUE) (taste sweet)(level 1)  (highfiber TRUE))
    (dish (name "Masala dosa") (cuisine Indian) (vegetarian TRUE) (taste spicy) (level 2) )
    (dish (name "Chicken Biryani") (cuisine Indian) (taste spicy) (level 4)(lowcal TRUE))
	(dish (name "Gulab Jamun") (cuisine Indian) (vegetarian TRUE) (taste sweet) (level 3) (lowfat TRUE))
	(dish (name "Rasgulla") (cuisine Indian) (vegetarian TRUE) (taste sweet) (level 4)(lowcal TRUE))
	(dish (name "Lemon Rice") (cuisine Indian) (vegetarian TRUE) (taste sour) (level 3) (lowfat TRUE))
    
	(dish (name "Black pepper crab") (cuisine Seafood) (taste spicy) (level 2) (lowfat TRUE) )
    (dish (name "Fried lobster omelette") (cuisine Seafood) (taste sweet) (level 0)(lowcal TRUE))
    (dish (name "Crispy Manchuria") (cuisine Seafood) (vegetarian TRUE) (taste sour) (level 2) )
    
	(dish (name "Fish head curry") (cuisine CrossCultural) (taste spicy) (level 4) (lowfat TRUE))
    (dish (name "Laksa") (cuisine CrossCultural) (taste spicy) (level 3)(lowcal TRUE))  
    (dish (name "Ayam buah keluak") (cuisine CrossCultural) (taste sweet)(level 2))
    (dish (name "Kueh pie tee") (cuisine CrossCultural) (taste sweet) (level 1)  (lowfat TRUE)  (lowcal TRUE) )
    (dish (name "Tauhu goreng") (cuisine CrossCultural) (vegetarian TRUE) (taste sour) (level 2)(lowcal TRUE))
    (dish (name "Kueh tutu") (cuisine CrossCultural) (vegetarian TRUE) (taste sweet) (level 0) (lowfat TRUE))
    
	(dish (name "Chicken chop") (cuisine Western) (taste spicy) (level 1)  (lowcal TRUE))
    (dish (name "Pasta") (cuisine Western) (vegetarian TRUE) (taste sour) (level 0) (lowfat TRUE))
    (dish (name "Sausage roll") (cuisine Western) (vegetarian TRUE) (taste sour) (level 2))
    
	(dish (name "Japanese Ramen") (cuisine Japanese) (taste sour) (level 2)(lowfat TRUE))
    (dish (name "Takoyaki") (cuisine Japanese) (taste spicy) (level 3)(lowcal TRUE))
    (dish (name "Seaweed Roll") (cuisine Japanese) (vegetarian TRUE) (taste sour) (level 0)) )
