data LDisjointSet = LDS [[Int]] deriving (Eq, Show)
data TDisjointSet = Void | TDS [Int] TDisjointSet deriving (Eq, Show)
class OprDisjointSet t where
    makeSet :: Int -> t -> t
    union :: Int -> Int -> t -> t
    find :: Int -> t -> Maybe Int

instance OprDisjointSet LDisjointSet where
    find val (LDS conjs) | length(conj) == 0  = Nothing
                         | otherwise          = Just (head (head(conj)))
        where 
            conj = [x | x <- conjs, length([y | y <- x, y == val]) /= 0] 
            -- get the list where the element 'val' is in. x will be all lists of elements, y will be all elements
    union val1 val2 (LDS conjs) | find val1 (LDS conjs) == find val2 (LDS conjs) = LDS (rest ++ conjVal1)
                                | find val1 (LDS conjs) == Nothing               = LDS (rest ++ conjVal2)
                                | find val2 (LDS conjs) == Nothing               = LDS (rest ++ conjVal1)
                                | otherwise                                      = LDS (rest ++ new)
        where
            rest = [x | x <- conjs, length([y | y <- x, y == val1 || y == val2]) == 0]
            conjVal1 = [x | x <- conjs, length([y | y <- x, y == val1]) /= 0]
            conjVal2 = [x | x <- conjs, length([y | y <- x, y == val2]) /= 0]
            new = [head (conjVal1) ++ head (conjVal2)]
            {- 
                rest são os conjustos que não contém val1 nem val2
                conjVal1 é o conjunto que contém val1
                conjVal2 é o conjunto que contém val2   
                head of [[]] is []
            -}
    makeSet val (LDS conjs) | find val (LDS conjs) == Nothing  = LDS (conjs ++ [[val]])
                            | otherwise                        = LDS conjs

get :: Int -> Int -> TDisjointSet -> [Int]
get _ _ Void = []
get val1 val2 (TDS ids conjs) | length([x | x <- ids, x == val1 || x == val2]) == 0  = [] ++ get val1 val2 conjs
                              | otherwise                                            = ids ++ get val1 val2 conjs

exclude :: Int -> Int -> TDisjointSet -> TDisjointSet
exclude _ _ Void = Void
exclude val1 val2 (TDS ids conjs) | length([x | x <- ids, x == val1 || x == val2]) == 0  = TDS ids (exclude val1 val2 conjs)
                                  | otherwise                                            = exclude val1 val2 conjs

instance OprDisjointSet TDisjointSet where
    find val Void = Nothing
    find val (TDS ids conjs) | length(found) == 0 = find val conjs
                             | otherwise          = Just (head(ids))
        where
            found = [x | x <- ids, x == val]
    makeSet val Void = TDS ([val]) (Void)
    makeSet val (TDS ids conjs)  | find val (TDS ids conjs) == Nothing  = TDS ([val]) (TDS ids conjs)
                                 | otherwise                            = TDS ids conjs
    union val1 val2 Void = Void
    union val1 val2 (TDS ids conjs) | length(a) == 0  = TDS ids conjs
                                    | otherwise       = TDS a (exclude val1 val2 (TDS ids conjs))
        where
            a = get val1 val2 (TDS ids conjs)