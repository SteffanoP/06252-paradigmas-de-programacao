-- myTake: devolve uma lista como os n primeiros elementos da lista
myTake :: Int -> [Int] -> [Int]
myTake 0 l = []
myTake n [] = []
myTake n (l:ls) = l : myTake (n - 1) ls

{-
takeWhile : recebe uma função predicado e devolve uma lista contendo 
todos os elementos da lista de entrada que antecedem o primeiro para
 o qual a função predicado produz valor False.
-}
-- 
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (a:as) | not (f a) = []
                     | otherwise = a : myTakeWhile f as
