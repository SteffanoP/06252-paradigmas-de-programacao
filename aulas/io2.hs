{-
Escreva uma função shorten :: String -> String que encurta links do YouTube. Em seguida, faça um programa em Haskell que leia de um arquivo url.in várias URLs do YouTube separa cada uma e imprime na saída padrão as respectivas URLs encurtadas

https://www.youtube.com/watch?v=AT9pwCFMz0k
https://youtu.be
-}

fun :: String -> String
fun [] = ""
fun (a:as) | (a == 'v') && (head as == '=') = tail as
           | otherwise = fun as

shorten :: String -> String
shorten str = "https://youtu.be/" ++ fun str

putListLn :: [String] -> IO ()
putListLn [] = putStr ""
putListLn (a : as) = do putStrLn a
                        putListLn as
  
shortenFile :: IO ()
shortenFile = do url <- readFile "url.in"
                 putListLn (map shorten (lines url))