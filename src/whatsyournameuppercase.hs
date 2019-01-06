import Data.Char
import System.IO

main = do
    _ <- putStrLn "What's your first name?"
    -- Without flushing, nothing is printed to the stdout!
    hFlush stdout
    firstName <- getLine
    _ <- putStrLn "What's your last name?"
    hFlush stdout
    lastName <- getLine
    let upperFirstName = map toUpper firstName
        upperLastName = map toUpper lastName
    putStrLn $ "Hello " ++ upperFirstName ++ ", " ++ upperLastName ++ ". Nice to meet you!"
    hFlush stdout
