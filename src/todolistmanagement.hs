import System.IO
import System.Directory
import Data.List

main = do
    handle <- openFile "todo.txt" ReadMode
    (tempFileName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "These are your TO-DO items:"
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numberToDelete <- getLine
    let number = read numberToDelete
        newTodoTasks = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoTasks
    hClose handle
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempFileName "todo.txt"

