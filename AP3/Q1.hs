data Complex = Complex Double Double

instance Num Complex where
    (+) (Complex a b) (Complex c d) = Complex (a+c) (b+d)
    (-) (Complex a b) (Complex c d) = Complex (a-b) (b-d)
    negate (Complex a b) = Complex (-a) (-b)
    (*) (Complex a b) (Complex c d) = Complex (a*c - b*d) (a*d + b*c)
    abs (Complex a b) = Complex (sqrt (a*a + b*b)) 0
    signum (Complex a b) = Complex (a / md) (b / md)
        where md = sqrt(a*a + b*b)
    fromInteger a = Complex (fromInteger (a)) 0

instance Show Complex where
    show (Complex a b) | b < 0 = show a ++ " - " ++ show (-b) ++ "i"
                       | otherwise = show a ++ " + " ++ show b ++ "i"

instance Eq Complex where
    (==) (Complex a b) (Complex c d) = (a == c) && (b == d)
    (/=) (Complex a b) (Complex c d) = not (a == b)
