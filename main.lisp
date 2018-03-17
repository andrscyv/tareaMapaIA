(setq abto '())
(setq p '(( nil nil 1) (nil nil 3) (nil nil 3) (nil nil 7) (nil nil 9)) )

;;Si n > lenght lst => regresa toda la lista
(defun primerosn (n lst)
	(if (<= n (length lst)) (reverse (nthcdr (- (length lst) n) (reverse lst))) lst))
;;Pruebas
;(print (primerosn 0 p))
;;(print (primerosn 6 p))

;;Regresa posición en donde insertar nodo por prioridad
(defun indicePrioridadAbto (nodo lst)
	(cond 
		((null lst))
		((<= (caddr nodo) (caddar lst)))
		(T (incf iPrioridadAbto) (indicePrioridadAbto nodo (cdr lst)))))
;pruebas
;(setq iPrioridadAbto 0)
;(print p)
;(indicePrioridadAbto '(nil nil 8) p)
;(print iPrioridadAbto )

;Inserta en lista abto con respecto a la prioridad (minimiza)
(defun insertaPrioridadAbto (nodo)
	(setq iPrioridadAbto 0) (indicePrioridadAbto nodo abto)
	(setq abto (append (primerosn iPrioridadAbto abto) (list nodo) (nthcdr iPrioridadAbto abto))))
;pruebas
;(setq abto p)
;(insertaPrioridadAbto '( nil nil 5))
;(print abto)

;(defun )