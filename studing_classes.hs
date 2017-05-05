class MultiParamTypeClasses b k where
	push :: k -> b -> b
	pop :: b -> b

data Pilha t = Nil | Elem t (Pilha t)

instance Stack (Pilha t) t where
	push a Nil = Elem a Nil
	push a x = Elem a x

	pop Nil = Nil
	pop (Elem a rest) = rest