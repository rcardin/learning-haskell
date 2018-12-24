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

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0