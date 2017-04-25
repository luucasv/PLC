type Ponto = (Float, Float, Float)
type Nome  = String
type Tamanho = Int
data Diretorio = Pasta Nome [Diretorio] | Arquivo Nome Tamanho
data Complex  = Complex Double Double

instance Show Complex where
    show (Complex real img) | img >= 0 = show real ++ " + " ++ show img ++ "i"
                            | otherwise = show real ++ " - " ++ show (-img) ++ "i"

distancia :: Ponto -> Ponto -> Float
distancia (x1, y1, z1) (x2, y2, z2) = sqrt(x*x + y*y + z*z)
    where x = x1 - x2
          y = y1 - y2
          z = z1 - z2

sumTuple :: Num t => (t, t) -> (t, t) -> (t, t)
sumTuple (x, y) (k, j) = (x+k, y+j)

size :: Diretorio -> (Tamanho, Int)
size (Arquivo nome tamanho) = (tamanho, 1)
size (Pasta nome diretorios) = foldl (sumTuple) ((0, 0)) (map (size) (diretorios))


