write42 :: IO ()
write42 = putStrLn "42"

put2times :: String -> IO ()
put2times str = do putStrLn str
                   putStrLn str

putNtimes :: String -> Int -> IO ()
putNtimes str n | n <= 1 = putStrLn str
                | otherwise = do putStrLn str
                                 putNtimes str (n-1)
                                 
helloWorld :: IO ()
helloWorld = putStrLn "Hello World!"

putListLn :: [String] -> IO ()
putListLn [] = putStr ""
putListLn (a:as) = do putStrLn a
                      putListLn as

helloWorldFile :: IO ()
helloWorldFile =  do putStrLn "Escreve o arquivo"
                     writeFile "HelloWorld.md" "# Hello World!\n"
                     appendFile "HelloWorld.md" "Hello World em arquivo criado em Haskell"
                     x <- readFile "HelloWorld.md"
                     putListLn (lines x)
