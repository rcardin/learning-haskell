-- Higher order functions
:{
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
:}

:{
flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y
:}

:{
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs
:}

:{
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs
:}

:{
quicksort' :: (Ord a) -> [a] -> [a]
quicksort' [] = []
quicksort' (x::xs)
    let smallerSorted = quicksort' (filter' (<=x) xs)
        greaterSorted = quicksort' (filter' (>x) xs)
    in smallerSorted ++ [x] ++ [greaterSorted]
:}

:{
largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0
:}

:{
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs
:}

:{
elem' :: (Eq a) => a -> [a] -> Bool
elem' x xs = foldl (\acc y -> if y == x then True else acc ) False xs
:}

-- Because $ is right-associative, f (g (z x)) is equal to f $ g $ z x
-- Use the $ operator to rewrite the following functions' composition
-- sum (filter (> 10) (map (*2) [2..10]))
sum $ filter (> 10) $ map (*2) [2..10]
-- sum (map sqrt [1..130]) becomes
sum $ map sqrt [1..130]

-- (f ° g)(x) = f(g(x))
-- Using function composition, map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] becomes
map (negate . abs x) [5,-3,-6,7,-3,2,-19,24]
-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]] becomes
map (negate . sum . tail xs) [[1..5],[3..6],[1..7]]
-- Composition does not work well with function having more than one parameter. We need 
-- to use currying. So, sum (replicate 5 (max 6.7 8.9)) becomes
(sum . replicate 5 . max 6.7) 8.9
--  Or, using the $ operator
sum . replicate 5 . max 6.7 $ 8.9
-- replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8]))) becomes
replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]
-- Are we sure that the last form is really more readable?