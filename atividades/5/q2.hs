
{-
Blockchain é basicamente um banco de dados distribuído onde os 
dados são armazenados em blocos onde cada bloco possui transações 
financeiras e uma referência para o próximo bloco formando uma 
corrente. Assumindo os tipos de dados abaixo, crie uma função em 
Haskell que dado um Bloco e uma conta, retorna uma lista contendo 
os índices dos blocos que possuem transações (origem ou destino) 
com esta conta considerando todas as transações da cadeia de 
blocos.

data Transacao = Transacao { de :: String -- Conta que paga

                                                , para :: String -- Conta que recebe

                                                 , valor :: Float -- Quanto está pagando

                                                } deriving (Show)

data Bloco = Bloco { indice :: Int -- Indice do bloco

                                 , trs :: [Transacao] -- Lista de transações de um bloco

                                 , proximo :: Maybe Bloco -- Proximo bloco

                                 } deriving (Show)

OBS: para definir um valor do tipo bloco é só especificar (Bloco ind trs prox), onde ind é um inteiro, trs é uma lista de transações e prox é um Maybe Bloco. O mesmo se aplica ao tipo Transacao.
-}
import Data.Maybe (fromJust, isNothing)

data Transacao = Transacao
  { de :: String, -- Conta que paga
    para :: String, -- Conta que recebe
    valor :: Float -- Quanto está pagando
  }
  deriving (Show)

data Bloco = Bloco
  { indice :: Int, -- Indice do bloco
    trs :: [Transacao], -- Lista de transações de um bloco
    proximo :: Maybe Bloco -- Proximo bloco
  }
  deriving (Show)

type Conta = String

getContas :: Transacao -> (String, String)
getContas (Transacao de para _) = (de,para)

checkTransacao :: (String, String) -> Conta -> Bool
checkTransacao (de,para) conta = (de == conta) || (para == conta)

checkTransacoes :: [Transacao] -> Conta -> Bool
checkTransacoes t c = or (map ((`checkTransacao` c) . getContas) t)

checkBloco :: Bloco -> Conta -> [Int]
checkBloco (Bloco indice trs _) conta | checkTransacoes trs conta = [indice]
                                      | otherwise = []

checkBlocos :: Bloco -> Conta -> [Int]
checkBlocos (Bloco ind trs prox) conta | isNothing prox = checkBloco (Bloco ind trs prox) conta
                                       | otherwise = checkBloco (Bloco ind trs prox) conta ++ checkBlocos (fromJust prox) conta
    
{-
Blocos
(Bloco 1 [(Transacao "001" "002" 1.00), (Transacao "002" "001" 1.00), (Transacao "003" "001" 2.00)] )
(Bloco 2 [(Transacao "003" "004" 1.00), (Transacao "004" "003" 1.00), (Transacao "001" "003" 2.00)] )
(Bloco 3 [(Transacao "003" "002" 1.00), (Transacao "002" "003" 1.00), (Transacao "001" "003" 2.00)] )

(Bloco 1 [(Transacao "001" "002" 1.00), (Transacao "002" "001" 1.00), (Transacao "003" "001" 2.00)] (Bloco 2 [(Transacao "003" "004" 1.00), (Transacao "004" "003" 1.00), (Transacao "001" "003" 2.00)] (Bloco 3 [(Transacao "003" "002" 1.00), (Transacao "002" "003" 1.00), (Transacao "001" "003" 2.00)] Nothing)))
-}