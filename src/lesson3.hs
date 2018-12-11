-- Types
:t 'a'
"Hello" :: [Char]
:{   -- Needed to be used inside GHCi
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
:}
:{
addTwo :: (Num t) => t -> t -> t
addTwo x y = x + y
:}
