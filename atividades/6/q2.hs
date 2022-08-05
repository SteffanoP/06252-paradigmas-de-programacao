import Data.List (groupBy, sortBy)
{-
Crie um programa em Haskell que pergunta ao usuário se ele deseja saber o total de palavras ou de caracteres de um arquivo de texto. Em seguida ele deve solicitar que o usuário forneça como entrada o caminho para um arquivo de texto. Por último, de acordo com a primeira escolha do usuário, ele deve contar palavras ou caracteres e informar na saída padrão o total de elementos de acordo com a escolha. Caso a escolha seja caracter, espaços em branco, caracteres de tabulação e nova linha não devem ser considerados na contabilização. Abaixo segue um exemplo de como o prompt do seu programa deve funcionar:

"Digite 1 para contar palavras ou 2 para contar caracteres:"

-> 2

"Digite o caminho do arquivo de texto:"

-> exemplo.txt

"O total de caracteres no arquivo exemplo.txt é 156." 
-}

getPalavras :: String -> IO ()
getPalavras filepath = do file <- readFile filepath
                          putStrLn ("O total de palavras no arquivo " ++ filepath ++ " é " ++ show (length (words file)) ++ ".")

getCaracteres :: String -> IO ()
getCaracteres filepath = do file <- readFile filepath
                            putStrLn ("O total de caracteres no arquivo " ++ filepath ++ " é " ++ show (length (filter checkCaracterEspecial file)) ++ ".")

checkCaracterEspecial :: Char -> Bool
checkCaracterEspecial c = not (c == ' ' || c == '\t' || c == '\n')

decisor :: Char -> String -> IO ()
decisor x filepath | x == '1' = do getPalavras filepath
                   | x == '2' = do getCaracteres filepath
                   | otherwise = putStrLn "Desculpa eu não consegui entender sua entrada :("

getPalavrasOUCaracteres :: IO ()
getPalavrasOUCaracteres = do putStrLn "Digite 1 para contar palavras ou 2 para contar caracteres:"
                             option <- getChar
                             putStrLn "\n"
                             putStrLn "Digite o caminho do arquivo de texto:"
                             filepath <- getLine
                             decisor option filepath