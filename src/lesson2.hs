-- Lists
let lostNumbers = [1, 2, 3, 4, 5]

-- Operators and functions on lists
lostNumbers ++ [6, 7, 8]
0 : lostNumbers
lostNumbers !! 3
head lostNumbers
tail lostNumbers
last lostNumbers
init lostNumbers
length lostNumbers
take 3 lostNumbers
drop 3 lostNumbers
4 `elem` lostNumbers

-- List comprehension
[x * 2 | x <- [0..10]]
[x + y | x <- [0..10], y <- [0..5], x `mod` 3 == 0]

-- Tuples
("one", 4.0)
fst tuple
snd tuple
zip ["one", "two", "three"] [1, 2, 3]