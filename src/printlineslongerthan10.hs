main = do
    contents <- getContents
    putStr $ shorterThan10 contents

shorterThan10 :: String -> String
shorterThan10 input =
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
    in unlines shortLines