type Ponto = (Float, Float, Float)
type Nome  = String
type Tamanho = Int
data Diretorio = Pasta Nome [Diretorio] | Arquivo Nome Tamanho

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

