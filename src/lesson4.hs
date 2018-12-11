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