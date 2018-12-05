-- Directly taken from Learn You a Haskell for Great Good!
-- Some stupid functions using numbers
doubleMe x = x + x

doubleSmallNumber x = if x > 100 then x else x * 2

-- Character '  at the end of a function name means that either the function is
-- strich, aka not lazy, or that it is a slighly modified version of another 
-- function
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1