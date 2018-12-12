-- Pattern matching in functions
:{
lucky :: (Integral n) => n -> String
lucky 7 = "LUCKY MAN!!"
lucky x = "NOOO, WHAT A MESS!!"
:}
:{
factorial :: (Integral n) => n -> n
factorial 0 = 1
factorial x = x + factorial(x - 1)
:}
:{
add2dVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
add2dVectors (x1, x2) (y1, y2) = (x1 + y1, x2 + y2)
:}
:{
lucky' :: (Integral n) => n -> String
lucky' number
    | number == 7 = "LUCKY MAN!!"
    | otherwise = "NOOO, WHAT A MESS!!"
:}
:{

-- Where
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell height weight
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
:}

-- Let
:{
bmi :: (RealFloat a) => a -> a -> a
bmi height weight =
    let twoTimesHeight = height ^ 2
    in weight / twoTimesHeight
:}