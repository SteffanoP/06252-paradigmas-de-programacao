{-
Um Labelled Transition System (LTS) é um grafo direcionado onde 
os nós correspondem aos estados de um sistema e as arestas às 
transições que modelam ações que mudam o estado do sistema. 
Abaixo segue um exemplo de uma máquina de venda que libera café
(coffee) ou chá (tea) de acordo com o botão pressionado, 
vermelho (red) ou azul (blue). Percebam que os estados tem 
identificadores inteiros e o sistema começa no estado 0 mas pode
mudar para o 3 ou 1 de acordo com a transição escolhida.

Um trace de um LTS é uma sequência de ações que podem ser 
executadas no sistema. Por exemplo ["red","coffee","off"] é uma 
trace válido, enquanto que ["off","red","coffe"] não é um trace 
válido visto que não podemos ir do estado 1 para o estado 3. 
Assim, dado os tipos abaixo para representar um LTS em Haskell,
crie uma função que dado um LTS e um trace (lista de ações), 
retorna True caso o trace seja válido e False caso contrário.
-}
-- [((0,1), "off"), ((0,2), "blue"), ((0,3), "red"), ((3,0), "coffee"), ((2,0), "tea")]
import Data.Maybe (fromJust, isJust, isNothing)

type Acao = String
type Estado = Int
type Transicao = ((Estado, Estado), Acao)
type LTS = [Transicao]

checkTransicao :: Transicao -> Estado -> Acao -> Maybe Estado
checkTransicao ((i, f), a) estadoAtual b | (i == estadoAtual) && (a == b) = Just f
                                         | otherwise = Nothing

checkTransicoes :: [Transicao] -> Estado -> Acao -> Maybe Estado
checkTransicoes [] _ _ = Nothing
checkTransicoes (a : as) e b | isJust (checkTransicao a e b) = checkTransicao a e b
                             | otherwise = checkTransicoes as e b

checkLTSAndamento :: LTS -> Estado -> [Acao] -> Bool
checkLTSAndamento _ _ [] = True
checkLTSAndamento l e (a:as) | isNothing estado = False
                             | otherwise = checkLTSAndamento l (fromJust estado) as
    where
        estado = checkTransicoes l e a

checkLTS lts = checkLTSAndamento lts 0